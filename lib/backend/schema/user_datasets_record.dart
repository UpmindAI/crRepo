import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_datasets_record.g.dart';

abstract class UserDatasetsRecord
    implements Built<UserDatasetsRecord, UserDatasetsRecordBuilder> {
  static Serializer<UserDatasetsRecord> get serializer =>
      _$userDatasetsRecordSerializer;

  @BuiltValueField(wireName: 'dataset_id')
  String? get datasetId;

  @BuiltValueField(wireName: 'dataset_name')
  String? get datasetName;

  String? get description;

  @BuiltValueField(wireName: 'picture_url')
  String? get pictureUrl;

  @BuiltValueField(wireName: 'created_on')
  DateTime? get createdOn;

  @BuiltValueField(wireName: 'active_docs')
  BuiltList<String>? get activeDocs;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(UserDatasetsRecordBuilder builder) => builder
    ..datasetId = ''
    ..datasetName = ''
    ..description = ''
    ..pictureUrl = ''
    ..activeDocs = ListBuilder();

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_datasets')
          : FirebaseFirestore.instance.collectionGroup('user_datasets');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_datasets').doc();

  static Stream<UserDatasetsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserDatasetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserDatasetsRecord._();
  factory UserDatasetsRecord(
          [void Function(UserDatasetsRecordBuilder) updates]) =
      _$UserDatasetsRecord;

  static UserDatasetsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserDatasetsRecordData({
  String? datasetId,
  String? datasetName,
  String? description,
  String? pictureUrl,
  DateTime? createdOn,
}) {
  final firestoreData = serializers.toFirestore(
    UserDatasetsRecord.serializer,
    UserDatasetsRecord(
      (u) => u
        ..datasetId = datasetId
        ..datasetName = datasetName
        ..description = description
        ..pictureUrl = pictureUrl
        ..createdOn = createdOn
        ..activeDocs = null,
    ),
  );

  return firestoreData;
}
