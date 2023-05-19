// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromptsStruct extends FFFirebaseStruct {
  PromptsStruct({
    String? name,
    String? prompt,
    DateTime? timestamp,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _prompt = prompt,
        _timestamp = timestamp,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "prompt" field.
  String? _prompt;
  String get prompt => _prompt ?? '';
  set prompt(String? val) => _prompt = val;
  bool hasPrompt() => _prompt != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;
  bool hasTimestamp() => _timestamp != null;

  static PromptsStruct fromMap(Map<String, dynamic> data) => PromptsStruct(
        name: data['name'] as String?,
        prompt: data['prompt'] as String?,
        timestamp: data['timestamp'] as DateTime?,
      );

  static PromptsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PromptsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'prompt': _prompt,
        'timestamp': _timestamp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'prompt': serializeParam(
          _prompt,
          ParamType.String,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static PromptsStruct fromSerializableMap(Map<String, dynamic> data) =>
      PromptsStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        prompt: deserializeParam(
          data['prompt'],
          ParamType.String,
          false,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'PromptsStruct(${toMap()})';
}

PromptsStruct createPromptsStruct({
  String? name,
  String? prompt,
  DateTime? timestamp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PromptsStruct(
      name: name,
      prompt: prompt,
      timestamp: timestamp,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PromptsStruct? updatePromptsStruct(
  PromptsStruct? prompts, {
  bool clearUnsetFields = true,
}) =>
    prompts
      ?..firestoreUtilData =
          FirestoreUtilData(clearUnsetFields: clearUnsetFields);

void addPromptsStructData(
  Map<String, dynamic> firestoreData,
  PromptsStruct? prompts,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (prompts == null) {
    return;
  }
  if (prompts.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && prompts.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final promptsData = getPromptsFirestoreData(prompts, forFieldValue);
  final nestedData = promptsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = prompts.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPromptsFirestoreData(
  PromptsStruct? prompts, [
  bool forFieldValue = false,
]) {
  if (prompts == null) {
    return {};
  }
  final firestoreData = mapToFirestore(prompts.toMap());

  // Add any Firestore field values
  prompts.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPromptsListFirestoreData(
  List<PromptsStruct>? promptss,
) =>
    promptss?.map((e) => getPromptsFirestoreData(e, true)).toList() ?? [];
