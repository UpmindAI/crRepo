import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chat_meta_record.g.dart';

abstract class ChatMetaRecord
    implements Built<ChatMetaRecord, ChatMetaRecordBuilder> {
  static Serializer<ChatMetaRecord> get serializer =>
      _$chatMetaRecordSerializer;

  @BuiltValueField(wireName: 'created_on')
  DateTime? get createdOn;

  String? get cid;

  BuiltList<String>? get qids;

  @BuiltValueField(wireName: 'first_message')
  String? get firstMessage;

  BuiltList<String>? get prompts;

  @BuiltValueField(wireName: 'is_loading')
  bool? get isLoading;

  BuiltList<String>? get completions;

  @BuiltValueField(wireName: 'last_message')
  DateTime? get lastMessage;

  String? get uid;

  String? get image;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(ChatMetaRecordBuilder builder) => builder
    ..cid = ''
    ..qids = ListBuilder()
    ..firstMessage = ''
    ..prompts = ListBuilder()
    ..isLoading = false
    ..completions = ListBuilder()
    ..uid = ''
    ..image = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chat_meta')
          : FirebaseFirestore.instance.collectionGroup('chat_meta');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('chat_meta').doc();

  static Stream<ChatMetaRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChatMetaRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ChatMetaRecord._();
  factory ChatMetaRecord([void Function(ChatMetaRecordBuilder) updates]) =
      _$ChatMetaRecord;

  static ChatMetaRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChatMetaRecordData({
  DateTime? createdOn,
  String? cid,
  String? firstMessage,
  bool? isLoading,
  DateTime? lastMessage,
  String? uid,
  String? image,
}) {
  final firestoreData = serializers.toFirestore(
    ChatMetaRecord.serializer,
    ChatMetaRecord(
      (c) => c
        ..createdOn = createdOn
        ..cid = cid
        ..qids = null
        ..firstMessage = firstMessage
        ..prompts = null
        ..isLoading = isLoading
        ..completions = null
        ..lastMessage = lastMessage
        ..uid = uid
        ..image = image,
    ),
  );

  return firestoreData;
}
