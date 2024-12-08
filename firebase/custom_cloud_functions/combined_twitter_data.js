const functions = require("firebase-functions");
const axios = require("axios");

// Retrieve RapidAPI key from Firebase environment variables
const rapidApiKey =
  functions.config().rapidapi.key ||
  "d50330d060mshba7d4705454c84ap129b6ajsn882a50aa4e6d";
const rapidApiHost = "twitter-api45.p.rapidapi.com";

exports.combinedTwitterData = functions.https.onRequest(async (req, res) => {
  try {
    // Retrieve the screenname and tweet_id from request parameters
    const screenname = req.query.screenname;
    const tweetId = req.query.tweet_id;

    // Check if the required parameters are provided
    if (!screenname) {
      return res.status(400).send({ error: "Screenname is required." });
    }

    // Set up API request options for each endpoint
    const options = (endpoint, params = {}) => ({
      method: "GET",
      url: `https://${rapidApiHost}/${endpoint}`,
      headers: {
        "X-RapidAPI-Key": rapidApiKey,
        "X-RapidAPI-Host": rapidApiHost,
      },
      params: { screenname, ...params },
    });

    // Define all API calls
    const apiCalls = [
      axios.request(options("screenname.php")),
      axios.request(options("following.php")),
      axios.request(options("followers.php")),
      axios.request(options("usermedia.php")),
      tweetId ? axios.request(options("tweet.php", { id: tweetId })) : null,
      axios.request(options("timeline.php")),
    ].filter(Boolean); // Filter out null calls if tweetId is not provided

    // Fetch all responses concurrently
    const [
      screennameResponse,
      followingResponse,
      followersResponse,
      userMediaResponse,
      tweetResponse,
      timelineResponse,
    ] = await Promise.all(apiCalls);

    // Combine the responses into a single object
    const combinedData = {
      screennameData: screennameResponse.data,
      followingData: followingResponse.data,
      followersData: followersResponse.data,
      userMediaData: userMediaResponse.data,
      tweetData: tweetResponse ? tweetResponse.data : null,
      timelineData: timelineResponse.data,
    };

    // Send the combined response back to the client
    res.status(200).send(combinedData);
  } catch (error) {
    console.error("Error combining Twitter API data:", error);
    res.status(500).send({ error: "Failed to retrieve data" });
  }
});
