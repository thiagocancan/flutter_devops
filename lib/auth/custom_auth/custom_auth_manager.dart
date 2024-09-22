import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom_auth_user_provider.dart';

export 'custom_auth_manager.dart';

const _kAuthTokenKey = '_auth_authentication_token_';
const _kRefreshTokenKey = '_auth_refresh_token_';
const _kTokenExpirationKey = '_auth_token_expiration_';
const _kUidKey = '_auth_uid_';
const _kUserDataKey = '_auth_user_data_';

class CustomAuthManager {
  // Auth session attributes
  String? authenticationToken;
  String? refreshToken;
  DateTime? tokenExpiration;
  // User attributes
  String? uid;

  Future signOut() async {
    authenticationToken = null;
    refreshToken = null;
    tokenExpiration = null;
    uid = null;

    // Update the current user.
    td1MobileAuthUserSubject.add(
      Td1MobileAuthUser(loggedIn: false),
    );
    persistAuthData();
  }

  Future<Td1MobileAuthUser?> signIn({
    String? authenticationToken,
    String? refreshToken,
    DateTime? tokenExpiration,
    String? authUid,
  }) async =>
      _updateCurrentUser(
        authenticationToken: authenticationToken,
        refreshToken: refreshToken,
        tokenExpiration: tokenExpiration,
        authUid: authUid,
      );

  void updateAuthUserData({
    String? authenticationToken,
    String? refreshToken,
    DateTime? tokenExpiration,
    String? authUid,
  }) {
    assert(
      currentUser?.loggedIn ?? false,
      'User must be logged in to update auth user data.',
    );

    _updateCurrentUser(
      authenticationToken: authenticationToken,
      refreshToken: refreshToken,
      tokenExpiration: tokenExpiration,
      authUid: authUid,
    );
  }

  Td1MobileAuthUser? _updateCurrentUser({
    String? authenticationToken,
    String? refreshToken,
    DateTime? tokenExpiration,
    String? authUid,
  }) {
    this.authenticationToken = authenticationToken;
    this.refreshToken = refreshToken;
    this.tokenExpiration = tokenExpiration;
    uid = authUid;

    // Update the current user stream.
    final updatedUser = Td1MobileAuthUser(
      loggedIn: true,
      uid: authUid,
    );
    td1MobileAuthUserSubject.add(updatedUser);
    persistAuthData();
    return updatedUser;
  }

  late SharedPreferences _prefs;
  Future initialize() async {
    _prefs = await SharedPreferences.getInstance();

    try {
      authenticationToken = _prefs.getString(_kAuthTokenKey);
      refreshToken = _prefs.getString(_kRefreshTokenKey);
      tokenExpiration = _prefs.getInt(_kTokenExpirationKey) != null
          ? DateTime.fromMillisecondsSinceEpoch(
              _prefs.getInt(_kTokenExpirationKey)!)
          : null;
      uid = _prefs.getString(_kUidKey);
    } catch (e) {
      if (kDebugMode) {
        print('Error initializing auth: $e');
      }
      return;
    }

    final authTokenExists = authenticationToken != null;
    final tokenExpired =
        tokenExpiration != null && tokenExpiration!.isBefore(DateTime.now());
    final updatedUser = Td1MobileAuthUser(
      loggedIn: authTokenExists && !tokenExpired,
      uid: uid,
    );
    td1MobileAuthUserSubject.add(updatedUser);
  }

  void persistAuthData() {
    authenticationToken != null
        ? _prefs.setString(_kAuthTokenKey, authenticationToken!)
        : _prefs.remove(_kAuthTokenKey);
    refreshToken != null
        ? _prefs.setString(_kRefreshTokenKey, refreshToken!)
        : _prefs.remove(_kRefreshTokenKey);
    tokenExpiration != null
        ? _prefs.setInt(
            _kTokenExpirationKey, tokenExpiration!.millisecondsSinceEpoch)
        : _prefs.remove(_kTokenExpirationKey);
    uid != null ? _prefs.setString(_kUidKey, uid!) : _prefs.remove(_kUidKey);
  }
}

Td1MobileAuthUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
