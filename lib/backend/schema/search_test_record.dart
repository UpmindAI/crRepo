import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchTestRecord extends FirestoreRecord {
  SearchTestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "firm" field.
  String? _firm;
  String get firm => _firm ?? '';
  bool hasFirm() => _firm != null;

  // "award_title" field.
  String? _awardTitle;
  String get awardTitle => _awardTitle ?? '';
  bool hasAwardTitle() => _awardTitle != null;

  // "agency" field.
  String? _agency;
  String get agency => _agency ?? '';
  bool hasAgency() => _agency != null;

  // "phase" field.
  String? _phase;
  String get phase => _phase ?? '';
  bool hasPhase() => _phase != null;

  // "proposal_award_date" field.
  DateTime? _proposalAwardDate;
  DateTime? get proposalAwardDate => _proposalAwardDate;
  bool hasProposalAwardDate() => _proposalAwardDate != null;

  // "contract_end_date" field.
  DateTime? _contractEndDate;
  DateTime? get contractEndDate => _contractEndDate;
  bool hasContractEndDate() => _contractEndDate != null;

  // "solicitation_year" field.
  int? _solicitationYear;
  int get solicitationYear => _solicitationYear ?? 0;
  bool hasSolicitationYear() => _solicitationYear != null;

  // "award_year" field.
  int? _awardYear;
  int get awardYear => _awardYear ?? 0;
  bool hasAwardYear() => _awardYear != null;

  // "award_amount" field.
  int? _awardAmount;
  int get awardAmount => _awardAmount ?? 0;
  bool hasAwardAmount() => _awardAmount != null;

  // "duns" field.
  int? _duns;
  int get duns => _duns ?? 0;
  bool hasDuns() => _duns != null;

  // "number_employees" field.
  int? _numberEmployees;
  int get numberEmployees => _numberEmployees ?? 0;
  bool hasNumberEmployees() => _numberEmployees != null;

  // "address1" field.
  String? _address1;
  String get address1 => _address1 ?? '';
  bool hasAddress1() => _address1 != null;

  // "address2" field.
  String? _address2;
  String get address2 => _address2 ?? '';
  bool hasAddress2() => _address2 != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "poc_name" field.
  String? _pocName;
  String get pocName => _pocName ?? '';
  bool hasPocName() => _pocName != null;

  // "poc_phone" field.
  String? _pocPhone;
  String get pocPhone => _pocPhone ?? '';
  bool hasPocPhone() => _pocPhone != null;

  // "poc_email" field.
  String? _pocEmail;
  String get pocEmail => _pocEmail ?? '';
  bool hasPocEmail() => _pocEmail != null;

  // "pi_name" field.
  String? _piName;
  String get piName => _piName ?? '';
  bool hasPiName() => _piName != null;

  // "pi_phone" field.
  String? _piPhone;
  String get piPhone => _piPhone ?? '';
  bool hasPiPhone() => _piPhone != null;

  // "pi_email" field.
  String? _piEmail;
  String get piEmail => _piEmail ?? '';
  bool hasPiEmail() => _piEmail != null;

  // "ri_name" field.
  String? _riName;
  String get riName => _riName ?? '';
  bool hasRiName() => _riName != null;

  // "abstract" field.
  String? _abstract;
  String get abstract => _abstract ?? '';
  bool hasAbstract() => _abstract != null;

  // "award_link" field.
  String? _awardLink;
  String get awardLink => _awardLink ?? '';
  bool hasAwardLink() => _awardLink != null;

  void _initializeFields() {
    _firm = snapshotData['firm'] as String?;
    _awardTitle = snapshotData['award_title'] as String?;
    _agency = snapshotData['agency'] as String?;
    _phase = snapshotData['phase'] as String?;
    _proposalAwardDate = snapshotData['proposal_award_date'] as DateTime?;
    _contractEndDate = snapshotData['contract_end_date'] as DateTime?;
    _solicitationYear = castToType<int>(snapshotData['solicitation_year']);
    _awardYear = castToType<int>(snapshotData['award_year']);
    _awardAmount = castToType<int>(snapshotData['award_amount']);
    _duns = castToType<int>(snapshotData['duns']);
    _numberEmployees = castToType<int>(snapshotData['number_employees']);
    _address1 = snapshotData['address1'] as String?;
    _address2 = snapshotData['address2'] as String?;
    _city = snapshotData['city'] as String?;
    _state = snapshotData['state'] as String?;
    _pocName = snapshotData['poc_name'] as String?;
    _pocPhone = snapshotData['poc_phone'] as String?;
    _pocEmail = snapshotData['poc_email'] as String?;
    _piName = snapshotData['pi_name'] as String?;
    _piPhone = snapshotData['pi_phone'] as String?;
    _piEmail = snapshotData['pi_email'] as String?;
    _riName = snapshotData['ri_name'] as String?;
    _abstract = snapshotData['abstract'] as String?;
    _awardLink = snapshotData['award_link'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('search_test');

  static Stream<SearchTestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SearchTestRecord.fromSnapshot(s));

  static Future<SearchTestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SearchTestRecord.fromSnapshot(s));

  static SearchTestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SearchTestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SearchTestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SearchTestRecord._(reference, mapFromFirestore(data));

  static SearchTestRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      SearchTestRecord.getDocumentFromData(
        {
          'firm': snapshot.data['firm'],
          'award_title': snapshot.data['award_title'],
          'agency': snapshot.data['agency'],
          'phase': snapshot.data['phase'],
          'proposal_award_date': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['proposal_award_date']),
          ),
          'contract_end_date': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['contract_end_date']),
          ),
          'solicitation_year': snapshot.data['solicitation_year']?.round(),
          'award_year': snapshot.data['award_year']?.round(),
          'award_amount': snapshot.data['award_amount']?.round(),
          'duns': snapshot.data['duns']?.round(),
          'number_employees': snapshot.data['number_employees']?.round(),
          'address1': snapshot.data['address1'],
          'address2': snapshot.data['address2'],
          'city': snapshot.data['city'],
          'state': snapshot.data['state'],
          'poc_name': snapshot.data['poc_name'],
          'poc_phone': snapshot.data['poc_phone'],
          'poc_email': snapshot.data['poc_email'],
          'pi_name': snapshot.data['pi_name'],
          'pi_phone': snapshot.data['pi_phone'],
          'pi_email': snapshot.data['pi_email'],
          'ri_name': snapshot.data['ri_name'],
          'abstract': snapshot.data['abstract'],
          'award_link': snapshot.data['award_link'],
        },
        SearchTestRecord.collection.doc(snapshot.objectID),
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

  @override
  String toString() =>
      'SearchTestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SearchTestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
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
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'firm': firm,
      'award_title': awardTitle,
      'agency': agency,
      'phase': phase,
      'proposal_award_date': proposalAwardDate,
      'contract_end_date': contractEndDate,
      'solicitation_year': solicitationYear,
      'award_year': awardYear,
      'award_amount': awardAmount,
      'duns': duns,
      'number_employees': numberEmployees,
      'address1': address1,
      'address2': address2,
      'city': city,
      'state': state,
      'poc_name': pocName,
      'poc_phone': pocPhone,
      'poc_email': pocEmail,
      'pi_name': piName,
      'pi_phone': piPhone,
      'pi_email': piEmail,
      'ri_name': riName,
      'abstract': abstract,
      'award_link': awardLink,
    }.withoutNulls,
  );

  return firestoreData;
}

