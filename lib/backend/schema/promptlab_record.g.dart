// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promptlab_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PromptlabRecord> _$promptlabRecordSerializer =
    new _$PromptlabRecordSerializer();

class _$PromptlabRecordSerializer
    implements StructuredSerializer<PromptlabRecord> {
  @override
  final Iterable<Type> types = const [PromptlabRecord, _$PromptlabRecord];
  @override
  final String wireName = 'PromptlabRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PromptlabRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.prompts;
    if (value != null) {
      result
        ..add('prompts')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(PromptsStruct)])));
    }
    value = object.timestamp;
    if (value != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.folderName;
    if (value != null) {
      result
        ..add('folder_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.children;
    if (value != null) {
      result
        ..add('children')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(PlChildStruct)])));
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
  PromptlabRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PromptlabRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'prompts':
          result.prompts.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PromptsStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'folder_name':
          result.folderName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'children':
          result.children.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PlChildStruct)]))!
              as BuiltList<Object?>);
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

class _$PromptlabRecord extends PromptlabRecord {
  @override
  final BuiltList<PromptsStruct>? prompts;
  @override
  final DateTime? timestamp;
  @override
  final String? folderName;
  @override
  final BuiltList<PlChildStruct>? children;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PromptlabRecord([void Function(PromptlabRecordBuilder)? updates]) =>
      (new PromptlabRecordBuilder()..update(updates))._build();

  _$PromptlabRecord._(
      {this.prompts,
      this.timestamp,
      this.folderName,
      this.children,
      this.ffRef})
      : super._();

  @override
  PromptlabRecord rebuild(void Function(PromptlabRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PromptlabRecordBuilder toBuilder() =>
      new PromptlabRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PromptlabRecord &&
        prompts == other.prompts &&
        timestamp == other.timestamp &&
        folderName == other.folderName &&
        children == other.children &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, prompts.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, folderName.hashCode);
    _$hash = $jc(_$hash, children.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PromptlabRecord')
          ..add('prompts', prompts)
          ..add('timestamp', timestamp)
          ..add('folderName', folderName)
          ..add('children', children)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PromptlabRecordBuilder
    implements Builder<PromptlabRecord, PromptlabRecordBuilder> {
  _$PromptlabRecord? _$v;

  ListBuilder<PromptsStruct>? _prompts;
  ListBuilder<PromptsStruct> get prompts =>
      _$this._prompts ??= new ListBuilder<PromptsStruct>();
  set prompts(ListBuilder<PromptsStruct>? prompts) => _$this._prompts = prompts;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  String? _folderName;
  String? get folderName => _$this._folderName;
  set folderName(String? folderName) => _$this._folderName = folderName;

  ListBuilder<PlChildStruct>? _children;
  ListBuilder<PlChildStruct> get children =>
      _$this._children ??= new ListBuilder<PlChildStruct>();
  set children(ListBuilder<PlChildStruct>? children) =>
      _$this._children = children;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PromptlabRecordBuilder() {
    PromptlabRecord._initializeBuilder(this);
  }

  PromptlabRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _prompts = $v.prompts?.toBuilder();
      _timestamp = $v.timestamp;
      _folderName = $v.folderName;
      _children = $v.children?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PromptlabRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PromptlabRecord;
  }

  @override
  void update(void Function(PromptlabRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PromptlabRecord build() => _build();

  _$PromptlabRecord _build() {
    _$PromptlabRecord _$result;
    try {
      _$result = _$v ??
          new _$PromptlabRecord._(
              prompts: _prompts?.build(),
              timestamp: timestamp,
              folderName: folderName,
              children: _children?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'prompts';
        _prompts?.build();

        _$failedField = 'children';
        _children?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PromptlabRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
