import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDatasetsRecord extends FirestoreRecord {
  UserDatasetsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dataset_id" field.
  String? _datasetId;
  String get datasetId => _datasetId ?? '';
  bool hasDatasetId() => _datasetId != null;

  // "dataset_name" field.
  String? _datasetName;
  String get datasetName => _datasetName ?? '';
  bool hasDatasetName() => _datasetName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "picture_url" field.
  String? _pictureUrl;
  String get pictureUrl => _pictureUrl ?? '';
  bool hasPictureUrl() => _pictureUrl != null;

  // "created_on" field.
  DateTime? _createdOn;
  DateTime? get createdOn => _createdOn;
  bool hasCreatedOn() => _createdOn != null;

  // "active_docs" field.
  List<String>? _activeDocs;
  List<String> get activeDocs => _activeDocs ?? const [];
  bool hasActiveDocs() => _activeDocs != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _datasetId = snapshotData['dataset_id'] as String?;
    _datasetName = snapshotData['dataset_name'] as String?;
    _description = snapshotData['description'] as String?;
    _pictureUrl = snapshotData['picture_url'] as String?;
    _createdOn = snapshotData['created_on'] as DateTime?;
    _activeDocs = getDataList(snapshotData['active_docs']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_datasets')
          : FirebaseFirestore.instance.collectionGroup('user_datasets');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_datasets').doc();

  static Stream<UserDatasetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserDatasetsRecord.fromSnapshot(s));

  static Future<UserDatasetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserDatasetsRecord.fromSnapshot(s));

  static UserDatasetsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserDatasetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserDatasetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserDatasetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserDatasetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserDatasetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserDatasetsRecordData({
  String? datasetId,
  String? datasetName,
  String? description,
  String? pictureUrl,
  DateTime? createdOn,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dataset_id': datasetId,
      'dataset_name': datasetName,
      'description': description,
      'picture_url': pictureUrl,
      'created_on': createdOn,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserDatasetsRecordDocumentEquality
    implements Equality<UserDatasetsRecord> {
  const UserDatasetsRecordDocumentEquality();

  @override
  bool equals(UserDatasetsRecord? e1, UserDatasetsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.datasetId == e2?.datasetId &&
        e1?.datasetName == e2?.datasetName &&
        e1?.description == e2?.description &&
        e1?.pictureUrl == e2?.pictureUrl &&
        e1?.createdOn == e2?.createdOn &&
        listEquality.equals(e1?.activeDocs, e2?.activeDocs);
  }

  @override
  int hash(UserDatasetsRecord? e) => const ListEquality().hash([
        e?.datasetId,
        e?.datasetName,
        e?.description,
        e?.pictureUrl,
        e?.createdOn,
        e?.activeDocs
      ]);

  @override
  bool isValidKey(Object? o) => o is UserDatasetsRecord;
}
