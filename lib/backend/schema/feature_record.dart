import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'feature_record.g.dart';

abstract class FeatureRecord
    implements Built<FeatureRecord, FeatureRecordBuilder> {
  static Serializer<FeatureRecord> get serializer => _$featureRecordSerializer;

  String? get iwant;

  String? get because;

  String? get additional;

  @BuiltValueField(wireName: 'user_ref')
  DocumentReference? get userRef;

  DateTime? get timestamp;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FeatureRecordBuilder builder) => builder
    ..iwant = ''
    ..because = ''
    ..additional = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('feature');

  static Stream<FeatureRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FeatureRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FeatureRecord._();
  factory FeatureRecord([void Function(FeatureRecordBuilder) updates]) =
      _$FeatureRecord;

  static FeatureRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFeatureRecordData({
  String? iwant,
  String? because,
  String? additional,
  DocumentReference? userRef,
  DateTime? timestamp,
}) {
  final firestoreData = serializers.toFirestore(
    FeatureRecord.serializer,
    FeatureRecord(
      (f) => f
        ..iwant = iwant
        ..because = because
        ..additional = additional
        ..userRef = userRef
        ..timestamp = timestamp,
    ),
  );

  return firestoreData;
}
