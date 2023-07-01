import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppdataRecord extends FirestoreRecord {
  AppdataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "chat_image" field.
  String? _chatImage;
  String get chatImage => _chatImage ?? '';
  bool hasChatImage() => _chatImage != null;

  void _initializeFields() {
    _chatImage = snapshotData['chat_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appdata');

  static Stream<AppdataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppdataRecord.fromSnapshot(s));

  static Future<AppdataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppdataRecord.fromSnapshot(s));

  static AppdataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppdataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppdataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppdataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppdataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppdataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppdataRecordData({
  String? chatImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chat_image': chatImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppdataRecordDocumentEquality implements Equality<AppdataRecord> {
  const AppdataRecordDocumentEquality();

  @override
  bool equals(AppdataRecord? e1, AppdataRecord? e2) {
    return e1?.chatImage == e2?.chatImage;
  }

  @override
  int hash(AppdataRecord? e) => const ListEquality().hash([e?.chatImage]);

  @override
  bool isValidKey(Object? o) => o is AppdataRecord;
}
