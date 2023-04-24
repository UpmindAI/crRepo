// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promptlab_sub0_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PromptlabSub0Record> _$promptlabSub0RecordSerializer =
    new _$PromptlabSub0RecordSerializer();

class _$PromptlabSub0RecordSerializer
    implements StructuredSerializer<PromptlabSub0Record> {
  @override
  final Iterable<Type> types = const [
    PromptlabSub0Record,
    _$PromptlabSub0Record
  ];
  @override
  final String wireName = 'PromptlabSub0Record';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PromptlabSub0Record object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.folderName;
    if (value != null) {
      result
        ..add('folderName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.prompts;
    if (value != null) {
      result
        ..add('prompts')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(PromptsStruct)])));
    }
    value = object.parent;
    if (value != null) {
      result
        ..add('parent')
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
  PromptlabSub0Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PromptlabSub0RecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'folderName':
          result.folderName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'prompts':
          result.prompts.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PromptsStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'parent':
          result.parent = serializers.deserialize(value,
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

class _$PromptlabSub0Record extends PromptlabSub0Record {
  @override
  final String? folderName;
  @override
  final BuiltList<PromptsStruct>? prompts;
  @override
  final DocumentReference<Object?>? parent;
  @override
  final DateTime? timestamp;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PromptlabSub0Record(
          [void Function(PromptlabSub0RecordBuilder)? updates]) =>
      (new PromptlabSub0RecordBuilder()..update(updates))._build();

  _$PromptlabSub0Record._(
      {this.folderName, this.prompts, this.parent, this.timestamp, this.ffRef})
      : super._();

  @override
  PromptlabSub0Record rebuild(
          void Function(PromptlabSub0RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PromptlabSub0RecordBuilder toBuilder() =>
      new PromptlabSub0RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PromptlabSub0Record &&
        folderName == other.folderName &&
        prompts == other.prompts &&
        parent == other.parent &&
        timestamp == other.timestamp &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, folderName.hashCode);
    _$hash = $jc(_$hash, prompts.hashCode);
    _$hash = $jc(_$hash, parent.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PromptlabSub0Record')
          ..add('folderName', folderName)
          ..add('prompts', prompts)
          ..add('parent', parent)
          ..add('timestamp', timestamp)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PromptlabSub0RecordBuilder
    implements Builder<PromptlabSub0Record, PromptlabSub0RecordBuilder> {
  _$PromptlabSub0Record? _$v;

  String? _folderName;
  String? get folderName => _$this._folderName;
  set folderName(String? folderName) => _$this._folderName = folderName;

  ListBuilder<PromptsStruct>? _prompts;
  ListBuilder<PromptsStruct> get prompts =>
      _$this._prompts ??= new ListBuilder<PromptsStruct>();
  set prompts(ListBuilder<PromptsStruct>? prompts) => _$this._prompts = prompts;

  DocumentReference<Object?>? _parent;
  DocumentReference<Object?>? get parent => _$this._parent;
  set parent(DocumentReference<Object?>? parent) => _$this._parent = parent;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PromptlabSub0RecordBuilder() {
    PromptlabSub0Record._initializeBuilder(this);
  }

  PromptlabSub0RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _folderName = $v.folderName;
      _prompts = $v.prompts?.toBuilder();
      _parent = $v.parent;
      _timestamp = $v.timestamp;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PromptlabSub0Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PromptlabSub0Record;
  }

  @override
  void update(void Function(PromptlabSub0RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PromptlabSub0Record build() => _build();

  _$PromptlabSub0Record _build() {
    _$PromptlabSub0Record _$result;
    try {
      _$result = _$v ??
          new _$PromptlabSub0Record._(
              folderName: folderName,
              prompts: _prompts?.build(),
              parent: parent,
              timestamp: timestamp,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'prompts';
        _prompts?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PromptlabSub0Record', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
