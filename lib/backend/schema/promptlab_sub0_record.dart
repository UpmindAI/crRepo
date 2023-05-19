import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromptlabSub0Record extends FirestoreRecord {
  PromptlabSub0Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "folderName" field.
  String? _folderName;
  String get folderName => _folderName ?? '';
  bool hasFolderName() => _folderName != null;

  // "prompts" field.
  List<PromptsStruct>? _prompts;
  List<PromptsStruct> get prompts => _prompts ?? const [];
  bool hasPrompts() => _prompts != null;

  // "parent" field.
  DocumentReference? _parent;
  DocumentReference? get parent => _parent;
  bool hasParent() => _parent != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _folderName = snapshotData['folderName'] as String?;
    _prompts = getStructList(
      snapshotData['prompts'],
      PromptsStruct.fromMap,
    );
    _parent = snapshotData['parent'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('promptlab_sub0')
          : FirebaseFirestore.instance.collectionGroup('promptlab_sub0');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('promptlab_sub0').doc();

  static Stream<PromptlabSub0Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromptlabSub0Record.fromSnapshot(s));

  static Future<PromptlabSub0Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromptlabSub0Record.fromSnapshot(s));

  static PromptlabSub0Record fromSnapshot(DocumentSnapshot snapshot) =>
      PromptlabSub0Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromptlabSub0Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromptlabSub0Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromptlabSub0Record(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createPromptlabSub0RecordData({
  String? folderName,
  DocumentReference? parent,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'folderName': folderName,
      'parent': parent,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}
