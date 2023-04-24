// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FeatureRecord> _$featureRecordSerializer =
    new _$FeatureRecordSerializer();

class _$FeatureRecordSerializer implements StructuredSerializer<FeatureRecord> {
  @override
  final Iterable<Type> types = const [FeatureRecord, _$FeatureRecord];
  @override
  final String wireName = 'FeatureRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FeatureRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.iwant;
    if (value != null) {
      result
        ..add('iwant')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.because;
    if (value != null) {
      result
        ..add('because')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.additional;
    if (value != null) {
      result
        ..add('additional')
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
  FeatureRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FeatureRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'iwant':
          result.iwant = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'because':
          result.because = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'additional':
          result.additional = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_ref':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$FeatureRecord extends FeatureRecord {
  @override
  final String? iwant;
  @override
  final String? because;
  @override
  final String? additional;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DateTime? timestamp;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FeatureRecord([void Function(FeatureRecordBuilder)? updates]) =>
      (new FeatureRecordBuilder()..update(updates))._build();

  _$FeatureRecord._(
      {this.iwant,
      this.because,
      this.additional,
      this.userRef,
      this.timestamp,
      this.ffRef})
      : super._();

  @override
  FeatureRecord rebuild(void Function(FeatureRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FeatureRecordBuilder toBuilder() => new FeatureRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FeatureRecord &&
        iwant == other.iwant &&
        because == other.because &&
        additional == other.additional &&
        userRef == other.userRef &&
        timestamp == other.timestamp &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, iwant.hashCode);
    _$hash = $jc(_$hash, because.hashCode);
    _$hash = $jc(_$hash, additional.hashCode);
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FeatureRecord')
          ..add('iwant', iwant)
          ..add('because', because)
          ..add('additional', additional)
          ..add('userRef', userRef)
          ..add('timestamp', timestamp)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FeatureRecordBuilder
    implements Builder<FeatureRecord, FeatureRecordBuilder> {
  _$FeatureRecord? _$v;

  String? _iwant;
  String? get iwant => _$this._iwant;
  set iwant(String? iwant) => _$this._iwant = iwant;

  String? _because;
  String? get because => _$this._because;
  set because(String? because) => _$this._because = because;

  String? _additional;
  String? get additional => _$this._additional;
  set additional(String? additional) => _$this._additional = additional;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FeatureRecordBuilder() {
    FeatureRecord._initializeBuilder(this);
  }

  FeatureRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _iwant = $v.iwant;
      _because = $v.because;
      _additional = $v.additional;
      _userRef = $v.userRef;
      _timestamp = $v.timestamp;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FeatureRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FeatureRecord;
  }

  @override
  void update(void Function(FeatureRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FeatureRecord build() => _build();

  _$FeatureRecord _build() {
    final _$result = _$v ??
        new _$FeatureRecord._(
            iwant: iwant,
            because: because,
            additional: additional,
            userRef: userRef,
            timestamp: timestamp,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
