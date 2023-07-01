import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "industry" field.
  String? _industry;
  String get industry => _industry ?? '';
  bool hasIndustry() => _industry != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  bool hasCompany() => _company != null;

  // "total_credits" field.
  double? _totalCredits;
  double get totalCredits => _totalCredits ?? 0.0;
  bool hasTotalCredits() => _totalCredits != null;

  // "first_login" field.
  bool? _firstLogin;
  bool get firstLogin => _firstLogin ?? false;
  bool hasFirstLogin() => _firstLogin != null;

  // "is_admin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "summary_prompt" field.
  String? _summaryPrompt;
  String get summaryPrompt => _summaryPrompt ?? '';
  bool hasSummaryPrompt() => _summaryPrompt != null;

  // "chat_gr" field.
  String? _chatGr;
  String get chatGr => _chatGr ?? '';
  bool hasChatGr() => _chatGr != null;

  // "chat_personality" field.
  String? _chatPersonality;
  String get chatPersonality => _chatPersonality ?? '';
  bool hasChatPersonality() => _chatPersonality != null;

  // "intro_credits_added" field.
  bool? _introCreditsAdded;
  bool get introCreditsAdded => _introCreditsAdded ?? false;
  bool hasIntroCreditsAdded() => _introCreditsAdded != null;

  // "chat_image" field.
  String? _chatImage;
  String get chatImage => _chatImage ?? '';
  bool hasChatImage() => _chatImage != null;

  // "whitelabel" field.
  bool? _whitelabel;
  bool get whitelabel => _whitelabel ?? false;
  bool hasWhitelabel() => _whitelabel != null;

  // "wl_light" field.
  String? _wlLight;
  String get wlLight => _wlLight ?? '';
  bool hasWlLight() => _wlLight != null;

  // "wl_dark" field.
  String? _wlDark;
  String get wlDark => _wlDark ?? '';
  bool hasWlDark() => _wlDark != null;

  // "wallet_address" field.
  String? _walletAddress;
  String get walletAddress => _walletAddress ?? '';
  bool hasWalletAddress() => _walletAddress != null;

  // "ref_code" field.
  String? _refCode;
  String get refCode => _refCode ?? '';
  bool hasRefCode() => _refCode != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _industry = snapshotData['industry'] as String?;
    _role = snapshotData['role'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _company = snapshotData['company'] as String?;
    _totalCredits = castToType<double>(snapshotData['total_credits']);
    _firstLogin = snapshotData['first_login'] as bool?;
    _isAdmin = snapshotData['is_admin'] as bool?;
    _summaryPrompt = snapshotData['summary_prompt'] as String?;
    _chatGr = snapshotData['chat_gr'] as String?;
    _chatPersonality = snapshotData['chat_personality'] as String?;
    _introCreditsAdded = snapshotData['intro_credits_added'] as bool?;
    _chatImage = snapshotData['chat_image'] as String?;
    _whitelabel = snapshotData['whitelabel'] as bool?;
    _wlLight = snapshotData['wl_light'] as String?;
    _wlDark = snapshotData['wl_dark'] as String?;
    _walletAddress = snapshotData['wallet_address'] as String?;
    _refCode = snapshotData['ref_code'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
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
  String? walletAddress,
  String? refCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'industry': industry,
      'role': role,
      'first_name': firstName,
      'last_name': lastName,
      'company': company,
      'total_credits': totalCredits,
      'first_login': firstLogin,
      'is_admin': isAdmin,
      'summary_prompt': summaryPrompt,
      'chat_gr': chatGr,
      'chat_personality': chatPersonality,
      'intro_credits_added': introCreditsAdded,
      'chat_image': chatImage,
      'whitelabel': whitelabel,
      'wl_light': wlLight,
      'wl_dark': wlDark,
      'wallet_address': walletAddress,
      'ref_code': refCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.industry == e2?.industry &&
        e1?.role == e2?.role &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.company == e2?.company &&
        e1?.totalCredits == e2?.totalCredits &&
        e1?.firstLogin == e2?.firstLogin &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.summaryPrompt == e2?.summaryPrompt &&
        e1?.chatGr == e2?.chatGr &&
        e1?.chatPersonality == e2?.chatPersonality &&
        e1?.introCreditsAdded == e2?.introCreditsAdded &&
        e1?.chatImage == e2?.chatImage &&
        e1?.whitelabel == e2?.whitelabel &&
        e1?.wlLight == e2?.wlLight &&
        e1?.wlDark == e2?.wlDark &&
        e1?.walletAddress == e2?.walletAddress &&
        e1?.refCode == e2?.refCode;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.industry,
        e?.role,
        e?.firstName,
        e?.lastName,
        e?.company,
        e?.totalCredits,
        e?.firstLogin,
        e?.isAdmin,
        e?.summaryPrompt,
        e?.chatGr,
        e?.chatPersonality,
        e?.introCreditsAdded,
        e?.chatImage,
        e?.whitelabel,
        e?.wlLight,
        e?.wlDark,
        e?.walletAddress,
        e?.refCode
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
