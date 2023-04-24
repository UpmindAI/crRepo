// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_chats_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SharedChatsRecord> _$sharedChatsRecordSerializer =
    new _$SharedChatsRecordSerializer();

class _$SharedChatsRecordSerializer
    implements StructuredSerializer<SharedChatsRecord> {
  @override
  final Iterable<Type> types = const [SharedChatsRecord, _$SharedChatsRecord];
  @override
  final String wireName = 'SharedChatsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, SharedChatsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.cid;
    if (value != null) {
      result
        ..add('cid')
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
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isCompletion;
    if (value != null) {
      result
        ..add('is_completion')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.datasetIds;
    if (value != null) {
      result
        ..add('dataset_ids')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.qid;
    if (value != null) {
      result
        ..add('qid')
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
    value = object.completion;
    if (value != null) {
      result
        ..add('completion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.datasetNames;
    if (value != null) {
      result
        ..add('dataset_names')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.docTitles;
    if (value != null) {
      result
        ..add('doc_titles')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.isLoading;
    if (value != null) {
      result
        ..add('is_loading')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isError;
    if (value != null) {
      result
        ..add('is_error')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.sources;
    if (value != null) {
      result
        ..add('sources')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(SourcesStruct)])));
    }
    value = object.bid;
    if (value != null) {
      result
        ..add('bid')
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
  SharedChatsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SharedChatsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'cid':
          result.cid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_completion':
          result.isCompletion = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'dataset_ids':
          result.datasetIds.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'qid':
          result.qid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'prompt':
          result.prompt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'completion':
          result.completion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dataset_names':
          result.datasetNames.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'doc_titles':
          result.docTitles.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'is_loading':
          result.isLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_error':
          result.isError = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'sources':
          result.sources.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SourcesStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'bid':
          result.bid = serializers.deserialize(value,
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

class _$SharedChatsRecord extends SharedChatsRecord {
  @override
  final String? cid;
  @override
  final DateTime? timestamp;
  @override
  final String? message;
  @override
  final bool? isCompletion;
  @override
  final BuiltList<String>? datasetIds;
  @override
  final String? qid;
  @override
  final String? prompt;
  @override
  final String? completion;
  @override
  final BuiltList<String>? datasetNames;
  @override
  final BuiltList<String>? docTitles;
  @override
  final bool? isLoading;
  @override
  final String? uid;
  @override
  final bool? isError;
  @override
  final BuiltList<SourcesStruct>? sources;
  @override
  final String? bid;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SharedChatsRecord(
          [void Function(SharedChatsRecordBuilder)? updates]) =>
      (new SharedChatsRecordBuilder()..update(updates))._build();

  _$SharedChatsRecord._(
      {this.cid,
      this.timestamp,
      this.message,
      this.isCompletion,
      this.datasetIds,
      this.qid,
      this.prompt,
      this.completion,
      this.datasetNames,
      this.docTitles,
      this.isLoading,
      this.uid,
      this.isError,
      this.sources,
      this.bid,
      this.ffRef})
      : super._();

  @override
  SharedChatsRecord rebuild(void Function(SharedChatsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SharedChatsRecordBuilder toBuilder() =>
      new SharedChatsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SharedChatsRecord &&
        cid == other.cid &&
        timestamp == other.timestamp &&
        message == other.message &&
        isCompletion == other.isCompletion &&
        datasetIds == other.datasetIds &&
        qid == other.qid &&
        prompt == other.prompt &&
        completion == other.completion &&
        datasetNames == other.datasetNames &&
        docTitles == other.docTitles &&
        isLoading == other.isLoading &&
        uid == other.uid &&
        isError == other.isError &&
        sources == other.sources &&
        bid == other.bid &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cid.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, isCompletion.hashCode);
    _$hash = $jc(_$hash, datasetIds.hashCode);
    _$hash = $jc(_$hash, qid.hashCode);
    _$hash = $jc(_$hash, prompt.hashCode);
    _$hash = $jc(_$hash, completion.hashCode);
    _$hash = $jc(_$hash, datasetNames.hashCode);
    _$hash = $jc(_$hash, docTitles.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, isError.hashCode);
    _$hash = $jc(_$hash, sources.hashCode);
    _$hash = $jc(_$hash, bid.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SharedChatsRecord')
          ..add('cid', cid)
          ..add('timestamp', timestamp)
          ..add('message', message)
          ..add('isCompletion', isCompletion)
          ..add('datasetIds', datasetIds)
          ..add('qid', qid)
          ..add('prompt', prompt)
          ..add('completion', completion)
          ..add('datasetNames', datasetNames)
          ..add('docTitles', docTitles)
          ..add('isLoading', isLoading)
          ..add('uid', uid)
          ..add('isError', isError)
          ..add('sources', sources)
          ..add('bid', bid)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SharedChatsRecordBuilder
    implements Builder<SharedChatsRecord, SharedChatsRecordBuilder> {
  _$SharedChatsRecord? _$v;

  String? _cid;
  String? get cid => _$this._cid;
  set cid(String? cid) => _$this._cid = cid;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _isCompletion;
  bool? get isCompletion => _$this._isCompletion;
  set isCompletion(bool? isCompletion) => _$this._isCompletion = isCompletion;

  ListBuilder<String>? _datasetIds;
  ListBuilder<String> get datasetIds =>
      _$this._datasetIds ??= new ListBuilder<String>();
  set datasetIds(ListBuilder<String>? datasetIds) =>
      _$this._datasetIds = datasetIds;

  String? _qid;
  String? get qid => _$this._qid;
  set qid(String? qid) => _$this._qid = qid;

  String? _prompt;
  String? get prompt => _$this._prompt;
  set prompt(String? prompt) => _$this._prompt = prompt;

  String? _completion;
  String? get completion => _$this._completion;
  set completion(String? completion) => _$this._completion = completion;

  ListBuilder<String>? _datasetNames;
  ListBuilder<String> get datasetNames =>
      _$this._datasetNames ??= new ListBuilder<String>();
  set datasetNames(ListBuilder<String>? datasetNames) =>
      _$this._datasetNames = datasetNames;

  ListBuilder<String>? _docTitles;
  ListBuilder<String> get docTitles =>
      _$this._docTitles ??= new ListBuilder<String>();
  set docTitles(ListBuilder<String>? docTitles) =>
      _$this._docTitles = docTitles;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  bool? _isError;
  bool? get isError => _$this._isError;
  set isError(bool? isError) => _$this._isError = isError;

  ListBuilder<SourcesStruct>? _sources;
  ListBuilder<SourcesStruct> get sources =>
      _$this._sources ??= new ListBuilder<SourcesStruct>();
  set sources(ListBuilder<SourcesStruct>? sources) => _$this._sources = sources;

  String? _bid;
  String? get bid => _$this._bid;
  set bid(String? bid) => _$this._bid = bid;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SharedChatsRecordBuilder() {
    SharedChatsRecord._initializeBuilder(this);
  }

  SharedChatsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cid = $v.cid;
      _timestamp = $v.timestamp;
      _message = $v.message;
      _isCompletion = $v.isCompletion;
      _datasetIds = $v.datasetIds?.toBuilder();
      _qid = $v.qid;
      _prompt = $v.prompt;
      _completion = $v.completion;
      _datasetNames = $v.datasetNames?.toBuilder();
      _docTitles = $v.docTitles?.toBuilder();
      _isLoading = $v.isLoading;
      _uid = $v.uid;
      _isError = $v.isError;
      _sources = $v.sources?.toBuilder();
      _bid = $v.bid;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SharedChatsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SharedChatsRecord;
  }

  @override
  void update(void Function(SharedChatsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SharedChatsRecord build() => _build();

  _$SharedChatsRecord _build() {
    _$SharedChatsRecord _$result;
    try {
      _$result = _$v ??
          new _$SharedChatsRecord._(
              cid: cid,
              timestamp: timestamp,
              message: message,
              isCompletion: isCompletion,
              datasetIds: _datasetIds?.build(),
              qid: qid,
              prompt: prompt,
              completion: completion,
              datasetNames: _datasetNames?.build(),
              docTitles: _docTitles?.build(),
              isLoading: isLoading,
              uid: uid,
              isError: isError,
              sources: _sources?.build(),
              bid: bid,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'datasetIds';
        _datasetIds?.build();

        _$failedField = 'datasetNames';
        _datasetNames?.build();
        _$failedField = 'docTitles';
        _docTitles?.build();

        _$failedField = 'sources';
        _sources?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SharedChatsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
