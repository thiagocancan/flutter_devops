// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? uid,
    String? displayName,
    String? displayEmail,
    String? createTime,
    String? img,
  })  : _uid = uid,
        _displayName = displayName,
        _displayEmail = displayEmail,
        _createTime = createTime,
        _img = img;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;

  bool hasDisplayName() => _displayName != null;

  // "display_email" field.
  String? _displayEmail;
  String get displayEmail => _displayEmail ?? '';
  set displayEmail(String? val) => _displayEmail = val;

  bool hasDisplayEmail() => _displayEmail != null;

  // "create_time" field.
  String? _createTime;
  String get createTime => _createTime ?? '';
  set createTime(String? val) => _createTime = val;

  bool hasCreateTime() => _createTime != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;

  bool hasImg() => _img != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        uid: data['uid'] as String?,
        displayName: data['display_name'] as String?,
        displayEmail: data['display_email'] as String?,
        createTime: data['create_time'] as String?,
        img: data['img'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'uid': _uid,
        'display_name': _displayName,
        'display_email': _displayEmail,
        'create_time': _createTime,
        'img': _img,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'display_name': serializeParam(
          _displayName,
          ParamType.String,
        ),
        'display_email': serializeParam(
          _displayEmail,
          ParamType.String,
        ),
        'create_time': serializeParam(
          _createTime,
          ParamType.String,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        displayName: deserializeParam(
          data['display_name'],
          ParamType.String,
          false,
        ),
        displayEmail: deserializeParam(
          data['display_email'],
          ParamType.String,
          false,
        ),
        createTime: deserializeParam(
          data['create_time'],
          ParamType.String,
          false,
        ),
        img: deserializeParam(
          data['img'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        uid == other.uid &&
        displayName == other.displayName &&
        displayEmail == other.displayEmail &&
        createTime == other.createTime &&
        img == other.img;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([uid, displayName, displayEmail, createTime, img]);
}

UserStruct createUserStruct({
  String? uid,
  String? displayName,
  String? displayEmail,
  String? createTime,
  String? img,
}) =>
    UserStruct(
      uid: uid,
      displayName: displayName,
      displayEmail: displayEmail,
      createTime: createTime,
      img: img,
    );
