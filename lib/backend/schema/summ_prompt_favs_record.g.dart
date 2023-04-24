// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summ_prompt_favs_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SummPromptFavsRecord> _$summPromptFavsRecordSerializer =
    new _$SummPromptFavsRecordSerializer();

class _$SummPromptFavsRecordSerializer
    implements StructuredSerializer<SummPromptFavsRecord> {
  @override
  final Iterable<Type> types = const [
    SummPromptFavsRecord,
    _$SummPromptFavsRecord
  ];
  @override
  final String wireName = 'SummPromptFavsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SummPromptFavsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
  SummPromptFavsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SummPromptFavsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
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

class _$SummPromptFavsRecord extends SummPromptFavsRecord {
  @override
  final String? prompt;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SummPromptFavsRecord(
          [void Function(SummPromptFavsRecordBuilder)? updates]) =>
      (new SummPromptFavsRecordBuilder()..update(updates))._build();

  _$SummPromptFavsRecord._({this.prompt, this.ffRef}) : super._();

  @override
  SummPromptFavsRecord rebuild(
          void Function(SummPromptFavsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SummPromptFavsRecordBuilder toBuilder() =>
      new SummPromptFavsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SummPromptFavsRecord &&
        prompt == other.prompt &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, prompt.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SummPromptFavsRecord')
          ..add('prompt', prompt)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SummPromptFavsRecordBuilder
    implements Builder<SummPromptFavsRecord, SummPromptFavsRecordBuilder> {
  _$SummPromptFavsRecord? _$v;

  String? _prompt;
  String? get prompt => _$this._prompt;
  set prompt(String? prompt) => _$this._prompt = prompt;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SummPromptFavsRecordBuilder() {
    SummPromptFavsRecord._initializeBuilder(this);
  }

  SummPromptFavsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _prompt = $v.prompt;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SummPromptFavsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SummPromptFavsRecord;
  }

  @override
  void update(void Function(SummPromptFavsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SummPromptFavsRecord build() => _build();

  _$SummPromptFavsRecord _build() {
    final _$result =
        _$v ?? new _$SummPromptFavsRecord._(prompt: prompt, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
