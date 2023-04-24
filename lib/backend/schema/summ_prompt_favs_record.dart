import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'summ_prompt_favs_record.g.dart';

abstract class SummPromptFavsRecord
    implements Built<SummPromptFavsRecord, SummPromptFavsRecordBuilder> {
  static Serializer<SummPromptFavsRecord> get serializer =>
      _$summPromptFavsRecordSerializer;

  String? get prompt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(SummPromptFavsRecordBuilder builder) =>
      builder..prompt = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('summ_prompt_favs')
          : FirebaseFirestore.instance.collectionGroup('summ_prompt_favs');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('summ_prompt_favs').doc();

  static Stream<SummPromptFavsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SummPromptFavsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SummPromptFavsRecord._();
  factory SummPromptFavsRecord(
          [void Function(SummPromptFavsRecordBuilder) updates]) =
      _$SummPromptFavsRecord;

  static SummPromptFavsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSummPromptFavsRecordData({
  String? prompt,
}) {
  final firestoreData = serializers.toFirestore(
    SummPromptFavsRecord.serializer,
    SummPromptFavsRecord(
      (s) => s..prompt = prompt,
    ),
  );

  return firestoreData;
}
