// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_prompts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserPromptsRecord> _$userPromptsRecordSerializer =
    new _$UserPromptsRecordSerializer();

class _$UserPromptsRecordSerializer
    implements StructuredSerializer<UserPromptsRecord> {
  @override
  final Iterable<Type> types = const [UserPromptsRecord, _$UserPromptsRecord];
  @override
  final String wireName = 'UserPromptsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserPromptsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.qid;
    if (value != null) {
      result
        ..add('qid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.prompt;
    if (value != null) {
      result
        ..add('prompt')
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
  UserPromptsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserPromptsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'qid':
          result.qid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'prompt':
          result.prompt = serializers.deserialize(value,
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

class _$UserPromptsRecord extends UserPromptsRecord {
  @override
  final String? qid;
  @override
  final String? prompt;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserPromptsRecord(
          [void Function(UserPromptsRecordBuilder)? updates]) =>
      (new UserPromptsRecordBuilder()..update(updates))._build();

  _$UserPromptsRecord._({this.qid, this.prompt, this.ffRef}) : super._();

  @override
  UserPromptsRecord rebuild(void Function(UserPromptsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserPromptsRecordBuilder toBuilder() =>
      new UserPromptsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserPromptsRecord &&
        qid == other.qid &&
        prompt == other.prompt &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, qid.hashCode);
    _$hash = $jc(_$hash, prompt.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserPromptsRecord')
          ..add('qid', qid)
          ..add('prompt', prompt)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserPromptsRecordBuilder
    implements Builder<UserPromptsRecord, UserPromptsRecordBuilder> {
  _$UserPromptsRecord? _$v;

  String? _qid;
  String? get qid => _$this._qid;
  set qid(String? qid) => _$this._qid = qid;

  String? _prompt;
  String? get prompt => _$this._prompt;
  set prompt(String? prompt) => _$this._prompt = prompt;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserPromptsRecordBuilder() {
    UserPromptsRecord._initializeBuilder(this);
  }

  UserPromptsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _qid = $v.qid;
      _prompt = $v.prompt;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserPromptsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserPromptsRecord;
  }

  @override
  void update(void Function(UserPromptsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserPromptsRecord build() => _build();

  _$UserPromptsRecord _build() {
    final _$result = _$v ??
        new _$UserPromptsRecord._(qid: qid, prompt: prompt, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
