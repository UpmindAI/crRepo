import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SummPromptFavsRecord extends FirestoreRecord {
  SummPromptFavsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "prompt" field.
  String? _prompt;
  String get prompt => _prompt ?? '';
  bool hasPrompt() => _prompt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _prompt = snapshotData['prompt'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('summ_prompt_favs')
          : FirebaseFirestore.instance.collectionGroup('summ_prompt_favs');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('summ_prompt_favs').doc();

  static Stream<SummPromptFavsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SummPromptFavsRecord.fromSnapshot(s));

  static Future<SummPromptFavsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SummPromptFavsRecord.fromSnapshot(s));

  static SummPromptFavsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SummPromptFavsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SummPromptFavsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SummPromptFavsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SummPromptFavsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SummPromptFavsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSummPromptFavsRecordData({
  String? prompt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'prompt': prompt,
    }.withoutNulls,
  );

  return firestoreData;
}

class SummPromptFavsRecordDocumentEquality
    implements Equality<SummPromptFavsRecord> {
  const SummPromptFavsRecordDocumentEquality();

  @override
  bool equals(SummPromptFavsRecord? e1, SummPromptFavsRecord? e2) {
    return e1?.prompt == e2?.prompt;
  }

  @override
  int hash(SummPromptFavsRecord? e) => const ListEquality().hash([e?.prompt]);

  @override
  bool isValidKey(Object? o) => o is SummPromptFavsRecord;
}
