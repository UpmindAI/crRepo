// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_gr_history_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChatGrHistoryRecord> _$chatGrHistoryRecordSerializer =
    new _$ChatGrHistoryRecordSerializer();

class _$ChatGrHistoryRecordSerializer
    implements StructuredSerializer<ChatGrHistoryRecord> {
  @override
  final Iterable<Type> types = const [
    ChatGrHistoryRecord,
    _$ChatGrHistoryRecord
  ];
  @override
  final String wireName = 'ChatGrHistoryRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ChatGrHistoryRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
    value = object.gr;
    if (value != null) {
      result
        ..add('gr')
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
  ChatGrHistoryRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatGrHistoryRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'is_favorite':
          result.isFavorite = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'gr':
          result.gr = serializers.deserialize(value,
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

class _$ChatGrHistoryRecord extends ChatGrHistoryRecord {
  @override
  final DateTime? timestamp;
  @override
  final bool? isFavorite;
  @override
  final String? gr;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChatGrHistoryRecord(
          [void Function(ChatGrHistoryRecordBuilder)? updates]) =>
      (new ChatGrHistoryRecordBuilder()..update(updates))._build();

  _$ChatGrHistoryRecord._(
      {this.timestamp, this.isFavorite, this.gr, this.ffRef})
      : super._();

  @override
  ChatGrHistoryRecord rebuild(
          void Function(ChatGrHistoryRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatGrHistoryRecordBuilder toBuilder() =>
      new ChatGrHistoryRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatGrHistoryRecord &&
        timestamp == other.timestamp &&
        isFavorite == other.isFavorite &&
        gr == other.gr &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, isFavorite.hashCode);
    _$hash = $jc(_$hash, gr.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatGrHistoryRecord')
          ..add('timestamp', timestamp)
          ..add('isFavorite', isFavorite)
          ..add('gr', gr)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChatGrHistoryRecordBuilder
    implements Builder<ChatGrHistoryRecord, ChatGrHistoryRecordBuilder> {
  _$ChatGrHistoryRecord? _$v;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  bool? _isFavorite;
  bool? get isFavorite => _$this._isFavorite;
  set isFavorite(bool? isFavorite) => _$this._isFavorite = isFavorite;

  String? _gr;
  String? get gr => _$this._gr;
  set gr(String? gr) => _$this._gr = gr;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ChatGrHistoryRecordBuilder() {
    ChatGrHistoryRecord._initializeBuilder(this);
  }

  ChatGrHistoryRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _timestamp = $v.timestamp;
      _isFavorite = $v.isFavorite;
      _gr = $v.gr;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatGrHistoryRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatGrHistoryRecord;
  }

  @override
  void update(void Function(ChatGrHistoryRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatGrHistoryRecord build() => _build();

  _$ChatGrHistoryRecord _build() {
    final _$result = _$v ??
        new _$ChatGrHistoryRecord._(
            timestamp: timestamp, isFavorite: isFavorite, gr: gr, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
