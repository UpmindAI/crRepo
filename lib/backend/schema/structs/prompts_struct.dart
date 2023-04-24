import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'prompts_struct.g.dart';

abstract class PromptsStruct
    implements Built<PromptsStruct, PromptsStructBuilder> {
  static Serializer<PromptsStruct> get serializer => _$promptsStructSerializer;

  String? get name;

  String? get prompt;

  DateTime? get timestamp;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(PromptsStructBuilder builder) => builder
    ..name = ''
    ..prompt = ''
    ..firestoreUtilData = FirestoreUtilData();

  PromptsStruct._();
  factory PromptsStruct([void Function(PromptsStructBuilder) updates]) =
      _$PromptsStruct;
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
      (p) => p
        ..name = name
        ..prompt = prompt
        ..timestamp = timestamp
        ..firestoreUtilData = FirestoreUtilData(
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
    prompts != null
        ? (prompts.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

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

  return;
}

Map<String, dynamic> getPromptsFirestoreData(
  PromptsStruct? prompts, [
  bool forFieldValue = false,
]) {
  if (prompts == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(PromptsStruct.serializer, prompts);

  // Add any Firestore field values
  prompts.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPromptsListFirestoreData(
  List<PromptsStruct>? promptss,
) =>
    promptss?.map((p) => getPromptsFirestoreData(p, true)).toList() ?? [];
