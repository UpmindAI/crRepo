import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'appdata_record.g.dart';

abstract class AppdataRecord
    implements Built<AppdataRecord, AppdataRecordBuilder> {
  static Serializer<AppdataRecord> get serializer => _$appdataRecordSerializer;

  @BuiltValueField(wireName: 'chat_image')
  String? get chatImage;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AppdataRecordBuilder builder) =>
      builder..chatImage = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appdata');

  static Stream<AppdataRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AppdataRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AppdataRecord._();
  factory AppdataRecord([void Function(AppdataRecordBuilder) updates]) =
      _$AppdataRecord;

  static AppdataRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAppdataRecordData({
  String? chatImage,
}) {
  final firestoreData = serializers.toFirestore(
    AppdataRecord.serializer,
    AppdataRecord(
      (a) => a..chatImage = chatImage,
    ),
  );

  return firestoreData;
}
