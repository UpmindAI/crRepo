// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_bots_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SharedBotsRecord> _$sharedBotsRecordSerializer =
    new _$SharedBotsRecordSerializer();

class _$SharedBotsRecordSerializer
    implements StructuredSerializer<SharedBotsRecord> {
  @override
  final Iterable<Type> types = const [SharedBotsRecord, _$SharedBotsRecord];
  @override
  final String wireName = 'SharedBotsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, SharedBotsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.bid;
    if (value != null) {
      result
        ..add('bid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.docTitles;
    if (value != null) {
      result
        ..add('doc_titles')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.docIds;
    if (value != null) {
      result
        ..add('doc_ids')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.guardrail;
    if (value != null) {
      result
        ..add('guardrail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.system;
    if (value != null) {
      result
        ..add('system')
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
    value = object.topK;
    if (value != null) {
      result
        ..add('top_k')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
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
  SharedBotsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SharedBotsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'bid':
          result.bid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doc_titles':
          result.docTitles.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'doc_ids':
          result.docIds.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'guardrail':
          result.guardrail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'system':
          result.system = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'top_k':
          result.topK = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
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

class _$SharedBotsRecord extends SharedBotsRecord {
  @override
  final String? bid;
  @override
  final BuiltList<String>? docTitles;
  @override
  final BuiltList<String>? docIds;
  @override
  final String? guardrail;
  @override
  final String? system;
  @override
  final DateTime? timestamp;
  @override
  final double? topK;
  @override
  final String? image;
  @override
  final String? uid;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SharedBotsRecord(
          [void Function(SharedBotsRecordBuilder)? updates]) =>
      (new SharedBotsRecordBuilder()..update(updates))._build();

  _$SharedBotsRecord._(
      {this.bid,
      this.docTitles,
      this.docIds,
      this.guardrail,
      this.system,
      this.timestamp,
      this.topK,
      this.image,
      this.uid,
      this.ffRef})
      : super._();

  @override
  SharedBotsRecord rebuild(void Function(SharedBotsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SharedBotsRecordBuilder toBuilder() =>
      new SharedBotsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SharedBotsRecord &&
        bid == other.bid &&
        docTitles == other.docTitles &&
        docIds == other.docIds &&
        guardrail == other.guardrail &&
        system == other.system &&
        timestamp == other.timestamp &&
        topK == other.topK &&
        image == other.image &&
        uid == other.uid &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, bid.hashCode);
    _$hash = $jc(_$hash, docTitles.hashCode);
    _$hash = $jc(_$hash, docIds.hashCode);
    _$hash = $jc(_$hash, guardrail.hashCode);
    _$hash = $jc(_$hash, system.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, topK.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SharedBotsRecord')
          ..add('bid', bid)
          ..add('docTitles', docTitles)
          ..add('docIds', docIds)
          ..add('guardrail', guardrail)
          ..add('system', system)
          ..add('timestamp', timestamp)
          ..add('topK', topK)
          ..add('image', image)
          ..add('uid', uid)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SharedBotsRecordBuilder
    implements Builder<SharedBotsRecord, SharedBotsRecordBuilder> {
  _$SharedBotsRecord? _$v;

  String? _bid;
  String? get bid => _$this._bid;
  set bid(String? bid) => _$this._bid = bid;

  ListBuilder<String>? _docTitles;
  ListBuilder<String> get docTitles =>
      _$this._docTitles ??= new ListBuilder<String>();
  set docTitles(ListBuilder<String>? docTitles) =>
      _$this._docTitles = docTitles;

  ListBuilder<String>? _docIds;
  ListBuilder<String> get docIds =>
      _$this._docIds ??= new ListBuilder<String>();
  set docIds(ListBuilder<String>? docIds) => _$this._docIds = docIds;

  String? _guardrail;
  String? get guardrail => _$this._guardrail;
  set guardrail(String? guardrail) => _$this._guardrail = guardrail;

  String? _system;
  String? get system => _$this._system;
  set system(String? system) => _$this._system = system;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  double? _topK;
  double? get topK => _$this._topK;
  set topK(double? topK) => _$this._topK = topK;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SharedBotsRecordBuilder() {
    SharedBotsRecord._initializeBuilder(this);
  }

  SharedBotsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bid = $v.bid;
      _docTitles = $v.docTitles?.toBuilder();
      _docIds = $v.docIds?.toBuilder();
      _guardrail = $v.guardrail;
      _system = $v.system;
      _timestamp = $v.timestamp;
      _topK = $v.topK;
      _image = $v.image;
      _uid = $v.uid;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SharedBotsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SharedBotsRecord;
  }

  @override
  void update(void Function(SharedBotsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SharedBotsRecord build() => _build();

  _$SharedBotsRecord _build() {
    _$SharedBotsRecord _$result;
    try {
      _$result = _$v ??
          new _$SharedBotsRecord._(
              bid: bid,
              docTitles: _docTitles?.build(),
              docIds: _docIds?.build(),
              guardrail: guardrail,
              system: system,
              timestamp: timestamp,
              topK: topK,
              image: image,
              uid: uid,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'docTitles';
        _docTitles?.build();
        _$failedField = 'docIds';
        _docIds?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SharedBotsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
