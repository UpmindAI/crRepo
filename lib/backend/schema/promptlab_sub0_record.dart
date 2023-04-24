import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'promptlab_sub0_record.g.dart';

abstract class PromptlabSub0Record
    implements Built<PromptlabSub0Record, PromptlabSub0RecordBuilder> {
  static Serializer<PromptlabSub0Record> get serializer =>
      _$promptlabSub0RecordSerializer;

  String? get folderName;

  BuiltList<PromptsStruct>? get prompts;

  DocumentReference? get parent;

  DateTime? get timestamp;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(PromptlabSub0RecordBuilder builder) => builder
    ..folderName = ''
    ..prompts = ListBuilder();

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('promptlab_sub0')
          : FirebaseFirestore.instance.collectionGroup('promptlab_sub0');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('promptlab_sub0').doc();

  static Stream<PromptlabSub0Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PromptlabSub0Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PromptlabSub0Record._();
  factory PromptlabSub0Record(
          [void Function(PromptlabSub0RecordBuilder) updates]) =
      _$PromptlabSub0Record;

  static PromptlabSub0Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPromptlabSub0RecordData({
  String? folderName,
  DocumentReference? parent,
  DateTime? timestamp,
}) {
  final firestoreData = serializers.toFirestore(
    PromptlabSub0Record.serializer,
    PromptlabSub0Record(
      (p) => p
        ..folderName = folderName
        ..prompts = null
        ..parent = parent
        ..timestamp = timestamp,
    ),
  );

  return firestoreData;
}
