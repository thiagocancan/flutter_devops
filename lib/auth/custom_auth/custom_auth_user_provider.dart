import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class OutNotesAuthUser {
  OutNotesAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<OutNotesAuthUser> outNotesAuthUserSubject =
    BehaviorSubject.seeded(OutNotesAuthUser(loggedIn: false));
Stream<OutNotesAuthUser> outNotesAuthUserStream() => outNotesAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);
