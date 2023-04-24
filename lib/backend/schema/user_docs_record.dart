import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_docs_record.g.dart';

abstract class UserDocsRecord
    implements Built<UserDocsRecord, UserDocsRecordBuilder> {
  static Serializer<UserDocsRecord> get serializer =>
      _$userDocsRecordSerializer;

  @BuiltValueField(wireName: 'dataset_id')
  String? get datasetId;

  @BuiltValueField(wireName: 'is_active')
  bool? get isActive;

  @BuiltValueField(wireName: 'doc_id')
  String? get docId;

  @BuiltValueField(wireName: 'doc_title')
  String? get docTitle;

  DateTime? get timestamp;

  String? get url;

  bool? get processing;

  @BuiltValueField(wireName: 'file_type')
  String? get fileType;

  @BuiltValueField(wireName: 'progress_status')
  String? get progressStatus;

  @BuiltValueField(wireName: 'progress_percentage')
  int? get progressPercentage;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(UserDocsRecordBuilder builder) => builder
    ..datasetId = ''
    ..isActive = false
    ..docId = ''
    ..docTitle = ''
    ..url = ''
    ..processing = false
    ..fileType = ''
    ..progressStatus = ''
    ..progressPercentage = 0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_docs')
          : FirebaseFirestore.instance.collectionGroup('user_docs');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_docs').doc();

  static Stream<UserDocsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserDocsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserDocsRecord._();
  factory UserDocsRecord([void Function(UserDocsRecordBuilder) updates]) =
      _$UserDocsRecord;

  static UserDocsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserDocsRecordData({
  String? datasetId,
  bool? isActive,
  String? docId,
  String? docTitle,
  DateTime? timestamp,
  String? url,
  bool? processing,
  String? fileType,
  String? progressStatus,
  int? progressPercentage,
}) {
  final firestoreData = serializers.toFirestore(
    UserDocsRecord.serializer,
    UserDocsRecord(
      (u) => u
        ..datasetId = datasetId
        ..isActive = isActive
        ..docId = docId
        ..docTitle = docTitle
        ..timestamp = timestamp
        ..url = url
        ..processing = processing
        ..fileType = fileType
        ..progressStatus = progressStatus
        ..progressPercentage = progressPercentage,
    ),
  );

  return firestoreData;
}
