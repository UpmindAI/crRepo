import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_temp_urls_record.g.dart';

abstract class UserTempUrlsRecord
    implements Built<UserTempUrlsRecord, UserTempUrlsRecordBuilder> {
  static Serializer<UserTempUrlsRecord> get serializer =>
      _$userTempUrlsRecordSerializer;

  @BuiltValueField(wireName: 'doc_title')
  String? get docTitle;

  @BuiltValueField(wireName: 'doc_id')
  String? get docId;

  @BuiltValueField(wireName: 'dataset_name')
  String? get datasetName;

  @BuiltValueField(wireName: 'dataset_id')
  String? get datasetId;

  DateTime? get timestamp;

  @BuiltValueField(wireName: 'chunk_size')
  double? get chunkSize;

  String? get urls;

  @BuiltValueField(wireName: 'url_id')
  String? get urlId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(UserTempUrlsRecordBuilder builder) => builder
    ..docTitle = ''
    ..docId = ''
    ..datasetName = ''
    ..datasetId = ''
    ..chunkSize = 0.0
    ..urls = ''
    ..urlId = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_temp_urls')
          : FirebaseFirestore.instance.collectionGroup('user_temp_urls');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_temp_urls').doc();

  static Stream<UserTempUrlsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserTempUrlsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserTempUrlsRecord._();
  factory UserTempUrlsRecord(
          [void Function(UserTempUrlsRecordBuilder) updates]) =
      _$UserTempUrlsRecord;

  static UserTempUrlsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserTempUrlsRecordData({
  String? docTitle,
  String? docId,
  String? datasetName,
  String? datasetId,
  DateTime? timestamp,
  double? chunkSize,
  String? urls,
  String? urlId,
}) {
  final firestoreData = serializers.toFirestore(
    UserTempUrlsRecord.serializer,
    UserTempUrlsRecord(
      (u) => u
        ..docTitle = docTitle
        ..docId = docId
        ..datasetName = datasetName
        ..datasetId = datasetId
        ..timestamp = timestamp
        ..chunkSize = chunkSize
        ..urls = urls
        ..urlId = urlId,
    ),
  );

  return firestoreData;
}
