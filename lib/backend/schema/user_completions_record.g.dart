// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_completions_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserCompletionsRecord> _$userCompletionsRecordSerializer =
    new _$UserCompletionsRecordSerializer();

class _$UserCompletionsRecordSerializer
    implements StructuredSerializer<UserCompletionsRecord> {
  @override
  final Iterable<Type> types = const [
    UserCompletionsRecord,
    _$UserCompletionsRecord
  ];
  @override
  final String wireName = 'UserCompletionsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserCompletionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
    value = object.url;
    if (value != null) {
      result
        ..add('url')
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
    value = object.chunks;
    if (value != null) {
      result
        ..add('chunks')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.datasetIds;
    if (value != null) {
      result
        ..add('dataset_ids')
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
    value = object.datasetNames;
    if (value != null) {
      result
        ..add('dataset_names')
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
    value = object.progressStatus;
    if (value != null) {
      result
        ..add('progress_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.progressPercentage;
    if (value != null) {
      result
        ..add('progress_percentage')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  UserCompletionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserCompletionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
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
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'chunks':
          result.chunks.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'dataset_ids':
          result.datasetIds.replace(serializers.deserialize(value,
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
        case 'dataset_names':
          result.datasetNames.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'is_loading':
          result.isLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'progress_status':
          result.progressStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'progress_percentage':
          result.progressPercentage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$UserCompletionsRecord extends UserCompletionsRecord {
  @override
  final String? qid;
  @override
  final String? prompt;
  @override
  final String? completion;
  @override
  final String? url;
  @override
  final DateTime? timestamp;
  @override
  final BuiltList<String>? chunks;
  @override
  final BuiltList<String>? datasetIds;
  @override
  final BuiltList<String>? docTitles;
  @override
  final BuiltList<String>? datasetNames;
  @override
  final bool? isLoading;
  @override
  final String? progressStatus;
  @override
  final int? progressPercentage;
  @override
  final bool? isError;
  @override
  final BuiltList<SourcesStruct>? sources;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserCompletionsRecord(
          [void Function(UserCompletionsRecordBuilder)? updates]) =>
      (new UserCompletionsRecordBuilder()..update(updates))._build();

  _$UserCompletionsRecord._(
      {this.qid,
      this.prompt,
      this.completion,
      this.url,
      this.timestamp,
      this.chunks,
      this.datasetIds,
      this.docTitles,
      this.datasetNames,
      this.isLoading,
      this.progressStatus,
      this.progressPercentage,
      this.isError,
      this.sources,
      this.ffRef})
      : super._();

  @override
  UserCompletionsRecord rebuild(
          void Function(UserCompletionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserCompletionsRecordBuilder toBuilder() =>
      new UserCompletionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserCompletionsRecord &&
        qid == other.qid &&
        prompt == other.prompt &&
        completion == other.completion &&
        url == other.url &&
        timestamp == other.timestamp &&
        chunks == other.chunks &&
        datasetIds == other.datasetIds &&
        docTitles == other.docTitles &&
        datasetNames == other.datasetNames &&
        isLoading == other.isLoading &&
        progressStatus == other.progressStatus &&
        progressPercentage == other.progressPercentage &&
        isError == other.isError &&
        sources == other.sources &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, qid.hashCode);
    _$hash = $jc(_$hash, prompt.hashCode);
    _$hash = $jc(_$hash, completion.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, chunks.hashCode);
    _$hash = $jc(_$hash, datasetIds.hashCode);
    _$hash = $jc(_$hash, docTitles.hashCode);
    _$hash = $jc(_$hash, datasetNames.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, progressStatus.hashCode);
    _$hash = $jc(_$hash, progressPercentage.hashCode);
    _$hash = $jc(_$hash, isError.hashCode);
    _$hash = $jc(_$hash, sources.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserCompletionsRecord')
          ..add('qid', qid)
          ..add('prompt', prompt)
          ..add('completion', completion)
          ..add('url', url)
          ..add('timestamp', timestamp)
          ..add('chunks', chunks)
          ..add('datasetIds', datasetIds)
          ..add('docTitles', docTitles)
          ..add('datasetNames', datasetNames)
          ..add('isLoading', isLoading)
          ..add('progressStatus', progressStatus)
          ..add('progressPercentage', progressPercentage)
          ..add('isError', isError)
          ..add('sources', sources)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserCompletionsRecordBuilder
    implements Builder<UserCompletionsRecord, UserCompletionsRecordBuilder> {
  _$UserCompletionsRecord? _$v;

  String? _qid;
  String? get qid => _$this._qid;
  set qid(String? qid) => _$this._qid = qid;

  String? _prompt;
  String? get prompt => _$this._prompt;
  set prompt(String? prompt) => _$this._prompt = prompt;

  String? _completion;
  String? get completion => _$this._completion;
  set completion(String? completion) => _$this._completion = completion;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  ListBuilder<String>? _chunks;
  ListBuilder<String> get chunks =>
      _$this._chunks ??= new ListBuilder<String>();
  set chunks(ListBuilder<String>? chunks) => _$this._chunks = chunks;

  ListBuilder<String>? _datasetIds;
  ListBuilder<String> get datasetIds =>
      _$this._datasetIds ??= new ListBuilder<String>();
  set datasetIds(ListBuilder<String>? datasetIds) =>
      _$this._datasetIds = datasetIds;

  ListBuilder<String>? _docTitles;
  ListBuilder<String> get docTitles =>
      _$this._docTitles ??= new ListBuilder<String>();
  set docTitles(ListBuilder<String>? docTitles) =>
      _$this._docTitles = docTitles;

  ListBuilder<String>? _datasetNames;
  ListBuilder<String> get datasetNames =>
      _$this._datasetNames ??= new ListBuilder<String>();
  set datasetNames(ListBuilder<String>? datasetNames) =>
      _$this._datasetNames = datasetNames;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _progressStatus;
  String? get progressStatus => _$this._progressStatus;
  set progressStatus(String? progressStatus) =>
      _$this._progressStatus = progressStatus;

  int? _progressPercentage;
  int? get progressPercentage => _$this._progressPercentage;
  set progressPercentage(int? progressPercentage) =>
      _$this._progressPercentage = progressPercentage;

  bool? _isError;
  bool? get isError => _$this._isError;
  set isError(bool? isError) => _$this._isError = isError;

  ListBuilder<SourcesStruct>? _sources;
  ListBuilder<SourcesStruct> get sources =>
      _$this._sources ??= new ListBuilder<SourcesStruct>();
  set sources(ListBuilder<SourcesStruct>? sources) => _$this._sources = sources;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserCompletionsRecordBuilder() {
    UserCompletionsRecord._initializeBuilder(this);
  }

  UserCompletionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _qid = $v.qid;
      _prompt = $v.prompt;
      _completion = $v.completion;
      _url = $v.url;
      _timestamp = $v.timestamp;
      _chunks = $v.chunks?.toBuilder();
      _datasetIds = $v.datasetIds?.toBuilder();
      _docTitles = $v.docTitles?.toBuilder();
      _datasetNames = $v.datasetNames?.toBuilder();
      _isLoading = $v.isLoading;
      _progressStatus = $v.progressStatus;
      _progressPercentage = $v.progressPercentage;
      _isError = $v.isError;
      _sources = $v.sources?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserCompletionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserCompletionsRecord;
  }

  @override
  void update(void Function(UserCompletionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserCompletionsRecord build() => _build();

  _$UserCompletionsRecord _build() {
    _$UserCompletionsRecord _$result;
    try {
      _$result = _$v ??
          new _$UserCompletionsRecord._(
              qid: qid,
              prompt: prompt,
              completion: completion,
              url: url,
              timestamp: timestamp,
              chunks: _chunks?.build(),
              datasetIds: _datasetIds?.build(),
              docTitles: _docTitles?.build(),
              datasetNames: _datasetNames?.build(),
              isLoading: isLoading,
              progressStatus: progressStatus,
              progressPercentage: progressPercentage,
              isError: isError,
              sources: _sources?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'chunks';
        _chunks?.build();
        _$failedField = 'datasetIds';
        _datasetIds?.build();
        _$failedField = 'docTitles';
        _docTitles?.build();
        _$failedField = 'datasetNames';
        _datasetNames?.build();

        _$failedField = 'sources';
        _sources?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserCompletionsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
