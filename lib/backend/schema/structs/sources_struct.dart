// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SourcesStruct extends FFFirebaseStruct {
  SourcesStruct({
    String? chunks,
    String? datasetIds,
    String? datasetNames,
    String? docTitles,
    double? pagePercentages,
    double? scores,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _chunks = chunks,
        _datasetIds = datasetIds,
        _datasetNames = datasetNames,
        _docTitles = docTitles,
        _pagePercentages = pagePercentages,
        _scores = scores,
        super(firestoreUtilData);

  // "chunks" field.
  String? _chunks;
  String get chunks => _chunks ?? '';
  set chunks(String? val) => _chunks = val;
  bool hasChunks() => _chunks != null;

  // "dataset_ids" field.
  String? _datasetIds;
  String get datasetIds => _datasetIds ?? '';
  set datasetIds(String? val) => _datasetIds = val;
  bool hasDatasetIds() => _datasetIds != null;

  // "dataset_names" field.
  String? _datasetNames;
  String get datasetNames => _datasetNames ?? '';
  set datasetNames(String? val) => _datasetNames = val;
  bool hasDatasetNames() => _datasetNames != null;

  // "doc_titles" field.
  String? _docTitles;
  String get docTitles => _docTitles ?? '';
  set docTitles(String? val) => _docTitles = val;
  bool hasDocTitles() => _docTitles != null;

  // "page_percentages" field.
  double? _pagePercentages;
  double get pagePercentages => _pagePercentages ?? 0.0;
  set pagePercentages(double? val) => _pagePercentages = val;
  void incrementPagePercentages(double amount) =>
      _pagePercentages = pagePercentages + amount;
  bool hasPagePercentages() => _pagePercentages != null;

  // "scores" field.
  double? _scores;
  double get scores => _scores ?? 0.0;
  set scores(double? val) => _scores = val;
  void incrementScores(double amount) => _scores = scores + amount;
  bool hasScores() => _scores != null;

  static SourcesStruct fromMap(Map<String, dynamic> data) => SourcesStruct(
        chunks: data['chunks'] as String?,
        datasetIds: data['dataset_ids'] as String?,
        datasetNames: data['dataset_names'] as String?,
        docTitles: data['doc_titles'] as String?,
        pagePercentages: castToType<double>(data['page_percentages']),
        scores: castToType<double>(data['scores']),
      );

  static SourcesStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SourcesStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'chunks': _chunks,
        'dataset_ids': _datasetIds,
        'dataset_names': _datasetNames,
        'doc_titles': _docTitles,
        'page_percentages': _pagePercentages,
        'scores': _scores,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'chunks': serializeParam(
          _chunks,
          ParamType.String,
        ),
        'dataset_ids': serializeParam(
          _datasetIds,
          ParamType.String,
        ),
        'dataset_names': serializeParam(
          _datasetNames,
          ParamType.String,
        ),
        'doc_titles': serializeParam(
          _docTitles,
          ParamType.String,
        ),
        'page_percentages': serializeParam(
          _pagePercentages,
          ParamType.double,
        ),
        'scores': serializeParam(
          _scores,
          ParamType.double,
        ),
      }.withoutNulls;

  static SourcesStruct fromSerializableMap(Map<String, dynamic> data) =>
      SourcesStruct(
        chunks: deserializeParam(
          data['chunks'],
          ParamType.String,
          false,
        ),
        datasetIds: deserializeParam(
          data['dataset_ids'],
          ParamType.String,
          false,
        ),
        datasetNames: deserializeParam(
          data['dataset_names'],
          ParamType.String,
          false,
        ),
        docTitles: deserializeParam(
          data['doc_titles'],
          ParamType.String,
          false,
        ),
        pagePercentages: deserializeParam(
          data['page_percentages'],
          ParamType.double,
          false,
        ),
        scores: deserializeParam(
          data['scores'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'SourcesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SourcesStruct &&
        chunks == other.chunks &&
        datasetIds == other.datasetIds &&
        datasetNames == other.datasetNames &&
        docTitles == other.docTitles &&
        pagePercentages == other.pagePercentages &&
        scores == other.scores;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [chunks, datasetIds, datasetNames, docTitles, pagePercentages, scores]);
}

SourcesStruct createSourcesStruct({
  String? chunks,
  String? datasetIds,
  String? datasetNames,
  String? docTitles,
  double? pagePercentages,
  double? scores,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SourcesStruct(
      chunks: chunks,
      datasetIds: datasetIds,
      datasetNames: datasetNames,
      docTitles: docTitles,
      pagePercentages: pagePercentages,
      scores: scores,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SourcesStruct? updateSourcesStruct(
  SourcesStruct? sources, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sources
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSourcesStructData(
  Map<String, dynamic> firestoreData,
  SourcesStruct? sources,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sources == null) {
    return;
  }
  if (sources.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && sources.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sourcesData = getSourcesFirestoreData(sources, forFieldValue);
  final nestedData = sourcesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = sources.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSourcesFirestoreData(
  SourcesStruct? sources, [
  bool forFieldValue = false,
]) {
  if (sources == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sources.toMap());

  // Add any Firestore field values
  sources.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSourcesListFirestoreData(
  List<SourcesStruct>? sourcess,
) =>
    sourcess?.map((e) => getSourcesFirestoreData(e, true)).toList() ?? [];
