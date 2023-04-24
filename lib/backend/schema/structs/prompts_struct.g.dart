// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompts_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PromptsStruct> _$promptsStructSerializer =
    new _$PromptsStructSerializer();

class _$PromptsStructSerializer implements StructuredSerializer<PromptsStruct> {
  @override
  final Iterable<Type> types = const [PromptsStruct, _$PromptsStruct];
  @override
  final String wireName = 'PromptsStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, PromptsStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
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
    return result;
  }

  @override
  PromptsStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PromptsStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
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
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$PromptsStruct extends PromptsStruct {
  @override
  final String? name;
  @override
  final String? prompt;
  @override
  final DateTime? timestamp;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$PromptsStruct([void Function(PromptsStructBuilder)? updates]) =>
      (new PromptsStructBuilder()..update(updates))._build();

  _$PromptsStruct._(
      {this.name, this.prompt, this.timestamp, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'PromptsStruct', 'firestoreUtilData');
  }

  @override
  PromptsStruct rebuild(void Function(PromptsStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PromptsStructBuilder toBuilder() => new PromptsStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PromptsStruct &&
        name == other.name &&
        prompt == other.prompt &&
        timestamp == other.timestamp &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, prompt.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PromptsStruct')
          ..add('name', name)
          ..add('prompt', prompt)
          ..add('timestamp', timestamp)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class PromptsStructBuilder
    implements Builder<PromptsStruct, PromptsStructBuilder> {
  _$PromptsStruct? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _prompt;
  String? get prompt => _$this._prompt;
  set prompt(String? prompt) => _$this._prompt = prompt;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  PromptsStructBuilder() {
    PromptsStruct._initializeBuilder(this);
  }

  PromptsStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _prompt = $v.prompt;
      _timestamp = $v.timestamp;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PromptsStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PromptsStruct;
  }

  @override
  void update(void Function(PromptsStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PromptsStruct build() => _build();

  _$PromptsStruct _build() {
    final _$result = _$v ??
        new _$PromptsStruct._(
            name: name,
            prompt: prompt,
            timestamp: timestamp,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'PromptsStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
