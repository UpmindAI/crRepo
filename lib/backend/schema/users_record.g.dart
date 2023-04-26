// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.industry;
    if (value != null) {
      result
        ..add('industry')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.role;
    if (value != null) {
      result
        ..add('role')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.firstName;
    if (value != null) {
      result
        ..add('first_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('last_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.company;
    if (value != null) {
      result
        ..add('company')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.totalCredits;
    if (value != null) {
      result
        ..add('total_credits')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.firstLogin;
    if (value != null) {
      result
        ..add('first_login')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isAdmin;
    if (value != null) {
      result
        ..add('is_admin')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.summaryPrompt;
    if (value != null) {
      result
        ..add('summary_prompt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.chatGr;
    if (value != null) {
      result
        ..add('chat_gr')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.chatPersonality;
    if (value != null) {
      result
        ..add('chat_personality')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.introCreditsAdded;
    if (value != null) {
      result
        ..add('intro_credits_added')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.chatImage;
    if (value != null) {
      result
        ..add('chat_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.whitelabel;
    if (value != null) {
      result
        ..add('whitelabel')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.wlLight;
    if (value != null) {
      result
        ..add('wl_light')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.wlDark;
    if (value != null) {
      result
        ..add('wl_dark')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.walletAddress;
    if (value != null) {
      result
        ..add('wallet_address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'industry':
          result.industry = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'company':
          result.company = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'total_credits':
          result.totalCredits = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'first_login':
          result.firstLogin = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'is_admin':
          result.isAdmin = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'summary_prompt':
          result.summaryPrompt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'chat_gr':
          result.chatGr = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'chat_personality':
          result.chatPersonality = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'intro_credits_added':
          result.introCreditsAdded = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'chat_image':
          result.chatImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'whitelabel':
          result.whitelabel = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'wl_light':
          result.wlLight = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'wl_dark':
          result.wlDark = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'wallet_address':
          result.walletAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$UsersRecord extends UsersRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final String? industry;
  @override
  final String? role;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? company;
  @override
  final double? totalCredits;
  @override
  final bool? firstLogin;
  @override
  final bool? isAdmin;
  @override
  final String? summaryPrompt;
  @override
  final String? chatGr;
  @override
  final String? chatPersonality;
  @override
  final bool? introCreditsAdded;
  @override
  final String? chatImage;
  @override
  final bool? whitelabel;
  @override
  final String? wlLight;
  @override
  final String? wlDark;
  @override
  final String? walletAddress;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.industry,
      this.role,
      this.firstName,
      this.lastName,
      this.company,
      this.totalCredits,
      this.firstLogin,
      this.isAdmin,
      this.summaryPrompt,
      this.chatGr,
      this.chatPersonality,
      this.introCreditsAdded,
      this.chatImage,
      this.whitelabel,
      this.wlLight,
      this.wlDark,
      this.walletAddress,
      this.ffRef})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        industry == other.industry &&
        role == other.role &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        company == other.company &&
        totalCredits == other.totalCredits &&
        firstLogin == other.firstLogin &&
        isAdmin == other.isAdmin &&
        summaryPrompt == other.summaryPrompt &&
        chatGr == other.chatGr &&
        chatPersonality == other.chatPersonality &&
        introCreditsAdded == other.introCreditsAdded &&
        chatImage == other.chatImage &&
        whitelabel == other.whitelabel &&
        wlLight == other.wlLight &&
        wlDark == other.wlDark &&
        walletAddress == other.walletAddress &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, industry.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, company.hashCode);
    _$hash = $jc(_$hash, totalCredits.hashCode);
    _$hash = $jc(_$hash, firstLogin.hashCode);
    _$hash = $jc(_$hash, isAdmin.hashCode);
    _$hash = $jc(_$hash, summaryPrompt.hashCode);
    _$hash = $jc(_$hash, chatGr.hashCode);
    _$hash = $jc(_$hash, chatPersonality.hashCode);
    _$hash = $jc(_$hash, introCreditsAdded.hashCode);
    _$hash = $jc(_$hash, chatImage.hashCode);
    _$hash = $jc(_$hash, whitelabel.hashCode);
    _$hash = $jc(_$hash, wlLight.hashCode);
    _$hash = $jc(_$hash, wlDark.hashCode);
    _$hash = $jc(_$hash, walletAddress.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('industry', industry)
          ..add('role', role)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('company', company)
          ..add('totalCredits', totalCredits)
          ..add('firstLogin', firstLogin)
          ..add('isAdmin', isAdmin)
          ..add('summaryPrompt', summaryPrompt)
          ..add('chatGr', chatGr)
          ..add('chatPersonality', chatPersonality)
          ..add('introCreditsAdded', introCreditsAdded)
          ..add('chatImage', chatImage)
          ..add('whitelabel', whitelabel)
          ..add('wlLight', wlLight)
          ..add('wlDark', wlDark)
          ..add('walletAddress', walletAddress)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _industry;
  String? get industry => _$this._industry;
  set industry(String? industry) => _$this._industry = industry;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _company;
  String? get company => _$this._company;
  set company(String? company) => _$this._company = company;

  double? _totalCredits;
  double? get totalCredits => _$this._totalCredits;
  set totalCredits(double? totalCredits) => _$this._totalCredits = totalCredits;

  bool? _firstLogin;
  bool? get firstLogin => _$this._firstLogin;
  set firstLogin(bool? firstLogin) => _$this._firstLogin = firstLogin;

  bool? _isAdmin;
  bool? get isAdmin => _$this._isAdmin;
  set isAdmin(bool? isAdmin) => _$this._isAdmin = isAdmin;

  String? _summaryPrompt;
  String? get summaryPrompt => _$this._summaryPrompt;
  set summaryPrompt(String? summaryPrompt) =>
      _$this._summaryPrompt = summaryPrompt;

  String? _chatGr;
  String? get chatGr => _$this._chatGr;
  set chatGr(String? chatGr) => _$this._chatGr = chatGr;

  String? _chatPersonality;
  String? get chatPersonality => _$this._chatPersonality;
  set chatPersonality(String? chatPersonality) =>
      _$this._chatPersonality = chatPersonality;

  bool? _introCreditsAdded;
  bool? get introCreditsAdded => _$this._introCreditsAdded;
  set introCreditsAdded(bool? introCreditsAdded) =>
      _$this._introCreditsAdded = introCreditsAdded;

  String? _chatImage;
  String? get chatImage => _$this._chatImage;
  set chatImage(String? chatImage) => _$this._chatImage = chatImage;

  bool? _whitelabel;
  bool? get whitelabel => _$this._whitelabel;
  set whitelabel(bool? whitelabel) => _$this._whitelabel = whitelabel;

  String? _wlLight;
  String? get wlLight => _$this._wlLight;
  set wlLight(String? wlLight) => _$this._wlLight = wlLight;

  String? _wlDark;
  String? get wlDark => _$this._wlDark;
  set wlDark(String? wlDark) => _$this._wlDark = wlDark;

  String? _walletAddress;
  String? get walletAddress => _$this._walletAddress;
  set walletAddress(String? walletAddress) =>
      _$this._walletAddress = walletAddress;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _industry = $v.industry;
      _role = $v.role;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _company = $v.company;
      _totalCredits = $v.totalCredits;
      _firstLogin = $v.firstLogin;
      _isAdmin = $v.isAdmin;
      _summaryPrompt = $v.summaryPrompt;
      _chatGr = $v.chatGr;
      _chatPersonality = $v.chatPersonality;
      _introCreditsAdded = $v.introCreditsAdded;
      _chatImage = $v.chatImage;
      _whitelabel = $v.whitelabel;
      _wlLight = $v.wlLight;
      _wlDark = $v.wlDark;
      _walletAddress = $v.walletAddress;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    final _$result = _$v ??
        new _$UsersRecord._(
            email: email,
            displayName: displayName,
            photoUrl: photoUrl,
            uid: uid,
            createdTime: createdTime,
            phoneNumber: phoneNumber,
            industry: industry,
            role: role,
            firstName: firstName,
            lastName: lastName,
            company: company,
            totalCredits: totalCredits,
            firstLogin: firstLogin,
            isAdmin: isAdmin,
            summaryPrompt: summaryPrompt,
            chatGr: chatGr,
            chatPersonality: chatPersonality,
            introCreditsAdded: introCreditsAdded,
            chatImage: chatImage,
            whitelabel: whitelabel,
            wlLight: wlLight,
            wlDark: wlDark,
            walletAddress: walletAddress,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
