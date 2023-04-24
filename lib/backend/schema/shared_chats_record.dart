import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'shared_chats_record.g.dart';

abstract class SharedChatsRecord
    implements Built<SharedChatsRecord, SharedChatsRecordBuilder> {
  static Serializer<SharedChatsRecord> get serializer =>
      _$sharedChatsRecordSerializer;

  String? get cid;

  DateTime? get timestamp;

  String? get message;

  @BuiltValueField(wireName: 'is_completion')
  bool? get isCompletion;

  @BuiltValueField(wireName: 'dataset_ids')
  BuiltList<String>? get datasetIds;

  String? get qid;

  String? get prompt;

  String? get completion;

  @BuiltValueField(wireName: 'dataset_names')
  BuiltList<String>? get datasetNames;

  @BuiltValueField(wireName: 'doc_titles')
  BuiltList<String>? get docTitles;

  @BuiltValueField(wireName: 'is_loading')
  bool? get isLoading;

  String? get uid;

  @BuiltValueField(wireName: 'is_error')
  bool? get isError;

  BuiltList<SourcesStruct>? get sources;

  String? get bid;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(SharedChatsRecordBuilder builder) => builder
    ..cid = ''
    ..message = ''
    ..isCompletion = false
    ..datasetIds = ListBuilder()
    ..qid = ''
    ..prompt = ''
    ..completion = ''
    ..datasetNames = ListBuilder()
    ..docTitles = ListBuilder()
    ..isLoading = false
    ..uid = ''
    ..isError = false
    ..sources = ListBuilder()
    ..bid = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('shared_chats')
          : FirebaseFirestore.instance.collectionGroup('shared_chats');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('shared_chats').doc();

  static Stream<SharedChatsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SharedChatsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SharedChatsRecord._();
  factory SharedChatsRecord([void Function(SharedChatsRecordBuilder) updates]) =
      _$SharedChatsRecord;

  static SharedChatsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
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
}) {
  final firestoreData = serializers.toFirestore(
    SharedChatsRecord.serializer,
    SharedChatsRecord(
      (s) => s
        ..cid = cid
        ..timestamp = timestamp
        ..message = message
        ..isCompletion = isCompletion
        ..datasetIds = null
        ..qid = qid
        ..prompt = prompt
        ..completion = completion
        ..datasetNames = null
        ..docTitles = null
        ..isLoading = isLoading
        ..uid = uid
        ..isError = isError
        ..sources = null
        ..bid = bid,
    ),
  );

  return firestoreData;
}
