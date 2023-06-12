import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatGrHistoryRecord extends FirestoreRecord {
  ChatGrHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "is_favorite" field.
  bool? _isFavorite;
  bool get isFavorite => _isFavorite ?? false;
  bool hasIsFavorite() => _isFavorite != null;

  // "gr" field.
  String? _gr;
  String get gr => _gr ?? '';
  bool hasGr() => _gr != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _isFavorite = snapshotData['is_favorite'] as bool?;
    _gr = snapshotData['gr'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chat_gr_history')
          : FirebaseFirestore.instance.collectionGroup('chat_gr_history');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('chat_gr_history').doc();

  static Stream<ChatGrHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatGrHistoryRecord.fromSnapshot(s));

  static Future<ChatGrHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatGrHistoryRecord.fromSnapshot(s));

  static ChatGrHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatGrHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatGrHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatGrHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatGrHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatGrHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatGrHistoryRecordData({
  DateTime? timestamp,
  bool? isFavorite,
  String? gr,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timestamp': timestamp,
      'is_favorite': isFavorite,
      'gr': gr,
    }.withoutNulls,
  );

  return firestoreData;
}
