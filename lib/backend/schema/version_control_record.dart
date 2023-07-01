import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VersionControlRecord extends FirestoreRecord {
  VersionControlRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "version" field.
  int? _version;
  int get version => _version ?? 0;
  bool hasVersion() => _version != null;

  // "needs_update" field.
  bool? _needsUpdate;
  bool get needsUpdate => _needsUpdate ?? false;
  bool hasNeedsUpdate() => _needsUpdate != null;

  void _initializeFields() {
    _version = castToType<int>(snapshotData['version']);
    _needsUpdate = snapshotData['needs_update'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('version_control');

  static Stream<VersionControlRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VersionControlRecord.fromSnapshot(s));

  static Future<VersionControlRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VersionControlRecord.fromSnapshot(s));

  static VersionControlRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VersionControlRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VersionControlRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VersionControlRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VersionControlRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VersionControlRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVersionControlRecordData({
  int? version,
  bool? needsUpdate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'version': version,
      'needs_update': needsUpdate,
    }.withoutNulls,
  );

  return firestoreData;
}

class VersionControlRecordDocumentEquality
    implements Equality<VersionControlRecord> {
  const VersionControlRecordDocumentEquality();

  @override
  bool equals(VersionControlRecord? e1, VersionControlRecord? e2) {
    return e1?.version == e2?.version && e1?.needsUpdate == e2?.needsUpdate;
  }

  @override
  int hash(VersionControlRecord? e) =>
      const ListEquality().hash([e?.version, e?.needsUpdate]);

  @override
  bool isValidKey(Object? o) => o is VersionControlRecord;
}
