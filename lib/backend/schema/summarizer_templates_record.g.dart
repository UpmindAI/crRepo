// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summarizer_templates_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SummarizerTemplatesRecord> _$summarizerTemplatesRecordSerializer =
    new _$SummarizerTemplatesRecordSerializer();

class _$SummarizerTemplatesRecordSerializer
    implements StructuredSerializer<SummarizerTemplatesRecord> {
  @override
  final Iterable<Type> types = const [
    SummarizerTemplatesRecord,
    _$SummarizerTemplatesRecord
  ];
  @override
  final String wireName = 'SummarizerTemplatesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SummarizerTemplatesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.template;
    if (value != null) {
      result
        ..add('template')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  SummarizerTemplatesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SummarizerTemplatesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'template':
          result.template.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
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

class _$SummarizerTemplatesRecord extends SummarizerTemplatesRecord {
  @override
  final BuiltList<String>? template;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SummarizerTemplatesRecord(
          [void Function(SummarizerTemplatesRecordBuilder)? updates]) =>
      (new SummarizerTemplatesRecordBuilder()..update(updates))._build();

  _$SummarizerTemplatesRecord._({this.template, this.ffRef}) : super._();

  @override
  SummarizerTemplatesRecord rebuild(
          void Function(SummarizerTemplatesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SummarizerTemplatesRecordBuilder toBuilder() =>
      new SummarizerTemplatesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SummarizerTemplatesRecord &&
        template == other.template &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, template.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SummarizerTemplatesRecord')
          ..add('template', template)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SummarizerTemplatesRecordBuilder
    implements
        Builder<SummarizerTemplatesRecord, SummarizerTemplatesRecordBuilder> {
  _$SummarizerTemplatesRecord? _$v;

  ListBuilder<String>? _template;
  ListBuilder<String> get template =>
      _$this._template ??= new ListBuilder<String>();
  set template(ListBuilder<String>? template) => _$this._template = template;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SummarizerTemplatesRecordBuilder() {
    SummarizerTemplatesRecord._initializeBuilder(this);
  }

  SummarizerTemplatesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _template = $v.template?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SummarizerTemplatesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SummarizerTemplatesRecord;
  }

  @override
  void update(void Function(SummarizerTemplatesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SummarizerTemplatesRecord build() => _build();

  _$SummarizerTemplatesRecord _build() {
    _$SummarizerTemplatesRecord _$result;
    try {
      _$result = _$v ??
          new _$SummarizerTemplatesRecord._(
              template: _template?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'template';
        _template?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SummarizerTemplatesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
