import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chat_gr_history_record.g.dart';

abstract class ChatGrHistoryRecord
    implements Built<ChatGrHistoryRecord, ChatGrHistoryRecordBuilder> {
  static Serializer<ChatGrHistoryRecord> get serializer =>
      _$chatGrHistoryRecordSerializer;

  DateTime? get timestamp;

  @BuiltValueField(wireName: 'is_favorite')
  bool? get isFavorite;

  String? get gr;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(ChatGrHistoryRecordBuilder builder) => builder
    ..isFavorite = false
    ..gr = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chat_gr_history')
          : FirebaseFirestore.instance.collectionGroup('chat_gr_history');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('chat_gr_history').doc();

  static Stream<ChatGrHistoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChatGrHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ChatGrHistoryRecord._();
  factory ChatGrHistoryRecord(
          [void Function(ChatGrHistoryRecordBuilder) updates]) =
      _$ChatGrHistoryRecord;

  static ChatGrHistoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChatGrHistoryRecordData({
  DateTime? timestamp,
  bool? isFavorite,
  String? gr,
}) {
  final firestoreData = serializers.toFirestore(
    ChatGrHistoryRecord.serializer,
    ChatGrHistoryRecord(
      (c) => c
        ..timestamp = timestamp
        ..isFavorite = isFavorite
        ..gr = gr,
    ),
  );

  return firestoreData;
}
