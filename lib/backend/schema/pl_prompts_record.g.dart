// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pl_prompts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PlPromptsRecord> _$plPromptsRecordSerializer =
    new _$PlPromptsRecordSerializer();

class _$PlPromptsRecordSerializer
    implements StructuredSerializer<PlPromptsRecord> {
  @override
  final Iterable<Type> types = const [PlPromptsRecord, _$PlPromptsRecord];
  @override
  final String wireName = 'PlPromptsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PlPromptsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.system;
    if (value != null) {
      result
        ..add('system')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.content;
    if (value != null) {
      result
        ..add('content')
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
    value = object.timestamp;
    if (value != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.activeDatasets;
    if (value != null) {
      result
        ..add('active_datasets')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.completion;
    if (value != null) {
      result
        ..add('completion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.plid;
    if (value != null) {
      result
        ..add('plid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.topK;
    if (value != null) {
      result
        ..add('top_k')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.temp;
    if (value != null) {
      result
        ..add('temp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  PlPromptsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlPromptsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'system':
          result.system = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'prompt':
          result.prompt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'active_datasets':
          result.activeDatasets.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'completion':
          result.completion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'plid':
          result.plid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'top_k':
          result.topK = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'temp':
          result.temp = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$PlPromptsRecord extends PlPromptsRecord {
  @override
  final String? system;
  @override
  final String? content;
  @override
  final String? prompt;
  @override
  final DateTime? timestamp;
  @override
  final BuiltList<String>? activeDatasets;
  @override
  final String? completion;
  @override
  final String? plid;
  @override
  final int? topK;
  @override
  final double? temp;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PlPromptsRecord([void Function(PlPromptsRecordBuilder)? updates]) =>
      (new PlPromptsRecordBuilder()..update(updates))._build();

  _$PlPromptsRecord._(
      {this.system,
      this.content,
      this.prompt,
      this.timestamp,
      this.activeDatasets,
      this.completion,
      this.plid,
      this.topK,
      this.temp,
      this.ffRef})
      : super._();

  @override
  PlPromptsRecord rebuild(void Function(PlPromptsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlPromptsRecordBuilder toBuilder() =>
      new PlPromptsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PlPromptsRecord &&
        system == other.system &&
        content == other.content &&
        prompt == other.prompt &&
        timestamp == other.timestamp &&
        activeDatasets == other.activeDatasets &&
        completion == other.completion &&
        plid == other.plid &&
        topK == other.topK &&
        temp == other.temp &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, system.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, prompt.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, activeDatasets.hashCode);
    _$hash = $jc(_$hash, completion.hashCode);
    _$hash = $jc(_$hash, plid.hashCode);
    _$hash = $jc(_$hash, topK.hashCode);
    _$hash = $jc(_$hash, temp.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PlPromptsRecord')
          ..add('system', system)
          ..add('content', content)
          ..add('prompt', prompt)
          ..add('timestamp', timestamp)
          ..add('activeDatasets', activeDatasets)
          ..add('completion', completion)
          ..add('plid', plid)
          ..add('topK', topK)
          ..add('temp', temp)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PlPromptsRecordBuilder
    implements Builder<PlPromptsRecord, PlPromptsRecordBuilder> {
  _$PlPromptsRecord? _$v;

  String? _system;
  String? get system => _$this._system;
  set system(String? system) => _$this._system = system;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  String? _prompt;
  String? get prompt => _$this._prompt;
  set prompt(String? prompt) => _$this._prompt = prompt;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  ListBuilder<String>? _activeDatasets;
  ListBuilder<String> get activeDatasets =>
      _$this._activeDatasets ??= new ListBuilder<String>();
  set activeDatasets(ListBuilder<String>? activeDatasets) =>
      _$this._activeDatasets = activeDatasets;

  String? _completion;
  String? get completion => _$this._completion;
  set completion(String? completion) => _$this._completion = completion;

  String? _plid;
  String? get plid => _$this._plid;
  set plid(String? plid) => _$this._plid = plid;

  int? _topK;
  int? get topK => _$this._topK;
  set topK(int? topK) => _$this._topK = topK;

  double? _temp;
  double? get temp => _$this._temp;
  set temp(double? temp) => _$this._temp = temp;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PlPromptsRecordBuilder() {
    PlPromptsRecord._initializeBuilder(this);
  }

  PlPromptsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _system = $v.system;
      _content = $v.content;
      _prompt = $v.prompt;
      _timestamp = $v.timestamp;
      _activeDatasets = $v.activeDatasets?.toBuilder();
      _completion = $v.completion;
      _plid = $v.plid;
      _topK = $v.topK;
      _temp = $v.temp;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PlPromptsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PlPromptsRecord;
  }

  @override
  void update(void Function(PlPromptsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PlPromptsRecord build() => _build();

  _$PlPromptsRecord _build() {
    _$PlPromptsRecord _$result;
    try {
      _$result = _$v ??
          new _$PlPromptsRecord._(
              system: system,
              content: content,
              prompt: prompt,
              timestamp: timestamp,
              activeDatasets: _activeDatasets?.build(),
              completion: completion,
              plid: plid,
              topK: topK,
              temp: temp,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'activeDatasets';
        _activeDatasets?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PlPromptsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
