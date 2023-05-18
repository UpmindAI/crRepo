import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'shared_bots_record.g.dart';

abstract class SharedBotsRecord
    implements Built<SharedBotsRecord, SharedBotsRecordBuilder> {
  static Serializer<SharedBotsRecord> get serializer =>
      _$sharedBotsRecordSerializer;

  String? get bid;

  @BuiltValueField(wireName: 'doc_titles')
  BuiltList<String>? get docTitles;

  @BuiltValueField(wireName: 'doc_ids')
  BuiltList<String>? get docIds;

  String? get guardrail;

  String? get system;

  DateTime? get timestamp;

  @BuiltValueField(wireName: 'top_k')
  double? get topK;

  String? get image;

  String? get uid;

  @BuiltValueField(wireName: 'dataset_ids')
  BuiltList<String>? get datasetIds;

  @BuiltValueField(wireName: 'telegram_url')
  String? get telegramUrl;

  @BuiltValueField(wireName: 'share_url')
  String? get shareUrl;

  String? get engine;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SharedBotsRecordBuilder builder) => builder
    ..bid = ''
    ..docTitles = ListBuilder()
    ..docIds = ListBuilder()
    ..guardrail = ''
    ..system = ''
    ..topK = 0.0
    ..image = ''
    ..uid = ''
    ..datasetIds = ListBuilder()
    ..telegramUrl = ''
    ..shareUrl = ''
    ..engine = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shared_bots');

  static Stream<SharedBotsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SharedBotsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SharedBotsRecord._();
  factory SharedBotsRecord([void Function(SharedBotsRecordBuilder) updates]) =
      _$SharedBotsRecord;

  static SharedBotsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSharedBotsRecordData({
  String? bid,
  String? guardrail,
  String? system,
  DateTime? timestamp,
  double? topK,
  String? image,
  String? uid,
  String? telegramUrl,
  String? shareUrl,
  String? engine,
}) {
  final firestoreData = serializers.toFirestore(
    SharedBotsRecord.serializer,
    SharedBotsRecord(
      (s) => s
        ..bid = bid
        ..docTitles = null
        ..docIds = null
        ..guardrail = guardrail
        ..system = system
        ..timestamp = timestamp
        ..topK = topK
        ..image = image
        ..uid = uid
        ..datasetIds = null
        ..telegramUrl = telegramUrl
        ..shareUrl = shareUrl
        ..engine = engine,
    ),
  );

  return firestoreData;
}
