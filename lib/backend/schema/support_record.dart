import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'support_record.g.dart';

abstract class SupportRecord
    implements Built<SupportRecord, SupportRecordBuilder> {
  static Serializer<SupportRecord> get serializer => _$supportRecordSerializer;

  String? get uid;

  @BuiltValueField(wireName: 'user_ref')
  DocumentReference? get userRef;

  String? get question;

  DateTime? get timestamp;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SupportRecordBuilder builder) => builder
    ..uid = ''
    ..question = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('support');

  static Stream<SupportRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SupportRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SupportRecord._();
  factory SupportRecord([void Function(SupportRecordBuilder) updates]) =
      _$SupportRecord;

  static SupportRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSupportRecordData({
  String? uid,
  DocumentReference? userRef,
  String? question,
  DateTime? timestamp,
}) {
  final firestoreData = serializers.toFirestore(
    SupportRecord.serializer,
    SupportRecord(
      (s) => s
        ..uid = uid
        ..userRef = userRef
        ..question = question
        ..timestamp = timestamp,
    ),
  );

  return firestoreData;
}
