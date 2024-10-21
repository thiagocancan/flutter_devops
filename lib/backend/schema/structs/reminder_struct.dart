// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReminderStruct extends BaseStruct {
  ReminderStruct({
    String? title,
    String? description,
    int? type,
  })  : _title = title,
        _description = description,
        _type = type;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  set type(int? val) => _type = val;

  void incrementType(int amount) => type = type + amount;

  bool hasType() => _type != null;

  static ReminderStruct fromMap(Map<String, dynamic> data) => ReminderStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        type: castToType<int>(data['type']),
      );

  static ReminderStruct? maybeFromMap(dynamic data) =>
      data is Map ? ReminderStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.int,
        ),
      }.withoutNulls;

  static ReminderStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReminderStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ReminderStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReminderStruct &&
        title == other.title &&
        description == other.description &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([title, description, type]);
}

ReminderStruct createReminderStruct({
  String? title,
  String? description,
  int? type,
}) =>
    ReminderStruct(
      title: title,
      description: description,
      type: type,
    );
