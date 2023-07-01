import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromptlabRecord extends FirestoreRecord {
  PromptlabRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "prompts" field.
  List<PromptsStruct>? _prompts;
  List<PromptsStruct> get prompts => _prompts ?? const [];
  bool hasPrompts() => _prompts != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "folder_name" field.
  String? _folderName;
  String get folderName => _folderName ?? '';
  bool hasFolderName() => _folderName != null;

  // "children" field.
  List<PlChildStruct>? _children;
  List<PlChildStruct> get children => _children ?? const [];
  bool hasChildren() => _children != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _prompts = getStructList(
      snapshotData['prompts'],
      PromptsStruct.fromMap,
    );
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _folderName = snapshotData['folder_name'] as String?;
    _children = getStructList(
      snapshotData['children'],
      PlChildStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('promptlab')
          : FirebaseFirestore.instance.collectionGroup('promptlab');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('promptlab').doc();

  static Stream<PromptlabRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromptlabRecord.fromSnapshot(s));

  static Future<PromptlabRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromptlabRecord.fromSnapshot(s));

  static PromptlabRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromptlabRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromptlabRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromptlabRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromptlabRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromptlabRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromptlabRecordData({
  DateTime? timestamp,
  String? folderName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timestamp': timestamp,
      'folder_name': folderName,
    }.withoutNulls,
  );

  return firestoreData;
}

class PromptlabRecordDocumentEquality implements Equality<PromptlabRecord> {
  const PromptlabRecordDocumentEquality();

  @override
  bool equals(PromptlabRecord? e1, PromptlabRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.prompts, e2?.prompts) &&
        e1?.timestamp == e2?.timestamp &&
        e1?.folderName == e2?.folderName &&
        listEquality.equals(e1?.children, e2?.children);
  }

  @override
  int hash(PromptlabRecord? e) => const ListEquality()
      .hash([e?.prompts, e?.timestamp, e?.folderName, e?.children]);

  @override
  bool isValidKey(Object? o) => o is PromptlabRecord;
}
