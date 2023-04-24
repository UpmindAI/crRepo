import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'pl_prompts_record.g.dart';

abstract class PlPromptsRecord
    implements Built<PlPromptsRecord, PlPromptsRecordBuilder> {
  static Serializer<PlPromptsRecord> get serializer =>
      _$plPromptsRecordSerializer;

  String? get system;

  String? get content;

  String? get prompt;

  DateTime? get timestamp;

  @BuiltValueField(wireName: 'active_datasets')
  BuiltList<String>? get activeDatasets;

  String? get completion;

  String? get plid;

  @BuiltValueField(wireName: 'top_k')
  int? get topK;

  double? get temp;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(PlPromptsRecordBuilder builder) => builder
    ..system = ''
    ..content = ''
    ..prompt = ''
    ..activeDatasets = ListBuilder()
    ..completion = ''
    ..plid = ''
    ..topK = 0
    ..temp = 0.0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('pl_prompts')
          : FirebaseFirestore.instance.collectionGroup('pl_prompts');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('pl_prompts').doc();

  static Stream<PlPromptsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PlPromptsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PlPromptsRecord._();
  factory PlPromptsRecord([void Function(PlPromptsRecordBuilder) updates]) =
      _$PlPromptsRecord;

  static PlPromptsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPlPromptsRecordData({
  String? system,
  String? content,
  String? prompt,
  DateTime? timestamp,
  String? completion,
  String? plid,
  int? topK,
  double? temp,
}) {
  final firestoreData = serializers.toFirestore(
    PlPromptsRecord.serializer,
    PlPromptsRecord(
      (p) => p
        ..system = system
        ..content = content
        ..prompt = prompt
        ..timestamp = timestamp
        ..activeDatasets = null
        ..completion = completion
        ..plid = plid
        ..topK = topK
        ..temp = temp,
    ),
  );

  return firestoreData;
}
