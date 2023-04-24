import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'promptlab_record.g.dart';

abstract class PromptlabRecord
    implements Built<PromptlabRecord, PromptlabRecordBuilder> {
  static Serializer<PromptlabRecord> get serializer =>
      _$promptlabRecordSerializer;

  BuiltList<PromptsStruct>? get prompts;

  DateTime? get timestamp;

  @BuiltValueField(wireName: 'folder_name')
  String? get folderName;

  BuiltList<PlChildStruct>? get children;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(PromptlabRecordBuilder builder) => builder
    ..prompts = ListBuilder()
    ..folderName = ''
    ..children = ListBuilder();

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('promptlab')
          : FirebaseFirestore.instance.collectionGroup('promptlab');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('promptlab').doc();

  static Stream<PromptlabRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PromptlabRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PromptlabRecord._();
  factory PromptlabRecord([void Function(PromptlabRecordBuilder) updates]) =
      _$PromptlabRecord;

  static PromptlabRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPromptlabRecordData({
  DateTime? timestamp,
  String? folderName,
}) {
  final firestoreData = serializers.toFirestore(
    PromptlabRecord.serializer,
    PromptlabRecord(
      (p) => p
        ..prompts = null
        ..timestamp = timestamp
        ..folderName = folderName
        ..children = null,
    ),
  );

  return firestoreData;
}
