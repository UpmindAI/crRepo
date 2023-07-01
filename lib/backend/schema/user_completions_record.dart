import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCompletionsRecord extends FirestoreRecord {
  UserCompletionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

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

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "chunks" field.
  List<String>? _chunks;
  List<String> get chunks => _chunks ?? const [];
  bool hasChunks() => _chunks != null;

  // "dataset_ids" field.
  List<String>? _datasetIds;
  List<String> get datasetIds => _datasetIds ?? const [];
  bool hasDatasetIds() => _datasetIds != null;

  // "doc_titles" field.
  List<String>? _docTitles;
  List<String> get docTitles => _docTitles ?? const [];
  bool hasDocTitles() => _docTitles != null;

  // "dataset_names" field.
  List<String>? _datasetNames;
  List<String> get datasetNames => _datasetNames ?? const [];
  bool hasDatasetNames() => _datasetNames != null;

  // "is_loading" field.
  bool? _isLoading;
  bool get isLoading => _isLoading ?? false;
  bool hasIsLoading() => _isLoading != null;

  // "progress_status" field.
  String? _progressStatus;
  String get progressStatus => _progressStatus ?? '';
  bool hasProgressStatus() => _progressStatus != null;

  // "progress_percentage" field.
  int? _progressPercentage;
  int get progressPercentage => _progressPercentage ?? 0;
  bool hasProgressPercentage() => _progressPercentage != null;

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
    _qid = snapshotData['qid'] as String?;
    _prompt = snapshotData['prompt'] as String?;
    _completion = snapshotData['completion'] as String?;
    _url = snapshotData['url'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _chunks = getDataList(snapshotData['chunks']);
    _datasetIds = getDataList(snapshotData['dataset_ids']);
    _docTitles = getDataList(snapshotData['doc_titles']);
    _datasetNames = getDataList(snapshotData['dataset_names']);
    _isLoading = snapshotData['is_loading'] as bool?;
    _progressStatus = snapshotData['progress_status'] as String?;
    _progressPercentage = castToType<int>(snapshotData['progress_percentage']);
    _isError = snapshotData['is_error'] as bool?;
    _sources = getStructList(
      snapshotData['sources'],
      SourcesStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_completions')
          : FirebaseFirestore.instance.collectionGroup('user_completions');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_completions').doc();

  static Stream<UserCompletionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserCompletionsRecord.fromSnapshot(s));

  static Future<UserCompletionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserCompletionsRecord.fromSnapshot(s));

  static UserCompletionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserCompletionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserCompletionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserCompletionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserCompletionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserCompletionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserCompletionsRecordData({
  String? qid,
  String? prompt,
  String? completion,
  String? url,
  DateTime? timestamp,
  bool? isLoading,
  String? progressStatus,
  int? progressPercentage,
  bool? isError,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'qid': qid,
      'prompt': prompt,
      'completion': completion,
      'url': url,
      'timestamp': timestamp,
      'is_loading': isLoading,
      'progress_status': progressStatus,
      'progress_percentage': progressPercentage,
      'is_error': isError,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserCompletionsRecordDocumentEquality
    implements Equality<UserCompletionsRecord> {
  const UserCompletionsRecordDocumentEquality();

  @override
  bool equals(UserCompletionsRecord? e1, UserCompletionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.qid == e2?.qid &&
        e1?.prompt == e2?.prompt &&
        e1?.completion == e2?.completion &&
        e1?.url == e2?.url &&
        e1?.timestamp == e2?.timestamp &&
        listEquality.equals(e1?.chunks, e2?.chunks) &&
        listEquality.equals(e1?.datasetIds, e2?.datasetIds) &&
        listEquality.equals(e1?.docTitles, e2?.docTitles) &&
        listEquality.equals(e1?.datasetNames, e2?.datasetNames) &&
        e1?.isLoading == e2?.isLoading &&
        e1?.progressStatus == e2?.progressStatus &&
        e1?.progressPercentage == e2?.progressPercentage &&
        e1?.isError == e2?.isError &&
        listEquality.equals(e1?.sources, e2?.sources);
  }

  @override
  int hash(UserCompletionsRecord? e) => const ListEquality().hash([
        e?.qid,
        e?.prompt,
        e?.completion,
        e?.url,
        e?.timestamp,
        e?.chunks,
        e?.datasetIds,
        e?.docTitles,
        e?.datasetNames,
        e?.isLoading,
        e?.progressStatus,
        e?.progressPercentage,
        e?.isError,
        e?.sources
      ]);

  @override
  bool isValidKey(Object? o) => o is UserCompletionsRecord;
}
