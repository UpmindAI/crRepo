import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SharedChatsRecord extends FirestoreRecord {
  SharedChatsRecord._(
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

  // "bid" field.
  String? _bid;
  String get bid => _bid ?? '';
  bool hasBid() => _bid != null;

  // "engine" field.
  String? _engine;
  String get engine => _engine ?? '';
  bool hasEngine() => _engine != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _cid = snapshotData['cid'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _message = snapshotData['message'] as String?;
    _isCompletion = snapshotData['is_completion'] as bool?;
    _datasetIds = getDataList(snapshotData['dataset_ids']);
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
    _bid = snapshotData['bid'] as String?;
    _engine = snapshotData['engine'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('shared_chats')
          : FirebaseFirestore.instance.collectionGroup('shared_chats');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('shared_chats').doc();

  static Stream<SharedChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SharedChatsRecord.fromSnapshot(s));

  static Future<SharedChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SharedChatsRecord.fromSnapshot(s));

  static SharedChatsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SharedChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SharedChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SharedChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SharedChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SharedChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSharedChatsRecordData({
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
  String? bid,
  String? engine,
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
      'bid': bid,
      'engine': engine,
    }.withoutNulls,
  );

  return firestoreData;
}

class SharedChatsRecordDocumentEquality implements Equality<SharedChatsRecord> {
  const SharedChatsRecordDocumentEquality();

  @override
  bool equals(SharedChatsRecord? e1, SharedChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.cid == e2?.cid &&
        e1?.timestamp == e2?.timestamp &&
        e1?.message == e2?.message &&
        e1?.isCompletion == e2?.isCompletion &&
        listEquality.equals(e1?.datasetIds, e2?.datasetIds) &&
        e1?.qid == e2?.qid &&
        e1?.prompt == e2?.prompt &&
        e1?.completion == e2?.completion &&
        listEquality.equals(e1?.datasetNames, e2?.datasetNames) &&
        listEquality.equals(e1?.docTitles, e2?.docTitles) &&
        e1?.isLoading == e2?.isLoading &&
        e1?.uid == e2?.uid &&
        e1?.isError == e2?.isError &&
        listEquality.equals(e1?.sources, e2?.sources) &&
        e1?.bid == e2?.bid &&
        e1?.engine == e2?.engine;
  }

  @override
  int hash(SharedChatsRecord? e) => const ListEquality().hash([
        e?.cid,
        e?.timestamp,
        e?.message,
        e?.isCompletion,
        e?.datasetIds,
        e?.qid,
        e?.prompt,
        e?.completion,
        e?.datasetNames,
        e?.docTitles,
        e?.isLoading,
        e?.uid,
        e?.isError,
        e?.sources,
        e?.bid,
        e?.engine
      ]);

  @override
  bool isValidKey(Object? o) => o is SharedChatsRecord;
}
