// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_temp_uploads_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserTempUploadsRecord> _$userTempUploadsRecordSerializer =
    new _$UserTempUploadsRecordSerializer();

class _$UserTempUploadsRecordSerializer
    implements StructuredSerializer<UserTempUploadsRecord> {
  @override
  final Iterable<Type> types = const [
    UserTempUploadsRecord,
    _$UserTempUploadsRecord
  ];
  @override
  final String wireName = 'UserTempUploadsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserTempUploadsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.docTitle;
    if (value != null) {
      result
        ..add('doc_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.docId;
    if (value != null) {
      result
        ..add('doc_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.datasetName;
    if (value != null) {
      result
        ..add('dataset_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.datasetId;
    if (value != null) {
      result
        ..add('dataset_id')
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
    value = object.chunkSize;
    if (value != null) {
      result
        ..add('chunk_size')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.urls;
    if (value != null) {
      result
        ..add('urls')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.urlId;
    if (value != null) {
      result
        ..add('url_id')
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
  UserTempUploadsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserTempUploadsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'doc_title':
          result.docTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doc_id':
          result.docId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dataset_name':
          result.datasetName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dataset_id':
          result.datasetId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'chunk_size':
          result.chunkSize = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'urls':
          result.urls = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'url_id':
          result.urlId = serializers.deserialize(value,
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

class _$UserTempUploadsRecord extends UserTempUploadsRecord {
  @override
  final String? docTitle;
  @override
  final String? docId;
  @override
  final String? datasetName;
  @override
  final String? datasetId;
  @override
  final DateTime? timestamp;
  @override
  final double? chunkSize;
  @override
  final String? urls;
  @override
  final String? urlId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserTempUploadsRecord(
          [void Function(UserTempUploadsRecordBuilder)? updates]) =>
      (new UserTempUploadsRecordBuilder()..update(updates))._build();

  _$UserTempUploadsRecord._(
      {this.docTitle,
      this.docId,
      this.datasetName,
      this.datasetId,
      this.timestamp,
      this.chunkSize,
      this.urls,
      this.urlId,
      this.ffRef})
      : super._();

  @override
  UserTempUploadsRecord rebuild(
          void Function(UserTempUploadsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserTempUploadsRecordBuilder toBuilder() =>
      new UserTempUploadsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserTempUploadsRecord &&
        docTitle == other.docTitle &&
        docId == other.docId &&
        datasetName == other.datasetName &&
        datasetId == other.datasetId &&
        timestamp == other.timestamp &&
        chunkSize == other.chunkSize &&
        urls == other.urls &&
        urlId == other.urlId &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, docTitle.hashCode);
    _$hash = $jc(_$hash, docId.hashCode);
    _$hash = $jc(_$hash, datasetName.hashCode);
    _$hash = $jc(_$hash, datasetId.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, chunkSize.hashCode);
    _$hash = $jc(_$hash, urls.hashCode);
    _$hash = $jc(_$hash, urlId.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserTempUploadsRecord')
          ..add('docTitle', docTitle)
          ..add('docId', docId)
          ..add('datasetName', datasetName)
          ..add('datasetId', datasetId)
          ..add('timestamp', timestamp)
          ..add('chunkSize', chunkSize)
          ..add('urls', urls)
          ..add('urlId', urlId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserTempUploadsRecordBuilder
    implements Builder<UserTempUploadsRecord, UserTempUploadsRecordBuilder> {
  _$UserTempUploadsRecord? _$v;

  String? _docTitle;
  String? get docTitle => _$this._docTitle;
  set docTitle(String? docTitle) => _$this._docTitle = docTitle;

  String? _docId;
  String? get docId => _$this._docId;
  set docId(String? docId) => _$this._docId = docId;

  String? _datasetName;
  String? get datasetName => _$this._datasetName;
  set datasetName(String? datasetName) => _$this._datasetName = datasetName;

  String? _datasetId;
  String? get datasetId => _$this._datasetId;
  set datasetId(String? datasetId) => _$this._datasetId = datasetId;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  double? _chunkSize;
  double? get chunkSize => _$this._chunkSize;
  set chunkSize(double? chunkSize) => _$this._chunkSize = chunkSize;

  String? _urls;
  String? get urls => _$this._urls;
  set urls(String? urls) => _$this._urls = urls;

  String? _urlId;
  String? get urlId => _$this._urlId;
  set urlId(String? urlId) => _$this._urlId = urlId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserTempUploadsRecordBuilder() {
    UserTempUploadsRecord._initializeBuilder(this);
  }

  UserTempUploadsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _docTitle = $v.docTitle;
      _docId = $v.docId;
      _datasetName = $v.datasetName;
      _datasetId = $v.datasetId;
      _timestamp = $v.timestamp;
      _chunkSize = $v.chunkSize;
      _urls = $v.urls;
      _urlId = $v.urlId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserTempUploadsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserTempUploadsRecord;
  }

  @override
  void update(void Function(UserTempUploadsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserTempUploadsRecord build() => _build();

  _$UserTempUploadsRecord _build() {
    final _$result = _$v ??
        new _$UserTempUploadsRecord._(
            docTitle: docTitle,
            docId: docId,
            datasetName: datasetName,
            datasetId: datasetId,
            timestamp: timestamp,
            chunkSize: chunkSize,
            urls: urls,
            urlId: urlId,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
