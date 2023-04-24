import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_prompts_record.g.dart';

abstract class UserPromptsRecord
    implements Built<UserPromptsRecord, UserPromptsRecordBuilder> {
  static Serializer<UserPromptsRecord> get serializer =>
      _$userPromptsRecordSerializer;

  String? get qid;

  String? get prompt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(UserPromptsRecordBuilder builder) => builder
    ..qid = ''
    ..prompt = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_prompts')
          : FirebaseFirestore.instance.collectionGroup('user_prompts');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_prompts').doc();

  static Stream<UserPromptsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserPromptsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserPromptsRecord._();
  factory UserPromptsRecord([void Function(UserPromptsRecordBuilder) updates]) =
      _$UserPromptsRecord;

  static UserPromptsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserPromptsRecordData({
  String? qid,
  String? prompt,
}) {
  final firestoreData = serializers.toFirestore(
    UserPromptsRecord.serializer,
    UserPromptsRecord(
      (u) => u
        ..qid = qid
        ..prompt = prompt,
    ),
  );

  return firestoreData;
}
