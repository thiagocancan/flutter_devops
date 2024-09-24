import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Lembretes Group Code

class LembretesGroup {
  static String getBaseUrl() => 'http://127.0.0.1:8000/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static RegisterCall registerCall = RegisterCall();
  static LoginCall loginCall = LoginCall();
  static LogoutCall logoutCall = LogoutCall();
  static GetUserCall getUserCall = GetUserCall();
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

  dynamic userId(dynamic response) => getJsonField(
        response,
        r'''$.user.id''',
      );
  dynamic jwt(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.user.name''',
      );
  dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.user.email''',
      );
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

  dynamic userId(dynamic response) => getJsonField(
        response,
        r'''$.user.id''',
      );
  dynamic jwt(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.user.name''',
      );
  dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.user.email''',
      );
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
