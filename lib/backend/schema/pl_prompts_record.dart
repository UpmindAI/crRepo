import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlPromptsRecord extends FirestoreRecord {
  PlPromptsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "system" field.
  String? _system;
  String get system => _system ?? '';
  bool hasSystem() => _system != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "prompt" field.
  String? _prompt;
  String get prompt => _prompt ?? '';
  bool hasPrompt() => _prompt != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "active_datasets" field.
  List<String>? _activeDatasets;
  List<String> get activeDatasets => _activeDatasets ?? const [];
  bool hasActiveDatasets() => _activeDatasets != null;

  // "completion" field.
  String? _completion;
  String get completion => _completion ?? '';
  bool hasCompletion() => _completion != null;

  // "plid" field.
  String? _plid;
  String get plid => _plid ?? '';
  bool hasPlid() => _plid != null;

  // "top_k" field.
  int? _topK;
  int get topK => _topK ?? 0;
  bool hasTopK() => _topK != null;

  // "temp" field.
  double? _temp;
  double get temp => _temp ?? 0.0;
  bool hasTemp() => _temp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _system = snapshotData['system'] as String?;
    _content = snapshotData['content'] as String?;
    _prompt = snapshotData['prompt'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _activeDatasets = getDataList(snapshotData['active_datasets']);
    _completion = snapshotData['completion'] as String?;
    _plid = snapshotData['plid'] as String?;
    _topK = castToType<int>(snapshotData['top_k']);
    _temp = castToType<double>(snapshotData['temp']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('pl_prompts')
          : FirebaseFirestore.instance.collectionGroup('pl_prompts');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('pl_prompts').doc();

  static Stream<PlPromptsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlPromptsRecord.fromSnapshot(s));

  static Future<PlPromptsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlPromptsRecord.fromSnapshot(s));

  static PlPromptsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlPromptsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlPromptsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlPromptsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlPromptsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlPromptsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlPromptsRecordData({
  String? system,
  String? content,
  String? prompt,
  DateTime? timestamp,
  String? completion,
  String? plid,
  int? topK,
  double? temp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'system': system,
      'content': content,
      'prompt': prompt,
      'timestamp': timestamp,
      'completion': completion,
      'plid': plid,
      'top_k': topK,
      'temp': temp,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlPromptsRecordDocumentEquality implements Equality<PlPromptsRecord> {
  const PlPromptsRecordDocumentEquality();

  @override
  bool equals(PlPromptsRecord? e1, PlPromptsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.system == e2?.system &&
        e1?.content == e2?.content &&
        e1?.prompt == e2?.prompt &&
        e1?.timestamp == e2?.timestamp &&
        listEquality.equals(e1?.activeDatasets, e2?.activeDatasets) &&
        e1?.completion == e2?.completion &&
        e1?.plid == e2?.plid &&
        e1?.topK == e2?.topK &&
        e1?.temp == e2?.temp;
  }

  @override
  int hash(PlPromptsRecord? e) => const ListEquality().hash([
        e?.system,
        e?.content,
        e?.prompt,
        e?.timestamp,
        e?.activeDatasets,
        e?.completion,
        e?.plid,
        e?.topK,
        e?.temp
      ]);

  @override
  bool isValidKey(Object? o) => o is PlPromptsRecord;
}
