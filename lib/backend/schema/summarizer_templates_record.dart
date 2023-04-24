import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'summarizer_templates_record.g.dart';

abstract class SummarizerTemplatesRecord
    implements
        Built<SummarizerTemplatesRecord, SummarizerTemplatesRecordBuilder> {
  static Serializer<SummarizerTemplatesRecord> get serializer =>
      _$summarizerTemplatesRecordSerializer;

  BuiltList<String>? get template;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SummarizerTemplatesRecordBuilder builder) =>
      builder..template = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('summarizer_templates');

  static Stream<SummarizerTemplatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SummarizerTemplatesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SummarizerTemplatesRecord._();
  factory SummarizerTemplatesRecord(
          [void Function(SummarizerTemplatesRecordBuilder) updates]) =
      _$SummarizerTemplatesRecord;

  static SummarizerTemplatesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSummarizerTemplatesRecordData() {
  final firestoreData = serializers.toFirestore(
    SummarizerTemplatesRecord.serializer,
    SummarizerTemplatesRecord(
      (s) => s..template = null,
    ),
  );

  return firestoreData;
}
