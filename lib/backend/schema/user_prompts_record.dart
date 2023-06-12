import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserPromptsRecord extends FirestoreRecord {
  UserPromptsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "qid" field.
  String? _qid;
  String get qid => _qid ?? '';
  bool hasQid() => _qid != null;

  // "prompt" field.
  String? _prompt;
  String get prompt => _prompt ?? '';
  bool hasPrompt() => _prompt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _qid = snapshotData['qid'] as String?;
    _prompt = snapshotData['prompt'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_prompts')
          : FirebaseFirestore.instance.collectionGroup('user_prompts');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_prompts').doc();

  static Stream<UserPromptsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserPromptsRecord.fromSnapshot(s));

  static Future<UserPromptsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserPromptsRecord.fromSnapshot(s));

  static UserPromptsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserPromptsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserPromptsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserPromptsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserPromptsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserPromptsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserPromptsRecordData({
  String? qid,
  String? prompt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'qid': qid,
      'prompt': prompt,
    }.withoutNulls,
  );

  return firestoreData;
}
