import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SummarizerTemplatesRecord extends FirestoreRecord {
  SummarizerTemplatesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "template" field.
  List<String>? _template;
  List<String> get template => _template ?? const [];
  bool hasTemplate() => _template != null;

  void _initializeFields() {
    _template = getDataList(snapshotData['template']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('summarizer_templates');

  static Stream<SummarizerTemplatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SummarizerTemplatesRecord.fromSnapshot(s));

  static Future<SummarizerTemplatesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SummarizerTemplatesRecord.fromSnapshot(s));

  static SummarizerTemplatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SummarizerTemplatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SummarizerTemplatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SummarizerTemplatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SummarizerTemplatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SummarizerTemplatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSummarizerTemplatesRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class SummarizerTemplatesRecordDocumentEquality
    implements Equality<SummarizerTemplatesRecord> {
  const SummarizerTemplatesRecordDocumentEquality();

  @override
  bool equals(SummarizerTemplatesRecord? e1, SummarizerTemplatesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.template, e2?.template);
  }

  @override
  int hash(SummarizerTemplatesRecord? e) =>
      const ListEquality().hash([e?.template]);

  @override
  bool isValidKey(Object? o) => o is SummarizerTemplatesRecord;
}
