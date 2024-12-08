const admin = require("firebase-admin/app");
admin.initializeApp();

const combinedTwitterData = require("./combined_twitter_data.js");
exports.combinedTwitterData = combinedTwitterData.combinedTwitterData;
