// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appdata_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppdataRecord> _$appdataRecordSerializer =
    new _$AppdataRecordSerializer();

class _$AppdataRecordSerializer implements StructuredSerializer<AppdataRecord> {
  @override
  final Iterable<Type> types = const [AppdataRecord, _$AppdataRecord];
  @override
  final String wireName = 'AppdataRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppdataRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.chatImage;
    if (value != null) {
      result
        ..add('chat_image')
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
  AppdataRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppdataRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'chat_image':
          result.chatImage = serializers.deserialize(value,
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

class _$AppdataRecord extends AppdataRecord {
  @override
  final String? chatImage;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AppdataRecord([void Function(AppdataRecordBuilder)? updates]) =>
      (new AppdataRecordBuilder()..update(updates))._build();

  _$AppdataRecord._({this.chatImage, this.ffRef}) : super._();

  @override
  AppdataRecord rebuild(void Function(AppdataRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppdataRecordBuilder toBuilder() => new AppdataRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppdataRecord &&
        chatImage == other.chatImage &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, chatImage.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppdataRecord')
          ..add('chatImage', chatImage)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AppdataRecordBuilder
    implements Builder<AppdataRecord, AppdataRecordBuilder> {
  _$AppdataRecord? _$v;

  String? _chatImage;
  String? get chatImage => _$this._chatImage;
  set chatImage(String? chatImage) => _$this._chatImage = chatImage;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AppdataRecordBuilder() {
    AppdataRecord._initializeBuilder(this);
  }

  AppdataRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _chatImage = $v.chatImage;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppdataRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppdataRecord;
  }

  @override
  void update(void Function(AppdataRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppdataRecord build() => _build();

  _$AppdataRecord _build() {
    final _$result =
        _$v ?? new _$AppdataRecord._(chatImage: chatImage, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
