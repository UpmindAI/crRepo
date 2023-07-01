import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatPersHistoryRecord extends FirestoreRecord {
  ChatPersHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "personality" field.
  String? _personality;
  String get personality => _personality ?? '';
  bool hasPersonality() => _personality != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "is_favorite" field.
  bool? _isFavorite;
  bool get isFavorite => _isFavorite ?? false;
  bool hasIsFavorite() => _isFavorite != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _personality = snapshotData['personality'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _isFavorite = snapshotData['is_favorite'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chat_pers_history')
          : FirebaseFirestore.instance.collectionGroup('chat_pers_history');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('chat_pers_history').doc();

  static Stream<ChatPersHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatPersHistoryRecord.fromSnapshot(s));

  static Future<ChatPersHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatPersHistoryRecord.fromSnapshot(s));

  static ChatPersHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatPersHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatPersHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatPersHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatPersHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatPersHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatPersHistoryRecordData({
  String? personality,
  DateTime? timestamp,
  bool? isFavorite,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'personality': personality,
      'timestamp': timestamp,
      'is_favorite': isFavorite,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatPersHistoryRecordDocumentEquality
    implements Equality<ChatPersHistoryRecord> {
  const ChatPersHistoryRecordDocumentEquality();

  @override
  bool equals(ChatPersHistoryRecord? e1, ChatPersHistoryRecord? e2) {
    return e1?.personality == e2?.personality &&
        e1?.timestamp == e2?.timestamp &&
        e1?.isFavorite == e2?.isFavorite;
  }

  @override
  int hash(ChatPersHistoryRecord? e) =>
      const ListEquality().hash([e?.personality, e?.timestamp, e?.isFavorite]);

  @override
  bool isValidKey(Object? o) => o is ChatPersHistoryRecord;
}
