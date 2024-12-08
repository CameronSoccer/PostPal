import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start xdata Group Code

class XdataGroup {
  static String getBaseUrl() => 'https://twitter-api45.p.rapidapi.com';
  static Map<String, String> headers = {
    'X-Rapidapi-Key': 'd50330d060mshba7d4705454c84ap129b6ajsn882a50aa4e6d',
  };
  static UsermediaCall usermediaCall = UsermediaCall();
  static TweetdataCall tweetdataCall = TweetdataCall();
}

class UsermediaCall {
  Future<ApiCallResponse> call({
    String? screenname = '',
    String? page = '',
  }) async {
    final baseUrl = XdataGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'usermedia',
      apiUrl: '$baseUrl/usermedia.php?screenname=$screenname',
      callType: ApiCallType.GET,
      headers: {
        'X-Rapidapi-Key': 'd50330d060mshba7d4705454c84ap129b6ajsn882a50aa4e6d',
      },
      params: {
        'screenname': screenname,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? username(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.name''',
      ));
  String? userprofile(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.profile''',
      ));
  String? userpic(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.avatar''',
      ));
  int? following(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.friends''',
      ));
  int? followers(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.sub_count''',
      ));
  List<String>? tweettimeline(dynamic response) => (getJsonField(
        response,
        r'''$.timeline[:].tweet_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? timelineJSON(dynamic response) => getJsonField(
        response,
        r'''$.timeline''',
        true,
      ) as List?;
  List<String>? timelinetweettext(dynamic response) => (getJsonField(
        response,
        r'''$.timeline[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? timelinetweetmedia(dynamic response) => getJsonField(
        response,
        r'''$.timeline[:].media''',
        true,
      ) as List?;
  List<String>? timelinetweetcreateddate(dynamic response) => (getJsonField(
        response,
        r'''$.timeline[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? timelinemediaphoto(dynamic response) => getJsonField(
        response,
        r'''$.timeline[:].media.photo''',
        true,
      ) as List?;
  List<String>? mediaurlhttps(dynamic response) => (getJsonField(
        response,
        r'''$.timeline[:].media.photo[:].media_url_https''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class TweetdataCall {
  Future<ApiCallResponse> call({
    List<String>? tweetidList,
  }) async {
    final baseUrl = XdataGroup.getBaseUrl();
    final tweetid = _serializeList(tweetidList);

    return ApiManager.instance.makeApiCall(
      callName: 'tweetdata',
      apiUrl: '$baseUrl/tweet.php?id=',
      callType: ApiCallType.GET,
      headers: {
        'X-Rapidapi-Key': 'd50330d060mshba7d4705454c84ap129b6ajsn882a50aa4e6d',
      },
      params: {
        'tweetid': tweetid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? createddate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.created_at''',
      ));
  List? hashtags(dynamic response) => getJsonField(
        response,
        r'''$.entities.hashtags''',
        true,
      ) as List?;
  String? text(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.display_text''',
      ));
  String? media(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.entities.media[:].url''',
      ));
}

/// End xdata Group Code

/// Start Tiktok Group Code

class TiktokGroup {
  static String getBaseUrl() => 'https://open.tiktokapis.com/v2';
  static Map<String, String> headers = {};
  static OauthCall oauthCall = OauthCall();
  static AccessCall accessCall = AccessCall();
  static VideoUploadCall videoUploadCall = VideoUploadCall();
}

class OauthCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = TiktokGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'oauth',
      apiUrl: '$baseUrl/auth/authorize/',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'redirect_uri': "1",
        'scope': "2",
        'response_type': "3",
        'client_key': "4",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AccessCall {
  Future<ApiCallResponse> call({
    String? clientKey = '',
    String? clientSecret = '',
    dynamic codeJson,
    dynamic grantTypeJson,
  }) async {
    final baseUrl = TiktokGroup.getBaseUrl();

    final code = _serializeJson(codeJson);
    final grantType = _serializeJson(grantTypeJson);

    return ApiManager.instance.makeApiCall(
      callName: 'access',
      apiUrl: '$baseUrl/oauth/access_token',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VideoUploadCall {
  Future<ApiCallResponse> call({
    String? videoupload = '',
  }) async {
    final baseUrl = TiktokGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'video upload',
      apiUrl: '${baseUrl}post/publish/video/init/\'',
      callType: ApiCallType.POST,
      headers: {
        'Bearer': '<access_token>',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Tiktok Group Code

/// Start ElevenLabs Group Code

class ElevenLabsGroup {
  static String getBaseUrl() => 'https://api.elevenlabs.io/v1';
  static Map<String, String> headers = {
    'xi-api-key': 'sk_de8dc9f7c6066dcc05ad3fcaea7f9defb03437c877c78983',
  };
  static VoicesCall voicesCall = VoicesCall();
  static TexttospeechCall texttospeechCall = TexttospeechCall();
}

class VoicesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = ElevenLabsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Voices',
      apiUrl: '$baseUrl/voices',
      callType: ApiCallType.GET,
      headers: {
        'xi-api-key': 'sk_de8dc9f7c6066dcc05ad3fcaea7f9defb03437c877c78983',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.voices[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? voiceid(dynamic response) => (getJsonField(
        response,
        r'''$.voices[:].voice_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? previewurl(dynamic response) => (getJsonField(
        response,
        r'''$.voices[:].preview_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class TexttospeechCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? files,
    String? name = '',
  }) async {
    final baseUrl = ElevenLabsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'texttospeech',
      apiUrl: '$baseUrl/text-to-speech/{voice_id}',
      callType: ApiCallType.POST,
      headers: {
        'xi-api-key': 'sk_de8dc9f7c6066dcc05ad3fcaea7f9defb03437c877c78983',
      },
      params: {
        'name': name,
        'files': files,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End ElevenLabs Group Code

class TiktokloginCall {
  static Future<ApiCallResponse> call({
    String? redirectUrl = '',
    String? responseType = '',
    String? state = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'tiktoklogin',
      apiUrl: 'https://www.tiktok.com/v2/auth/authorize/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'client_key': "sbaw70a6ixf0ktsnhb",
        'redirect_url': redirectUrl,
        'response_type': responseType,
        'scope': "video.upload video.publish user.info.basic",
        'state': state,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
