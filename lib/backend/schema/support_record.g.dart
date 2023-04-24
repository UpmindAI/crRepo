// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SupportRecord> _$supportRecordSerializer =
    new _$SupportRecordSerializer();

class _$SupportRecordSerializer implements StructuredSerializer<SupportRecord> {
  @override
  final Iterable<Type> types = const [SupportRecord, _$SupportRecord];
  @override
  final String wireName = 'SupportRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, SupportRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('user_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.question;
    if (value != null) {
      result
        ..add('question')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.timestamp;
    if (value != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  SupportRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SupportRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_ref':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'question':
          result.question = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$SupportRecord extends SupportRecord {
  @override
  final String? uid;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final String? question;
  @override
  final DateTime? timestamp;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SupportRecord([void Function(SupportRecordBuilder)? updates]) =>
      (new SupportRecordBuilder()..update(updates))._build();

  _$SupportRecord._(
      {this.uid, this.userRef, this.question, this.timestamp, this.ffRef})
      : super._();

  @override
  SupportRecord rebuild(void Function(SupportRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SupportRecordBuilder toBuilder() => new SupportRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SupportRecord &&
        uid == other.uid &&
        userRef == other.userRef &&
        question == other.question &&
        timestamp == other.timestamp &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, question.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SupportRecord')
          ..add('uid', uid)
          ..add('userRef', userRef)
          ..add('question', question)
          ..add('timestamp', timestamp)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SupportRecordBuilder
    implements Builder<SupportRecord, SupportRecordBuilder> {
  _$SupportRecord? _$v;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  String? _question;
  String? get question => _$this._question;
  set question(String? question) => _$this._question = question;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SupportRecordBuilder() {
    SupportRecord._initializeBuilder(this);
  }

  SupportRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _userRef = $v.userRef;
      _question = $v.question;
      _timestamp = $v.timestamp;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SupportRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SupportRecord;
  }

  @override
  void update(void Function(SupportRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SupportRecord build() => _build();

  _$SupportRecord _build() {
    final _$result = _$v ??
        new _$SupportRecord._(
            uid: uid,
            userRef: userRef,
            question: question,
            timestamp: timestamp,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
