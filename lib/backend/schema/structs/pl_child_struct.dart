// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlChildStruct extends FFFirebaseStruct {
  PlChildStruct({
    String? folderName,
    DocumentReference? docRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _folderName = folderName,
        _docRef = docRef,
        super(firestoreUtilData);

  // "folder_name" field.
  String? _folderName;
  String get folderName => _folderName ?? '';
  set folderName(String? val) => _folderName = val;
  bool hasFolderName() => _folderName != null;

  // "doc_ref" field.
  DocumentReference? _docRef;
  DocumentReference? get docRef => _docRef;
  set docRef(DocumentReference? val) => _docRef = val;
  bool hasDocRef() => _docRef != null;

  static PlChildStruct fromMap(Map<String, dynamic> data) => PlChildStruct(
        folderName: data['folder_name'] as String?,
        docRef: data['doc_ref'] as DocumentReference?,
      );

  static PlChildStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PlChildStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'folder_name': _folderName,
        'doc_ref': _docRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'folder_name': serializeParam(
          _folderName,
          ParamType.String,
        ),
        'doc_ref': serializeParam(
          _docRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static PlChildStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlChildStruct(
        folderName: deserializeParam(
          data['folder_name'],
          ParamType.String,
          false,
        ),
        docRef: deserializeParam(
          data['doc_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users', 'promptlab_sub0'],
        ),
      );

  @override
  String toString() => 'PlChildStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlChildStruct &&
        folderName == other.folderName &&
        docRef == other.docRef;
  }

  @override
  int get hashCode => const ListEquality().hash([folderName, docRef]);
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
      folderName: folderName,
      docRef: docRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlChildStruct? updatePlChildStruct(
  PlChildStruct? plChild, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    plChild
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

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
}

Map<String, dynamic> getPlChildFirestoreData(
  PlChildStruct? plChild, [
  bool forFieldValue = false,
]) {
  if (plChild == null) {
    return {};
  }
  final firestoreData = mapToFirestore(plChild.toMap());

  // Add any Firestore field values
  plChild.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlChildListFirestoreData(
  List<PlChildStruct>? plChilds,
) =>
    plChilds?.map((e) => getPlChildFirestoreData(e, true)).toList() ?? [];