class SearchTestRecordDocumentEquality implements Equality<SearchTestRecord> {
  const SearchTestRecordDocumentEquality();

  @override
  bool equals(SearchTestRecord? e1, SearchTestRecord? e2) {
    return e1?.firm == e2?.firm &&
        e1?.awardTitle == e2?.awardTitle &&
        e1?.agency == e2?.agency &&
        e1?.phase == e2?.phase &&
        e1?.proposalAwardDate == e2?.proposalAwardDate &&
        e1?.contractEndDate == e2?.contractEndDate &&
        e1?.solicitationYear == e2?.solicitationYear &&
        e1?.awardYear == e2?.awardYear &&
        e1?.awardAmount == e2?.awardAmount &&
        e1?.duns == e2?.duns &&
        e1?.numberEmployees == e2?.numberEmployees &&
        e1?.address1 == e2?.address1 &&
        e1?.address2 == e2?.address2 &&
        e1?.city == e2?.city &&
        e1?.state == e2?.state &&
        e1?.pocName == e2?.pocName &&
        e1?.pocPhone == e2?.pocPhone &&
        e1?.pocEmail == e2?.pocEmail &&
        e1?.piName == e2?.piName &&
        e1?.piPhone == e2?.piPhone &&
        e1?.piEmail == e2?.piEmail &&
        e1?.riName == e2?.riName &&
        e1?.abstract == e2?.abstract &&
        e1?.awardLink == e2?.awardLink;
  }

  @override
  int hash(SearchTestRecord? e) => const ListEquality().hash([
        e?.firm,
        e?.awardTitle,
        e?.agency,
        e?.phase,
        e?.proposalAwardDate,
        e?.contractEndDate,
        e?.solicitationYear,
        e?.awardYear,
        e?.awardAmount,
        e?.duns,
        e?.numberEmployees,
        e?.address1,
        e?.address2,
        e?.city,
        e?.state,
        e?.pocName,
        e?.pocPhone,
        e?.pocEmail,
        e?.piName,
        e?.piPhone,
        e?.piEmail,
        e?.riName,
        e?.abstract,
        e?.awardLink
      ]);

  @override
  bool isValidKey(Object? o) => o is SearchTestRecord;
}
