import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SharedBotsRecord extends FirestoreRecord {
  SharedBotsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bid" field.
  String? _bid;
  String get bid => _bid ?? '';
  bool hasBid() => _bid != null;

  // "doc_titles" field.
  List<String>? _docTitles;
  List<String> get docTitles => _docTitles ?? const [];
  bool hasDocTitles() => _docTitles != null;

  // "doc_ids" field.
  List<String>? _docIds;
  List<String> get docIds => _docIds ?? const [];
  bool hasDocIds() => _docIds != null;

  // "guardrail" field.
  String? _guardrail;
  String get guardrail => _guardrail ?? '';
  bool hasGuardrail() => _guardrail != null;

  // "system" field.
  String? _system;
  String get system => _system ?? '';
  bool hasSystem() => _system != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "top_k" field.
  double? _topK;
  double get topK => _topK ?? 0.0;
  bool hasTopK() => _topK != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "dataset_ids" field.
  List<String>? _datasetIds;
  List<String> get datasetIds => _datasetIds ?? const [];
  bool hasDatasetIds() => _datasetIds != null;

  // "telegram_url" field.
  String? _telegramUrl;
  String get telegramUrl => _telegramUrl ?? '';
  bool hasTelegramUrl() => _telegramUrl != null;

  // "share_url" field.
  String? _shareUrl;
  String get shareUrl => _shareUrl ?? '';
  bool hasShareUrl() => _shareUrl != null;

  // "engine" field.
  String? _engine;
  String get engine => _engine ?? '';
  bool hasEngine() => _engine != null;

  void _initializeFields() {
    _bid = snapshotData['bid'] as String?;
    _docTitles = getDataList(snapshotData['doc_titles']);
    _docIds = getDataList(snapshotData['doc_ids']);
    _guardrail = snapshotData['guardrail'] as String?;
    _system = snapshotData['system'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _topK = castToType<double>(snapshotData['top_k']);
    _image = snapshotData['image'] as String?;
    _uid = snapshotData['uid'] as String?;
    _datasetIds = getDataList(snapshotData['dataset_ids']);
    _telegramUrl = snapshotData['telegram_url'] as String?;
    _shareUrl = snapshotData['share_url'] as String?;
    _engine = snapshotData['engine'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shared_bots');

  static Stream<SharedBotsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SharedBotsRecord.fromSnapshot(s));

  static Future<SharedBotsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SharedBotsRecord.fromSnapshot(s));

  static SharedBotsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SharedBotsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SharedBotsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SharedBotsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SharedBotsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SharedBotsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSharedBotsRecordData({
  String? bid,
  String? guardrail,
  String? system,
  DateTime? timestamp,
  double? topK,
  String? image,
  String? uid,
  String? telegramUrl,
  String? shareUrl,
  String? engine,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bid': bid,
      'guardrail': guardrail,
      'system': system,
      'timestamp': timestamp,
      'top_k': topK,
      'image': image,
      'uid': uid,
      'telegram_url': telegramUrl,
      'share_url': shareUrl,
      'engine': engine,
    }.withoutNulls,
  );

  return firestoreData;
}
