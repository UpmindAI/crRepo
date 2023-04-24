// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_pers_history_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChatPersHistoryRecord> _$chatPersHistoryRecordSerializer =
    new _$ChatPersHistoryRecordSerializer();

class _$ChatPersHistoryRecordSerializer
    implements StructuredSerializer<ChatPersHistoryRecord> {
  @override
  final Iterable<Type> types = const [
    ChatPersHistoryRecord,
    _$ChatPersHistoryRecord
  ];
  @override
  final String wireName = 'ChatPersHistoryRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ChatPersHistoryRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.personality;
    if (value != null) {
      result
        ..add('personality')
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
  ChatPersHistoryRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatPersHistoryRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'personality':
          result.personality = serializers.deserialize(value,
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

class _$ChatPersHistoryRecord extends ChatPersHistoryRecord {
  @override
  final String? personality;
  @override
  final DateTime? timestamp;
  @override
  final bool? isFavorite;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChatPersHistoryRecord(
          [void Function(ChatPersHistoryRecordBuilder)? updates]) =>
      (new ChatPersHistoryRecordBuilder()..update(updates))._build();

  _$ChatPersHistoryRecord._(
      {this.personality, this.timestamp, this.isFavorite, this.ffRef})
      : super._();

  @override
  ChatPersHistoryRecord rebuild(
          void Function(ChatPersHistoryRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatPersHistoryRecordBuilder toBuilder() =>
      new ChatPersHistoryRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatPersHistoryRecord &&
        personality == other.personality &&
        timestamp == other.timestamp &&
        isFavorite == other.isFavorite &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, personality.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, isFavorite.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatPersHistoryRecord')
          ..add('personality', personality)
          ..add('timestamp', timestamp)
          ..add('isFavorite', isFavorite)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChatPersHistoryRecordBuilder
    implements Builder<ChatPersHistoryRecord, ChatPersHistoryRecordBuilder> {
  _$ChatPersHistoryRecord? _$v;

  String? _personality;
  String? get personality => _$this._personality;
  set personality(String? personality) => _$this._personality = personality;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  bool? _isFavorite;
  bool? get isFavorite => _$this._isFavorite;
  set isFavorite(bool? isFavorite) => _$this._isFavorite = isFavorite;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ChatPersHistoryRecordBuilder() {
    ChatPersHistoryRecord._initializeBuilder(this);
  }

  ChatPersHistoryRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _personality = $v.personality;
      _timestamp = $v.timestamp;
      _isFavorite = $v.isFavorite;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatPersHistoryRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatPersHistoryRecord;
  }

  @override
  void update(void Function(ChatPersHistoryRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatPersHistoryRecord build() => _build();

  _$ChatPersHistoryRecord _build() {
    final _$result = _$v ??
        new _$ChatPersHistoryRecord._(
            personality: personality,
            timestamp: timestamp,
            isFavorite: isFavorite,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
