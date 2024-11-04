import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Lembretes Group Code

class LembretesGroup {
  static String getBaseUrl() =>
      'https://therefore-tyler-walked-protecting.trycloudflare.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static RegisterCall registerCall = RegisterCall();
  static LoginCall loginCall = LoginCall();
  static LogoutCall logoutCall = LogoutCall();
  static GetUserCall getUserCall = GetUserCall();
  static CreateRemindersCall createRemindersCall = CreateRemindersCall();
  static GetRemindersCall getRemindersCall = GetRemindersCall();
  static DeleteRemindersCall deleteRemindersCall = DeleteRemindersCall();
  static UpdateUserCall updateUserCall = UpdateUserCall();
}

class RegisterCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
    String? passwordConfirmation = '',
  }) async {
    final baseUrl = LembretesGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
"name": "$name",
"email": "$email",
"password": "$password",
"password_confirmation": "$passwordConfirmation"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register',
      apiUrl: '$baseUrl/api/register',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? userId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.id''',
      ));
  String? jwt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.name''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.email''',
      ));
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = LembretesGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '$baseUrl/api/login',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? userId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.id''',
      ));
  String? jwt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.name''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.email''',
      ));
}

class LogoutCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    final baseUrl = LembretesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Logout',
      apiUrl: '$baseUrl/api/logout',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    final baseUrl = LembretesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get user',
      apiUrl: '$baseUrl/api/user',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt',
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
}

class CreateRemindersCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
    String? title = '',
    int? type,
    String? alert = '',
    String? repeat = '',
    String? duration = '',
    String? description = '',
    String? color = '',
  }) async {
    final baseUrl = LembretesGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
"title": "$title",
"description": "$description",
"type": $type,
"alert": "$alert",
"repeat": "$repeat",
"duration": "$duration",
"color": "$color"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create reminders',
      apiUrl: '$baseUrl/api/reminders',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRemindersCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    final baseUrl = LembretesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'get reminders',
      apiUrl: '$baseUrl/api/reminders',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt',
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

  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.reminders[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.reminders[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? reminders(dynamic response) => getJsonField(
        response,
        r'''$.reminders''',
        true,
      ) as List?;
}

class DeleteRemindersCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
    String? reminderId = '',
  }) async {
    final baseUrl = LembretesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'delete reminders',
      apiUrl: '$baseUrl/api/reminders/$reminderId',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt',
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
}

class UpdateUserCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
    String? image = '',
    String? name = '',
  }) async {
    final baseUrl = LembretesGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "$name",
  "image": "$image"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update user',
      apiUrl: '$baseUrl/api/user',
      callType: ApiCallType.PUT,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Lembretes Group Code

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
