import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeatureRecord extends FirestoreRecord {
  FeatureRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "iwant" field.
  String? _iwant;
  String get iwant => _iwant ?? '';
  bool hasIwant() => _iwant != null;

  // "because" field.
  String? _because;
  String get because => _because ?? '';
  bool hasBecause() => _because != null;

  // "additional" field.
  String? _additional;
  String get additional => _additional ?? '';
  bool hasAdditional() => _additional != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _iwant = snapshotData['iwant'] as String?;
    _because = snapshotData['because'] as String?;
    _additional = snapshotData['additional'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('feature');

  static Stream<FeatureRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeatureRecord.fromSnapshot(s));

  static Future<FeatureRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeatureRecord.fromSnapshot(s));

  static FeatureRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeatureRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeatureRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeatureRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeatureRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeatureRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeatureRecordData({
  String? iwant,
  String? because,
  String? additional,
  DocumentReference? userRef,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'iwant': iwant,
      'because': because,
      'additional': additional,
      'user_ref': userRef,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeatureRecordDocumentEquality implements Equality<FeatureRecord> {
  const FeatureRecordDocumentEquality();

  @override
  bool equals(FeatureRecord? e1, FeatureRecord? e2) {
    return e1?.iwant == e2?.iwant &&
        e1?.because == e2?.because &&
        e1?.additional == e2?.additional &&
        e1?.userRef == e2?.userRef &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(FeatureRecord? e) => const ListEquality()
      .hash([e?.iwant, e?.because, e?.additional, e?.userRef, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is FeatureRecord;
}
