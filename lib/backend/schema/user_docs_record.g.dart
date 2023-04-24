// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_docs_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserDocsRecord> _$userDocsRecordSerializer =
    new _$UserDocsRecordSerializer();

class _$UserDocsRecordSerializer
    implements StructuredSerializer<UserDocsRecord> {
  @override
  final Iterable<Type> types = const [UserDocsRecord, _$UserDocsRecord];
  @override
  final String wireName = 'UserDocsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserDocsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.datasetId;
    if (value != null) {
      result
        ..add('dataset_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isActive;
    if (value != null) {
      result
        ..add('is_active')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.docId;
    if (value != null) {
      result
        ..add('doc_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.docTitle;
    if (value != null) {
      result
        ..add('doc_title')
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
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.processing;
    if (value != null) {
      result
        ..add('processing')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.fileType;
    if (value != null) {
      result
        ..add('file_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  UserDocsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserDocsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'dataset_id':
          result.datasetId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_active':
          result.isActive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'doc_id':
          result.docId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doc_title':
          result.docTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'processing':
          result.processing = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'file_type':
          result.fileType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'progress_status':
          result.progressStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'progress_percentage':
          result.progressPercentage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$UserDocsRecord extends UserDocsRecord {
  @override
  final String? datasetId;
  @override
  final bool? isActive;
  @override
  final String? docId;
  @override
  final String? docTitle;
  @override
  final DateTime? timestamp;
  @override
  final String? url;
  @override
  final bool? processing;
  @override
  final String? fileType;
  @override
  final String? progressStatus;
  @override
  final int? progressPercentage;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserDocsRecord([void Function(UserDocsRecordBuilder)? updates]) =>
      (new UserDocsRecordBuilder()..update(updates))._build();

  _$UserDocsRecord._(
      {this.datasetId,
      this.isActive,
      this.docId,
      this.docTitle,
      this.timestamp,
      this.url,
      this.processing,
      this.fileType,
      this.progressStatus,
      this.progressPercentage,
      this.ffRef})
      : super._();

  @override
  UserDocsRecord rebuild(void Function(UserDocsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDocsRecordBuilder toBuilder() =>
      new UserDocsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDocsRecord &&
        datasetId == other.datasetId &&
        isActive == other.isActive &&
        docId == other.docId &&
        docTitle == other.docTitle &&
        timestamp == other.timestamp &&
        url == other.url &&
        processing == other.processing &&
        fileType == other.fileType &&
        progressStatus == other.progressStatus &&
        progressPercentage == other.progressPercentage &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, datasetId.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jc(_$hash, docId.hashCode);
    _$hash = $jc(_$hash, docTitle.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, processing.hashCode);
    _$hash = $jc(_$hash, fileType.hashCode);
    _$hash = $jc(_$hash, progressStatus.hashCode);
    _$hash = $jc(_$hash, progressPercentage.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserDocsRecord')
          ..add('datasetId', datasetId)
          ..add('isActive', isActive)
          ..add('docId', docId)
          ..add('docTitle', docTitle)
          ..add('timestamp', timestamp)
          ..add('url', url)
          ..add('processing', processing)
          ..add('fileType', fileType)
          ..add('progressStatus', progressStatus)
          ..add('progressPercentage', progressPercentage)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserDocsRecordBuilder
    implements Builder<UserDocsRecord, UserDocsRecordBuilder> {
  _$UserDocsRecord? _$v;

  String? _datasetId;
  String? get datasetId => _$this._datasetId;
  set datasetId(String? datasetId) => _$this._datasetId = datasetId;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  String? _docId;
  String? get docId => _$this._docId;
  set docId(String? docId) => _$this._docId = docId;

  String? _docTitle;
  String? get docTitle => _$this._docTitle;
  set docTitle(String? docTitle) => _$this._docTitle = docTitle;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  bool? _processing;
  bool? get processing => _$this._processing;
  set processing(bool? processing) => _$this._processing = processing;

  String? _fileType;
  String? get fileType => _$this._fileType;
  set fileType(String? fileType) => _$this._fileType = fileType;

  String? _progressStatus;
  String? get progressStatus => _$this._progressStatus;
  set progressStatus(String? progressStatus) =>
      _$this._progressStatus = progressStatus;

  int? _progressPercentage;
  int? get progressPercentage => _$this._progressPercentage;
  set progressPercentage(int? progressPercentage) =>
      _$this._progressPercentage = progressPercentage;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserDocsRecordBuilder() {
    UserDocsRecord._initializeBuilder(this);
  }

  UserDocsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _datasetId = $v.datasetId;
      _isActive = $v.isActive;
      _docId = $v.docId;
      _docTitle = $v.docTitle;
      _timestamp = $v.timestamp;
      _url = $v.url;
      _processing = $v.processing;
      _fileType = $v.fileType;
      _progressStatus = $v.progressStatus;
      _progressPercentage = $v.progressPercentage;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDocsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserDocsRecord;
  }

  @override
  void update(void Function(UserDocsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserDocsRecord build() => _build();

  _$UserDocsRecord _build() {
    final _$result = _$v ??
        new _$UserDocsRecord._(
            datasetId: datasetId,
            isActive: isActive,
            docId: docId,
            docTitle: docTitle,
            timestamp: timestamp,
            url: url,
            processing: processing,
            fileType: fileType,
            progressStatus: progressStatus,
            progressPercentage: progressPercentage,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
