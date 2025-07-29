import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _urlBase = prefs.getString('ff_urlBase') ?? _urlBase;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _overridecache = true;
  bool get overridecache => _overridecache;
  set overridecache(bool value) {
    _overridecache = value;
  }

  String _urlBase = 'https://fun-morning-butter-harris.trycloudflare.com';
  String get urlBase => _urlBase;
  set urlBase(String value) {
    _urlBase = value;
    prefs.setString('ff_urlBase', value);
  }

  final _remindersManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> reminders({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _remindersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRemindersCache() => _remindersManager.clear();
  void clearRemindersCacheKey(String? uniqueKey) =>
      _remindersManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
