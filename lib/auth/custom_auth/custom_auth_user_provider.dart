import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class Td1MobileAuthUser {
  Td1MobileAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<Td1MobileAuthUser> td1MobileAuthUserSubject =
    BehaviorSubject.seeded(Td1MobileAuthUser(loggedIn: false));
Stream<Td1MobileAuthUser> td1MobileAuthUserStream() => td1MobileAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);
