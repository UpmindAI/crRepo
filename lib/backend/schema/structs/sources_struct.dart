import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'sources_struct.g.dart';

abstract class SourcesStruct
    implements Built<SourcesStruct, SourcesStructBuilder> {
  static Serializer<SourcesStruct> get serializer => _$sourcesStructSerializer;

  String? get chunks;

  @BuiltValueField(wireName: 'dataset_ids')
  String? get datasetIds;

  @BuiltValueField(wireName: 'dataset_names')
  String? get datasetNames;

  @BuiltValueField(wireName: 'doc_titles')
  String? get docTitles;

  @BuiltValueField(wireName: 'page_percentages')
  double? get pagePercentages;

  double? get scores;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(SourcesStructBuilder builder) => builder
    ..chunks = ''
    ..datasetIds = ''
    ..datasetNames = ''
    ..docTitles = ''
    ..pagePercentages = 0.0
    ..scores = 0.0
    ..firestoreUtilData = FirestoreUtilData();

  SourcesStruct._();
  factory SourcesStruct([void Function(SourcesStructBuilder) updates]) =
      _$SourcesStruct;
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
      (s) => s
        ..chunks = chunks
        ..datasetIds = datasetIds
        ..datasetNames = datasetNames
        ..docTitles = docTitles
        ..pagePercentages = pagePercentages
        ..scores = scores
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

SourcesStruct? updateSourcesStruct(
  SourcesStruct? sources, {
  bool clearUnsetFields = true,
}) =>
    sources != null
        ? (sources.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

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

  return;
}

Map<String, dynamic> getSourcesFirestoreData(
  SourcesStruct? sources, [
  bool forFieldValue = false,
]) {
  if (sources == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(SourcesStruct.serializer, sources);

  // Add any Firestore field values
  sources.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSourcesListFirestoreData(
  List<SourcesStruct>? sourcess,
) =>
    sourcess?.map((s) => getSourcesFirestoreData(s, true)).toList() ?? [];
