import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SummPromptHistoryRecord extends FirestoreRecord {
  SummPromptHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "prompt" field.
  String? _prompt;
  String get prompt => _prompt ?? '';
  bool hasPrompt() => _prompt != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "is_favorite" field.
  bool? _isFavorite;
  bool get isFavorite => _isFavorite ?? false;
  bool hasIsFavorite() => _isFavorite != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _prompt = snapshotData['prompt'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _isFavorite = snapshotData['is_favorite'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('summ_prompt_history')
          : FirebaseFirestore.instance.collectionGroup('summ_prompt_history');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('summ_prompt_history').doc();

  static Stream<SummPromptHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SummPromptHistoryRecord.fromSnapshot(s));

  static Future<SummPromptHistoryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SummPromptHistoryRecord.fromSnapshot(s));

  static SummPromptHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SummPromptHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SummPromptHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SummPromptHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SummPromptHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SummPromptHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSummPromptHistoryRecordData({
  String? prompt,
  DateTime? timestamp,
  bool? isFavorite,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'prompt': prompt,
      'timestamp': timestamp,
      'is_favorite': isFavorite,
    }.withoutNulls,
  );

  return firestoreData;
}

class SummPromptHistoryRecordDocumentEquality
    implements Equality<SummPromptHistoryRecord> {
  const SummPromptHistoryRecordDocumentEquality();

  @override
  bool equals(SummPromptHistoryRecord? e1, SummPromptHistoryRecord? e2) {
    return e1?.prompt == e2?.prompt &&
        e1?.timestamp == e2?.timestamp &&
        e1?.isFavorite == e2?.isFavorite;
  }

  @override
  int hash(SummPromptHistoryRecord? e) =>
      const ListEquality().hash([e?.prompt, e?.timestamp, e?.isFavorite]);

  @override
  bool isValidKey(Object? o) => o is SummPromptHistoryRecord;
}
