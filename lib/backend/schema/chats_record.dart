import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cid" field.
  String? _cid;
  String get cid => _cid ?? '';
  bool hasCid() => _cid != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "is_completion" field.
  bool? _isCompletion;
  bool get isCompletion => _isCompletion ?? false;
  bool hasIsCompletion() => _isCompletion != null;

  // "dataset_ids" field.
  List<String>? _datasetIds;
  List<String> get datasetIds => _datasetIds ?? const [];
  bool hasDatasetIds() => _datasetIds != null;

  // "chunks" field.
  List<String>? _chunks;
  List<String> get chunks => _chunks ?? const [];
  bool hasChunks() => _chunks != null;

  // "qid" field.
  String? _qid;
  String get qid => _qid ?? '';
  bool hasQid() => _qid != null;

  // "prompt" field.
  String? _prompt;
  String get prompt => _prompt ?? '';
  bool hasPrompt() => _prompt != null;

  // "completion" field.
  String? _completion;
  String get completion => _completion ?? '';
  bool hasCompletion() => _completion != null;

  // "dataset_names" field.
  List<String>? _datasetNames;
  List<String> get datasetNames => _datasetNames ?? const [];
  bool hasDatasetNames() => _datasetNames != null;

  // "doc_titles" field.
  List<String>? _docTitles;
  List<String> get docTitles => _docTitles ?? const [];
  bool hasDocTitles() => _docTitles != null;

  // "is_loading" field.
  bool? _isLoading;
  bool get isLoading => _isLoading ?? false;
  bool hasIsLoading() => _isLoading != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "is_error" field.
  bool? _isError;
  bool get isError => _isError ?? false;
  bool hasIsError() => _isError != null;

  // "sources" field.
  List<SourcesStruct>? _sources;
  List<SourcesStruct> get sources => _sources ?? const [];
  bool hasSources() => _sources != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _cid = snapshotData['cid'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _message = snapshotData['message'] as String?;
    _isCompletion = snapshotData['is_completion'] as bool?;
    _datasetIds = getDataList(snapshotData['dataset_ids']);
    _chunks = getDataList(snapshotData['chunks']);
    _qid = snapshotData['qid'] as String?;
    _prompt = snapshotData['prompt'] as String?;
    _completion = snapshotData['completion'] as String?;
    _datasetNames = getDataList(snapshotData['dataset_names']);
    _docTitles = getDataList(snapshotData['doc_titles']);
    _isLoading = snapshotData['is_loading'] as bool?;
    _uid = snapshotData['uid'] as String?;
    _isError = snapshotData['is_error'] as bool?;
    _sources = getStructList(
      snapshotData['sources'],
      SourcesStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chats')
          : FirebaseFirestore.instance.collectionGroup('chats');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('chats').doc();

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createChatsRecordData({
  String? cid,
  DateTime? timestamp,
  String? message,
  bool? isCompletion,
  String? qid,
  String? prompt,
  String? completion,
  bool? isLoading,
  String? uid,
  bool? isError,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cid': cid,
      'timestamp': timestamp,
      'message': message,
      'is_completion': isCompletion,
      'qid': qid,
      'prompt': prompt,
      'completion': completion,
      'is_loading': isLoading,
      'uid': uid,
      'is_error': isError,
    }.withoutNulls,
  );

  return firestoreData;
}
