// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_control_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VersionControlRecord> _$versionControlRecordSerializer =
    new _$VersionControlRecordSerializer();

class _$VersionControlRecordSerializer
    implements StructuredSerializer<VersionControlRecord> {
  @override
  final Iterable<Type> types = const [
    VersionControlRecord,
    _$VersionControlRecord
  ];
  @override
  final String wireName = 'VersionControlRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, VersionControlRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.version;
    if (value != null) {
      result
        ..add('version')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.needsUpdate;
    if (value != null) {
      result
        ..add('needs_update')
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
  VersionControlRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VersionControlRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'version':
          result.version = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'needs_update':
          result.needsUpdate = serializers.deserialize(value,
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

class _$VersionControlRecord extends VersionControlRecord {
  @override
  final int? version;
  @override
  final bool? needsUpdate;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$VersionControlRecord(
          [void Function(VersionControlRecordBuilder)? updates]) =>
      (new VersionControlRecordBuilder()..update(updates))._build();

  _$VersionControlRecord._({this.version, this.needsUpdate, this.ffRef})
      : super._();

  @override
  VersionControlRecord rebuild(
          void Function(VersionControlRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VersionControlRecordBuilder toBuilder() =>
      new VersionControlRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VersionControlRecord &&
        version == other.version &&
        needsUpdate == other.needsUpdate &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, needsUpdate.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VersionControlRecord')
          ..add('version', version)
          ..add('needsUpdate', needsUpdate)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class VersionControlRecordBuilder
    implements Builder<VersionControlRecord, VersionControlRecordBuilder> {
  _$VersionControlRecord? _$v;

  int? _version;
  int? get version => _$this._version;
  set version(int? version) => _$this._version = version;

  bool? _needsUpdate;
  bool? get needsUpdate => _$this._needsUpdate;
  set needsUpdate(bool? needsUpdate) => _$this._needsUpdate = needsUpdate;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  VersionControlRecordBuilder() {
    VersionControlRecord._initializeBuilder(this);
  }

  VersionControlRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _version = $v.version;
      _needsUpdate = $v.needsUpdate;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VersionControlRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VersionControlRecord;
  }

  @override
  void update(void Function(VersionControlRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VersionControlRecord build() => _build();

  _$VersionControlRecord _build() {
    final _$result = _$v ??
        new _$VersionControlRecord._(
            version: version, needsUpdate: needsUpdate, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
