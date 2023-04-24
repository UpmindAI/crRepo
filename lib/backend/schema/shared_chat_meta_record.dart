import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'shared_chat_meta_record.g.dart';

abstract class SharedChatMetaRecord
    implements Built<SharedChatMetaRecord, SharedChatMetaRecordBuilder> {
  static Serializer<SharedChatMetaRecord> get serializer =>
      _$sharedChatMetaRecordSerializer;

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

  String? get bid;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(SharedChatMetaRecordBuilder builder) => builder
    ..cid = ''
    ..qids = ListBuilder()
    ..firstMessage = ''
    ..prompts = ListBuilder()
    ..isLoading = false
    ..completions = ListBuilder()
    ..uid = ''
    ..image = ''
    ..bid = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('shared_chat_meta')
          : FirebaseFirestore.instance.collectionGroup('shared_chat_meta');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('shared_chat_meta').doc();

  static Stream<SharedChatMetaRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SharedChatMetaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SharedChatMetaRecord._();
  factory SharedChatMetaRecord(
          [void Function(SharedChatMetaRecordBuilder) updates]) =
      _$SharedChatMetaRecord;

  static SharedChatMetaRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSharedChatMetaRecordData({
  DateTime? createdOn,
  String? cid,
  String? firstMessage,
  bool? isLoading,
  DateTime? lastMessage,
  String? uid,
  String? image,
  String? bid,
}) {
  final firestoreData = serializers.toFirestore(
    SharedChatMetaRecord.serializer,
    SharedChatMetaRecord(
      (s) => s
        ..createdOn = createdOn
        ..cid = cid
        ..qids = null
        ..firstMessage = firstMessage
        ..prompts = null
        ..isLoading = isLoading
        ..completions = null
        ..lastMessage = lastMessage
        ..uid = uid
        ..image = image
        ..bid = bid,
    ),
  );

  return firestoreData;
}
