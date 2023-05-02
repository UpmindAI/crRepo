import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'search_test_record.g.dart';

abstract class SearchTestRecord
    implements Built<SearchTestRecord, SearchTestRecordBuilder> {
  static Serializer<SearchTestRecord> get serializer =>
      _$searchTestRecordSerializer;

  String? get firm;

  @BuiltValueField(wireName: 'award_title')
  String? get awardTitle;

  String? get agency;

  String? get phase;

  @BuiltValueField(wireName: 'proposal_award_date')
  DateTime? get proposalAwardDate;

  @BuiltValueField(wireName: 'contract_end_date')
  DateTime? get contractEndDate;

  @BuiltValueField(wireName: 'solicitation_year')
  int? get solicitationYear;

  @BuiltValueField(wireName: 'award_year')
  int? get awardYear;

  @BuiltValueField(wireName: 'award_amount')
  int? get awardAmount;

  int? get duns;

  @BuiltValueField(wireName: 'number_employees')
  int? get numberEmployees;

  String? get address1;

  String? get address2;

  String? get city;

  String? get state;

  @BuiltValueField(wireName: 'poc_name')
  String? get pocName;

  @BuiltValueField(wireName: 'poc_phone')
  String? get pocPhone;

  @BuiltValueField(wireName: 'poc_email')
  String? get pocEmail;

  @BuiltValueField(wireName: 'pi_name')
  String? get piName;

  @BuiltValueField(wireName: 'pi_phone')
  String? get piPhone;

  @BuiltValueField(wireName: 'pi_email')
  String? get piEmail;

  @BuiltValueField(wireName: 'ri_name')
  String? get riName;

  String? get abstract;

  @BuiltValueField(wireName: 'award_link')
  String? get awardLink;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SearchTestRecordBuilder builder) => builder
    ..firm = ''
    ..awardTitle = ''
    ..agency = ''
    ..phase = ''
    ..solicitationYear = 0
    ..awardYear = 0
    ..awardAmount = 0
    ..duns = 0
    ..numberEmployees = 0
    ..address1 = ''
    ..address2 = ''
    ..city = ''
    ..state = ''
    ..pocName = ''
    ..pocPhone = ''
    ..pocEmail = ''
    ..piName = ''
    ..piPhone = ''
    ..piEmail = ''
    ..riName = ''
    ..abstract = ''
    ..awardLink = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('search_test');

  static Stream<SearchTestRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SearchTestRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static SearchTestRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      SearchTestRecord(
        (c) => c
          ..firm = snapshot.data['firm']
          ..awardTitle = snapshot.data['award_title']
          ..agency = snapshot.data['agency']
          ..phase = snapshot.data['phase']
          ..proposalAwardDate = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(
                  snapshot.data['proposal_award_date']))
          ..contractEndDate = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['contract_end_date']))
          ..solicitationYear = snapshot.data['solicitation_year']?.round()
          ..awardYear = snapshot.data['award_year']?.round()
          ..awardAmount = snapshot.data['award_amount']?.round()
          ..duns = snapshot.data['duns']?.round()
          ..numberEmployees = snapshot.data['number_employees']?.round()
          ..address1 = snapshot.data['address1']
          ..address2 = snapshot.data['address2']
          ..city = snapshot.data['city']
          ..state = snapshot.data['state']
          ..pocName = snapshot.data['poc_name']
          ..pocPhone = snapshot.data['poc_phone']
          ..pocEmail = snapshot.data['poc_email']
          ..piName = snapshot.data['pi_name']
          ..piPhone = snapshot.data['pi_phone']
          ..piEmail = snapshot.data['pi_email']
          ..riName = snapshot.data['ri_name']
          ..abstract = snapshot.data['abstract']
          ..awardLink = snapshot.data['award_link']
          ..ffRef = SearchTestRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<SearchTestRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'search_test',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  SearchTestRecord._();
  factory SearchTestRecord([void Function(SearchTestRecordBuilder) updates]) =
      _$SearchTestRecord;

  static SearchTestRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSearchTestRecordData({
  String? firm,
  String? awardTitle,
  String? agency,
  String? phase,
  DateTime? proposalAwardDate,
  DateTime? contractEndDate,
  int? solicitationYear,
  int? awardYear,
  int? awardAmount,
  int? duns,
  int? numberEmployees,
  String? address1,
  String? address2,
  String? city,
  String? state,
  String? pocName,
  String? pocPhone,
  String? pocEmail,
  String? piName,
  String? piPhone,
  String? piEmail,
  String? riName,
  String? abstract,
  String? awardLink,
}) {
  final firestoreData = serializers.toFirestore(
    SearchTestRecord.serializer,
    SearchTestRecord(
      (s) => s
        ..firm = firm
        ..awardTitle = awardTitle
        ..agency = agency
        ..phase = phase
        ..proposalAwardDate = proposalAwardDate
        ..contractEndDate = contractEndDate
        ..solicitationYear = solicitationYear
        ..awardYear = awardYear
        ..awardAmount = awardAmount
        ..duns = duns
        ..numberEmployees = numberEmployees
        ..address1 = address1
        ..address2 = address2
        ..city = city
        ..state = state
        ..pocName = pocName
        ..pocPhone = pocPhone
        ..pocEmail = pocEmail
        ..piName = piName
        ..piPhone = piPhone
        ..piEmail = piEmail
        ..riName = riName
        ..abstract = abstract
        ..awardLink = awardLink,
    ),
  );

  return firestoreData;
}
