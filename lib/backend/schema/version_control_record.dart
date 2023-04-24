import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'version_control_record.g.dart';

abstract class VersionControlRecord
    implements Built<VersionControlRecord, VersionControlRecordBuilder> {
  static Serializer<VersionControlRecord> get serializer =>
      _$versionControlRecordSerializer;

  int? get version;

  @BuiltValueField(wireName: 'needs_update')
  bool? get needsUpdate;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(VersionControlRecordBuilder builder) => builder
    ..version = 0
    ..needsUpdate = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('version_control');

  static Stream<VersionControlRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<VersionControlRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  VersionControlRecord._();
  factory VersionControlRecord(
          [void Function(VersionControlRecordBuilder) updates]) =
      _$VersionControlRecord;

  static VersionControlRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createVersionControlRecordData({
  int? version,
  bool? needsUpdate,
}) {
  final firestoreData = serializers.toFirestore(
    VersionControlRecord.serializer,
    VersionControlRecord(
      (v) => v
        ..version = version
        ..needsUpdate = needsUpdate,
    ),
  );

  return firestoreData;
}
