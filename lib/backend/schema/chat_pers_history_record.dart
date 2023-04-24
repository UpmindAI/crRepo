import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chat_pers_history_record.g.dart';

abstract class ChatPersHistoryRecord
    implements Built<ChatPersHistoryRecord, ChatPersHistoryRecordBuilder> {
  static Serializer<ChatPersHistoryRecord> get serializer =>
      _$chatPersHistoryRecordSerializer;

  String? get personality;

  DateTime? get timestamp;

  @BuiltValueField(wireName: 'is_favorite')
  bool? get isFavorite;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(ChatPersHistoryRecordBuilder builder) =>
      builder
        ..personality = ''
        ..isFavorite = false;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chat_pers_history')
          : FirebaseFirestore.instance.collectionGroup('chat_pers_history');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('chat_pers_history').doc();

  static Stream<ChatPersHistoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChatPersHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ChatPersHistoryRecord._();
  factory ChatPersHistoryRecord(
          [void Function(ChatPersHistoryRecordBuilder) updates]) =
      _$ChatPersHistoryRecord;

  static ChatPersHistoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChatPersHistoryRecordData({
  String? personality,
  DateTime? timestamp,
  bool? isFavorite,
}) {
  final firestoreData = serializers.toFirestore(
    ChatPersHistoryRecord.serializer,
    ChatPersHistoryRecord(
      (c) => c
        ..personality = personality
        ..timestamp = timestamp
        ..isFavorite = isFavorite,
    ),
  );

  return firestoreData;
}
