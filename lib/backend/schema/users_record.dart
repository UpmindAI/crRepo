import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  String? get industry;

  String? get role;

  @BuiltValueField(wireName: 'first_name')
  String? get firstName;

  @BuiltValueField(wireName: 'last_name')
  String? get lastName;

  String? get company;

  @BuiltValueField(wireName: 'total_credits')
  double? get totalCredits;

  @BuiltValueField(wireName: 'first_login')
  bool? get firstLogin;

  @BuiltValueField(wireName: 'is_admin')
  bool? get isAdmin;

  @BuiltValueField(wireName: 'summary_prompt')
  String? get summaryPrompt;

  @BuiltValueField(wireName: 'chat_gr')
  String? get chatGr;

  @BuiltValueField(wireName: 'chat_personality')
  String? get chatPersonality;

  @BuiltValueField(wireName: 'intro_credits_added')
  bool? get introCreditsAdded;

  @BuiltValueField(wireName: 'chat_image')
  String? get chatImage;

  bool? get whitelabel;

  @BuiltValueField(wireName: 'wl_light')
  String? get wlLight;

  @BuiltValueField(wireName: 'wl_dark')
  String? get wlDark;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..industry = ''
    ..role = ''
    ..firstName = ''
    ..lastName = ''
    ..company = ''
    ..totalCredits = 0.0
    ..firstLogin = false
    ..isAdmin = false
    ..summaryPrompt = ''
    ..chatGr = ''
    ..chatPersonality = ''
    ..introCreditsAdded = false
    ..chatImage = ''
    ..whitelabel = false
    ..wlLight = ''
    ..wlDark = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? industry,
  String? role,
  String? firstName,
  String? lastName,
  String? company,
  double? totalCredits,
  bool? firstLogin,
  bool? isAdmin,
  String? summaryPrompt,
  String? chatGr,
  String? chatPersonality,
  bool? introCreditsAdded,
  String? chatImage,
  bool? whitelabel,
  String? wlLight,
  String? wlDark,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..industry = industry
        ..role = role
        ..firstName = firstName
        ..lastName = lastName
        ..company = company
        ..totalCredits = totalCredits
        ..firstLogin = firstLogin
        ..isAdmin = isAdmin
        ..summaryPrompt = summaryPrompt
        ..chatGr = chatGr
        ..chatPersonality = chatPersonality
        ..introCreditsAdded = introCreditsAdded
        ..chatImage = chatImage
        ..whitelabel = whitelabel
        ..wlLight = wlLight
        ..wlDark = wlDark,
    ),
  );

  return firestoreData;
}
