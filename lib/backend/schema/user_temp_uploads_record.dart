import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserTempUploadsRecord extends FirestoreRecord {
  UserTempUploadsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "doc_title" field.
  String? _docTitle;
  String get docTitle => _docTitle ?? '';
  bool hasDocTitle() => _docTitle != null;

  // "doc_id" field.
  String? _docId;
  String get docId => _docId ?? '';
  bool hasDocId() => _docId != null;

  // "dataset_name" field.
  String? _datasetName;
  String get datasetName => _datasetName ?? '';
  bool hasDatasetName() => _datasetName != null;

  // "dataset_id" field.
  String? _datasetId;
  String get datasetId => _datasetId ?? '';
  bool hasDatasetId() => _datasetId != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "chunk_size" field.
  double? _chunkSize;
  double get chunkSize => _chunkSize ?? 0.0;
  bool hasChunkSize() => _chunkSize != null;

  // "urls" field.
  String? _urls;
  String get urls => _urls ?? '';
  bool hasUrls() => _urls != null;

  // "url_id" field.
  String? _urlId;
  String get urlId => _urlId ?? '';
  bool hasUrlId() => _urlId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _docTitle = snapshotData['doc_title'] as String?;
    _docId = snapshotData['doc_id'] as String?;
    _datasetName = snapshotData['dataset_name'] as String?;
    _datasetId = snapshotData['dataset_id'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _chunkSize = castToType<double>(snapshotData['chunk_size']);
    _urls = snapshotData['urls'] as String?;
    _urlId = snapshotData['url_id'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_temp_uploads')
          : FirebaseFirestore.instance.collectionGroup('user_temp_uploads');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_temp_uploads').doc();

  static Stream<UserTempUploadsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserTempUploadsRecord.fromSnapshot(s));

  static Future<UserTempUploadsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserTempUploadsRecord.fromSnapshot(s));

  static UserTempUploadsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserTempUploadsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserTempUploadsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserTempUploadsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserTempUploadsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createUserTempUploadsRecordData({
  String? docTitle,
  String? docId,
  String? datasetName,
  String? datasetId,
  DateTime? timestamp,
  double? chunkSize,
  String? urls,
  String? urlId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'doc_title': docTitle,
      'doc_id': docId,
      'dataset_name': datasetName,
      'dataset_id': datasetId,
      'timestamp': timestamp,
      'chunk_size': chunkSize,
      'urls': urls,
      'url_id': urlId,
    }.withoutNulls,
  );

  return firestoreData;
}
