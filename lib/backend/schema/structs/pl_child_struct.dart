import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'pl_child_struct.g.dart';

abstract class PlChildStruct
    implements Built<PlChildStruct, PlChildStructBuilder> {
  static Serializer<PlChildStruct> get serializer => _$plChildStructSerializer;

  @BuiltValueField(wireName: 'folder_name')
  String? get folderName;

  @BuiltValueField(wireName: 'doc_ref')
  DocumentReference? get docRef;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(PlChildStructBuilder builder) => builder
    ..folderName = ''
    ..firestoreUtilData = FirestoreUtilData();

  PlChildStruct._();
  factory PlChildStruct([void Function(PlChildStructBuilder) updates]) =
      _$PlChildStruct;
}

PlChildStruct createPlChildStruct({
  String? folderName,
  DocumentReference? docRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlChildStruct(
      (p) => p
        ..folderName = folderName
        ..docRef = docRef
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

PlChildStruct? updatePlChildStruct(
  PlChildStruct? plChild, {
  bool clearUnsetFields = true,
}) =>
    plChild != null
        ? (plChild.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addPlChildStructData(
  Map<String, dynamic> firestoreData,
  PlChildStruct? plChild,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (plChild == null) {
    return;
  }
  if (plChild.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && plChild.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final plChildData = getPlChildFirestoreData(plChild, forFieldValue);
  final nestedData = plChildData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = plChild.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getPlChildFirestoreData(
  PlChildStruct? plChild, [
  bool forFieldValue = false,
]) {
  if (plChild == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(PlChildStruct.serializer, plChild);

  // Add any Firestore field values
  plChild.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlChildListFirestoreData(
  List<PlChildStruct>? plChilds,
) =>
    plChilds?.map((p) => getPlChildFirestoreData(p, true)).toList() ?? [];
