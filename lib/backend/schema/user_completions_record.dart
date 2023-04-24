import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_completions_record.g.dart';

abstract class UserCompletionsRecord
    implements Built<UserCompletionsRecord, UserCompletionsRecordBuilder> {
  static Serializer<UserCompletionsRecord> get serializer =>
      _$userCompletionsRecordSerializer;

  String? get qid;

  String? get prompt;

  String? get completion;

  String? get url;

  DateTime? get timestamp;

  BuiltList<String>? get chunks;

  @BuiltValueField(wireName: 'dataset_ids')
  BuiltList<String>? get datasetIds;

  @BuiltValueField(wireName: 'doc_titles')
  BuiltList<String>? get docTitles;

  @BuiltValueField(wireName: 'dataset_names')
  BuiltList<String>? get datasetNames;

  @BuiltValueField(wireName: 'is_loading')
  bool? get isLoading;

  @BuiltValueField(wireName: 'progress_status')
  String? get progressStatus;

  @BuiltValueField(wireName: 'progress_percentage')
  int? get progressPercentage;

  @BuiltValueField(wireName: 'is_error')
  bool? get isError;

  BuiltList<SourcesStruct>? get sources;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(UserCompletionsRecordBuilder builder) =>
      builder
        ..qid = ''
        ..prompt = ''
        ..completion = ''
        ..url = ''
        ..chunks = ListBuilder()
        ..datasetIds = ListBuilder()
        ..docTitles = ListBuilder()
        ..datasetNames = ListBuilder()
        ..isLoading = false
        ..progressStatus = ''
        ..progressPercentage = 0
        ..isError = false
        ..sources = ListBuilder();

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_completions')
          : FirebaseFirestore.instance.collectionGroup('user_completions');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_completions').doc();

  static Stream<UserCompletionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserCompletionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserCompletionsRecord._();
  factory UserCompletionsRecord(
          [void Function(UserCompletionsRecordBuilder) updates]) =
      _$UserCompletionsRecord;

  static UserCompletionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserCompletionsRecordData({
  String? qid,
  String? prompt,
  String? completion,
  String? url,
  DateTime? timestamp,
  bool? isLoading,
  String? progressStatus,
  int? progressPercentage,
  bool? isError,
}) {
  final firestoreData = serializers.toFirestore(
    UserCompletionsRecord.serializer,
    UserCompletionsRecord(
      (u) => u
        ..qid = qid
        ..prompt = prompt
        ..completion = completion
        ..url = url
        ..timestamp = timestamp
        ..chunks = null
        ..datasetIds = null
        ..docTitles = null
        ..datasetNames = null
        ..isLoading = isLoading
        ..progressStatus = progressStatus
        ..progressPercentage = progressPercentage
        ..isError = isError
        ..sources = null,
    ),
  );

  return firestoreData;
}
