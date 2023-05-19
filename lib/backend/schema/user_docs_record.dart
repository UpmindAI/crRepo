import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDocsRecord extends FirestoreRecord {
  UserDocsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dataset_id" field.
  String? _datasetId;
  String get datasetId => _datasetId ?? '';
  bool hasDatasetId() => _datasetId != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "doc_id" field.
  String? _docId;
  String get docId => _docId ?? '';
  bool hasDocId() => _docId != null;

  // "doc_title" field.
  String? _docTitle;
  String get docTitle => _docTitle ?? '';
  bool hasDocTitle() => _docTitle != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "processing" field.
  bool? _processing;
  bool get processing => _processing ?? false;
  bool hasProcessing() => _processing != null;

  // "file_type" field.
  String? _fileType;
  String get fileType => _fileType ?? '';
  bool hasFileType() => _fileType != null;

  // "progress_status" field.
  String? _progressStatus;
  String get progressStatus => _progressStatus ?? '';
  bool hasProgressStatus() => _progressStatus != null;

  // "progress_percentage" field.
  int? _progressPercentage;
  int get progressPercentage => _progressPercentage ?? 0;
  bool hasProgressPercentage() => _progressPercentage != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _datasetId = snapshotData['dataset_id'] as String?;
    _isActive = snapshotData['is_active'] as bool?;
    _docId = snapshotData['doc_id'] as String?;
    _docTitle = snapshotData['doc_title'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _url = snapshotData['url'] as String?;
    _processing = snapshotData['processing'] as bool?;
    _fileType = snapshotData['file_type'] as String?;
    _progressStatus = snapshotData['progress_status'] as String?;
    _progressPercentage = snapshotData['progress_percentage'] as int?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_docs')
          : FirebaseFirestore.instance.collectionGroup('user_docs');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_docs').doc();

  static Stream<UserDocsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserDocsRecord.fromSnapshot(s));

  static Future<UserDocsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserDocsRecord.fromSnapshot(s));

  static UserDocsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserDocsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserDocsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserDocsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserDocsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createUserDocsRecordData({
  String? datasetId,
  bool? isActive,
  String? docId,
  String? docTitle,
  DateTime? timestamp,
  String? url,
  bool? processing,
  String? fileType,
  String? progressStatus,
  int? progressPercentage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dataset_id': datasetId,
      'is_active': isActive,
      'doc_id': docId,
      'doc_title': docTitle,
      'timestamp': timestamp,
      'url': url,
      'processing': processing,
      'file_type': fileType,
      'progress_status': progressStatus,
      'progress_percentage': progressPercentage,
    }.withoutNulls,
  );

  return firestoreData;
}
