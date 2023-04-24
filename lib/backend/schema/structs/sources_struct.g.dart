// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sources_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SourcesStruct> _$sourcesStructSerializer =
    new _$SourcesStructSerializer();

class _$SourcesStructSerializer implements StructuredSerializer<SourcesStruct> {
  @override
  final Iterable<Type> types = const [SourcesStruct, _$SourcesStruct];
  @override
  final String wireName = 'SourcesStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, SourcesStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.chunks;
    if (value != null) {
      result
        ..add('chunks')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.datasetIds;
    if (value != null) {
      result
        ..add('dataset_ids')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.datasetNames;
    if (value != null) {
      result
        ..add('dataset_names')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.docTitles;
    if (value != null) {
      result
        ..add('doc_titles')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pagePercentages;
    if (value != null) {
      result
        ..add('page_percentages')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.scores;
    if (value != null) {
      result
        ..add('scores')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  SourcesStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SourcesStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'chunks':
          result.chunks = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dataset_ids':
          result.datasetIds = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dataset_names':
          result.datasetNames = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doc_titles':
          result.docTitles = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'page_percentages':
          result.pagePercentages = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'scores':
          result.scores = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$SourcesStruct extends SourcesStruct {
  @override
  final String? chunks;
  @override
  final String? datasetIds;
  @override
  final String? datasetNames;
  @override
  final String? docTitles;
  @override
  final double? pagePercentages;
  @override
  final double? scores;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$SourcesStruct([void Function(SourcesStructBuilder)? updates]) =>
      (new SourcesStructBuilder()..update(updates))._build();

  _$SourcesStruct._(
      {this.chunks,
      this.datasetIds,
      this.datasetNames,
      this.docTitles,
      this.pagePercentages,
      this.scores,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'SourcesStruct', 'firestoreUtilData');
  }

  @override
  SourcesStruct rebuild(void Function(SourcesStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SourcesStructBuilder toBuilder() => new SourcesStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SourcesStruct &&
        chunks == other.chunks &&
        datasetIds == other.datasetIds &&
        datasetNames == other.datasetNames &&
        docTitles == other.docTitles &&
        pagePercentages == other.pagePercentages &&
        scores == other.scores &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, chunks.hashCode);
    _$hash = $jc(_$hash, datasetIds.hashCode);
    _$hash = $jc(_$hash, datasetNames.hashCode);
    _$hash = $jc(_$hash, docTitles.hashCode);
    _$hash = $jc(_$hash, pagePercentages.hashCode);
    _$hash = $jc(_$hash, scores.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SourcesStruct')
          ..add('chunks', chunks)
          ..add('datasetIds', datasetIds)
          ..add('datasetNames', datasetNames)
          ..add('docTitles', docTitles)
          ..add('pagePercentages', pagePercentages)
          ..add('scores', scores)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class SourcesStructBuilder
    implements Builder<SourcesStruct, SourcesStructBuilder> {
  _$SourcesStruct? _$v;

  String? _chunks;
  String? get chunks => _$this._chunks;
  set chunks(String? chunks) => _$this._chunks = chunks;

  String? _datasetIds;
  String? get datasetIds => _$this._datasetIds;
  set datasetIds(String? datasetIds) => _$this._datasetIds = datasetIds;

  String? _datasetNames;
  String? get datasetNames => _$this._datasetNames;
  set datasetNames(String? datasetNames) => _$this._datasetNames = datasetNames;

  String? _docTitles;
  String? get docTitles => _$this._docTitles;
  set docTitles(String? docTitles) => _$this._docTitles = docTitles;

  double? _pagePercentages;
  double? get pagePercentages => _$this._pagePercentages;
  set pagePercentages(double? pagePercentages) =>
      _$this._pagePercentages = pagePercentages;

  double? _scores;
  double? get scores => _$this._scores;
  set scores(double? scores) => _$this._scores = scores;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  SourcesStructBuilder() {
    SourcesStruct._initializeBuilder(this);
  }

  SourcesStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _chunks = $v.chunks;
      _datasetIds = $v.datasetIds;
      _datasetNames = $v.datasetNames;
      _docTitles = $v.docTitles;
      _pagePercentages = $v.pagePercentages;
      _scores = $v.scores;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SourcesStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SourcesStruct;
  }

  @override
  void update(void Function(SourcesStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SourcesStruct build() => _build();

  _$SourcesStruct _build() {
    final _$result = _$v ??
        new _$SourcesStruct._(
            chunks: chunks,
            datasetIds: datasetIds,
            datasetNames: datasetNames,
            docTitles: docTitles,
            pagePercentages: pagePercentages,
            scores: scores,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'SourcesStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
