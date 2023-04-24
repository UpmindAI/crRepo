// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summ_prompt_history_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SummPromptHistoryRecord> _$summPromptHistoryRecordSerializer =
    new _$SummPromptHistoryRecordSerializer();

class _$SummPromptHistoryRecordSerializer
    implements StructuredSerializer<SummPromptHistoryRecord> {
  @override
  final Iterable<Type> types = const [
    SummPromptHistoryRecord,
    _$SummPromptHistoryRecord
  ];
  @override
  final String wireName = 'SummPromptHistoryRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SummPromptHistoryRecord object,
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
    value = object.timestamp;
    if (value != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.isFavorite;
    if (value != null) {
      result
        ..add('is_favorite')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  SummPromptHistoryRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SummPromptHistoryRecordBuilder();

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
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'is_favorite':
          result.isFavorite = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$SummPromptHistoryRecord extends SummPromptHistoryRecord {
  @override
  final String? prompt;
  @override
  final DateTime? timestamp;
  @override
  final bool? isFavorite;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SummPromptHistoryRecord(
          [void Function(SummPromptHistoryRecordBuilder)? updates]) =>
      (new SummPromptHistoryRecordBuilder()..update(updates))._build();

  _$SummPromptHistoryRecord._(
      {this.prompt, this.timestamp, this.isFavorite, this.ffRef})
      : super._();

  @override
  SummPromptHistoryRecord rebuild(
          void Function(SummPromptHistoryRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SummPromptHistoryRecordBuilder toBuilder() =>
      new SummPromptHistoryRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SummPromptHistoryRecord &&
        prompt == other.prompt &&
        timestamp == other.timestamp &&
        isFavorite == other.isFavorite &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, prompt.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, isFavorite.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SummPromptHistoryRecord')
          ..add('prompt', prompt)
          ..add('timestamp', timestamp)
          ..add('isFavorite', isFavorite)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SummPromptHistoryRecordBuilder
    implements
        Builder<SummPromptHistoryRecord, SummPromptHistoryRecordBuilder> {
  _$SummPromptHistoryRecord? _$v;

  String? _prompt;
  String? get prompt => _$this._prompt;
  set prompt(String? prompt) => _$this._prompt = prompt;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  bool? _isFavorite;
  bool? get isFavorite => _$this._isFavorite;
  set isFavorite(bool? isFavorite) => _$this._isFavorite = isFavorite;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SummPromptHistoryRecordBuilder() {
    SummPromptHistoryRecord._initializeBuilder(this);
  }

  SummPromptHistoryRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _prompt = $v.prompt;
      _timestamp = $v.timestamp;
      _isFavorite = $v.isFavorite;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SummPromptHistoryRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SummPromptHistoryRecord;
  }

  @override
  void update(void Function(SummPromptHistoryRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SummPromptHistoryRecord build() => _build();

  _$SummPromptHistoryRecord _build() {
    final _$result = _$v ??
        new _$SummPromptHistoryRecord._(
            prompt: prompt,
            timestamp: timestamp,
            isFavorite: isFavorite,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
