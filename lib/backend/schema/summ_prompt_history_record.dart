import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'summ_prompt_history_record.g.dart';

abstract class SummPromptHistoryRecord
    implements Built<SummPromptHistoryRecord, SummPromptHistoryRecordBuilder> {
  static Serializer<SummPromptHistoryRecord> get serializer =>
      _$summPromptHistoryRecordSerializer;

  String? get prompt;

  DateTime? get timestamp;

  @BuiltValueField(wireName: 'is_favorite')
  bool? get isFavorite;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(SummPromptHistoryRecordBuilder builder) =>
      builder
        ..prompt = ''
        ..isFavorite = false;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('summ_prompt_history')
          : FirebaseFirestore.instance.collectionGroup('summ_prompt_history');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('summ_prompt_history').doc();

  static Stream<SummPromptHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SummPromptHistoryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SummPromptHistoryRecord._();
  factory SummPromptHistoryRecord(
          [void Function(SummPromptHistoryRecordBuilder) updates]) =
      _$SummPromptHistoryRecord;

  static SummPromptHistoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSummPromptHistoryRecordData({
  String? prompt,
  DateTime? timestamp,
  bool? isFavorite,
}) {
  final firestoreData = serializers.toFirestore(
    SummPromptHistoryRecord.serializer,
    SummPromptHistoryRecord(
      (s) => s
        ..prompt = prompt
        ..timestamp = timestamp
        ..isFavorite = isFavorite,
    ),
  );

  return firestoreData;
}
