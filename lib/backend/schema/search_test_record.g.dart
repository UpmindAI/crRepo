// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_test_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SearchTestRecord> _$searchTestRecordSerializer =
    new _$SearchTestRecordSerializer();

class _$SearchTestRecordSerializer
    implements StructuredSerializer<SearchTestRecord> {
  @override
  final Iterable<Type> types = const [SearchTestRecord, _$SearchTestRecord];
  @override
  final String wireName = 'SearchTestRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, SearchTestRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.firm;
    if (value != null) {
      result
        ..add('firm')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.awardTitle;
    if (value != null) {
      result
        ..add('award_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.agency;
    if (value != null) {
      result
        ..add('agency')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phase;
    if (value != null) {
      result
        ..add('phase')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.proposalAwardDate;
    if (value != null) {
      result
        ..add('proposal_award_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.contractEndDate;
    if (value != null) {
      result
        ..add('contract_end_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.solicitationYear;
    if (value != null) {
      result
        ..add('solicitation_year')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.awardYear;
    if (value != null) {
      result
        ..add('award_year')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.awardAmount;
    if (value != null) {
      result
        ..add('award_amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.duns;
    if (value != null) {
      result
        ..add('duns')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numberEmployees;
    if (value != null) {
      result
        ..add('number_employees')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.address1;
    if (value != null) {
      result
        ..add('address1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address2;
    if (value != null) {
      result
        ..add('address2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.state;
    if (value != null) {
      result
        ..add('state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pocName;
    if (value != null) {
      result
        ..add('poc_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pocPhone;
    if (value != null) {
      result
        ..add('poc_phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pocEmail;
    if (value != null) {
      result
        ..add('poc_email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.piName;
    if (value != null) {
      result
        ..add('pi_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.piPhone;
    if (value != null) {
      result
        ..add('pi_phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.piEmail;
    if (value != null) {
      result
        ..add('pi_email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.riName;
    if (value != null) {
      result
        ..add('ri_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.abstract;
    if (value != null) {
      result
        ..add('abstract')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.awardLink;
    if (value != null) {
      result
        ..add('award_link')
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
  SearchTestRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchTestRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'firm':
          result.firm = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'award_title':
          result.awardTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'agency':
          result.agency = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phase':
          result.phase = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'proposal_award_date':
          result.proposalAwardDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'contract_end_date':
          result.contractEndDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'solicitation_year':
          result.solicitationYear = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'award_year':
          result.awardYear = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'award_amount':
          result.awardAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'duns':
          result.duns = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'number_employees':
          result.numberEmployees = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'address1':
          result.address1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address2':
          result.address2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'poc_name':
          result.pocName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'poc_phone':
          result.pocPhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'poc_email':
          result.pocEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pi_name':
          result.piName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pi_phone':
          result.piPhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pi_email':
          result.piEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ri_name':
          result.riName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'abstract':
          result.abstract = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'award_link':
          result.awardLink = serializers.deserialize(value,
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

class _$SearchTestRecord extends SearchTestRecord {
  @override
  final String? firm;
  @override
  final String? awardTitle;
  @override
  final String? agency;
  @override
  final String? phase;
  @override
  final DateTime? proposalAwardDate;
  @override
  final DateTime? contractEndDate;
  @override
  final int? solicitationYear;
  @override
  final int? awardYear;
  @override
  final int? awardAmount;
  @override
  final int? duns;
  @override
  final int? numberEmployees;
  @override
  final String? address1;
  @override
  final String? address2;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? pocName;
  @override
  final String? pocPhone;
  @override
  final String? pocEmail;
  @override
  final String? piName;
  @override
  final String? piPhone;
  @override
  final String? piEmail;
  @override
  final String? riName;
  @override
  final String? abstract;
  @override
  final String? awardLink;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SearchTestRecord(
          [void Function(SearchTestRecordBuilder)? updates]) =>
      (new SearchTestRecordBuilder()..update(updates))._build();

  _$SearchTestRecord._(
      {this.firm,
      this.awardTitle,
      this.agency,
      this.phase,
      this.proposalAwardDate,
      this.contractEndDate,
      this.solicitationYear,
      this.awardYear,
      this.awardAmount,
      this.duns,
      this.numberEmployees,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.pocName,
      this.pocPhone,
      this.pocEmail,
      this.piName,
      this.piPhone,
      this.piEmail,
      this.riName,
      this.abstract,
      this.awardLink,
      this.ffRef})
      : super._();

  @override
  SearchTestRecord rebuild(void Function(SearchTestRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchTestRecordBuilder toBuilder() =>
      new SearchTestRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchTestRecord &&
        firm == other.firm &&
        awardTitle == other.awardTitle &&
        agency == other.agency &&
        phase == other.phase &&
        proposalAwardDate == other.proposalAwardDate &&
        contractEndDate == other.contractEndDate &&
        solicitationYear == other.solicitationYear &&
        awardYear == other.awardYear &&
        awardAmount == other.awardAmount &&
        duns == other.duns &&
        numberEmployees == other.numberEmployees &&
        address1 == other.address1 &&
        address2 == other.address2 &&
        city == other.city &&
        state == other.state &&
        pocName == other.pocName &&
        pocPhone == other.pocPhone &&
        pocEmail == other.pocEmail &&
        piName == other.piName &&
        piPhone == other.piPhone &&
        piEmail == other.piEmail &&
        riName == other.riName &&
        abstract == other.abstract &&
        awardLink == other.awardLink &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, firm.hashCode);
    _$hash = $jc(_$hash, awardTitle.hashCode);
    _$hash = $jc(_$hash, agency.hashCode);
    _$hash = $jc(_$hash, phase.hashCode);
    _$hash = $jc(_$hash, proposalAwardDate.hashCode);
    _$hash = $jc(_$hash, contractEndDate.hashCode);
    _$hash = $jc(_$hash, solicitationYear.hashCode);
    _$hash = $jc(_$hash, awardYear.hashCode);
    _$hash = $jc(_$hash, awardAmount.hashCode);
    _$hash = $jc(_$hash, duns.hashCode);
    _$hash = $jc(_$hash, numberEmployees.hashCode);
    _$hash = $jc(_$hash, address1.hashCode);
    _$hash = $jc(_$hash, address2.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, pocName.hashCode);
    _$hash = $jc(_$hash, pocPhone.hashCode);
    _$hash = $jc(_$hash, pocEmail.hashCode);
    _$hash = $jc(_$hash, piName.hashCode);
    _$hash = $jc(_$hash, piPhone.hashCode);
    _$hash = $jc(_$hash, piEmail.hashCode);
    _$hash = $jc(_$hash, riName.hashCode);
    _$hash = $jc(_$hash, abstract.hashCode);
    _$hash = $jc(_$hash, awardLink.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SearchTestRecord')
          ..add('firm', firm)
          ..add('awardTitle', awardTitle)
          ..add('agency', agency)
          ..add('phase', phase)
          ..add('proposalAwardDate', proposalAwardDate)
          ..add('contractEndDate', contractEndDate)
          ..add('solicitationYear', solicitationYear)
          ..add('awardYear', awardYear)
          ..add('awardAmount', awardAmount)
          ..add('duns', duns)
          ..add('numberEmployees', numberEmployees)
          ..add('address1', address1)
          ..add('address2', address2)
          ..add('city', city)
          ..add('state', state)
          ..add('pocName', pocName)
          ..add('pocPhone', pocPhone)
          ..add('pocEmail', pocEmail)
          ..add('piName', piName)
          ..add('piPhone', piPhone)
          ..add('piEmail', piEmail)
          ..add('riName', riName)
          ..add('abstract', abstract)
          ..add('awardLink', awardLink)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SearchTestRecordBuilder
    implements Builder<SearchTestRecord, SearchTestRecordBuilder> {
  _$SearchTestRecord? _$v;

  String? _firm;
  String? get firm => _$this._firm;
  set firm(String? firm) => _$this._firm = firm;

  String? _awardTitle;
  String? get awardTitle => _$this._awardTitle;
  set awardTitle(String? awardTitle) => _$this._awardTitle = awardTitle;

  String? _agency;
  String? get agency => _$this._agency;
  set agency(String? agency) => _$this._agency = agency;

  String? _phase;
  String? get phase => _$this._phase;
  set phase(String? phase) => _$this._phase = phase;

  DateTime? _proposalAwardDate;
  DateTime? get proposalAwardDate => _$this._proposalAwardDate;
  set proposalAwardDate(DateTime? proposalAwardDate) =>
      _$this._proposalAwardDate = proposalAwardDate;

  DateTime? _contractEndDate;
  DateTime? get contractEndDate => _$this._contractEndDate;
  set contractEndDate(DateTime? contractEndDate) =>
      _$this._contractEndDate = contractEndDate;

  int? _solicitationYear;
  int? get solicitationYear => _$this._solicitationYear;
  set solicitationYear(int? solicitationYear) =>
      _$this._solicitationYear = solicitationYear;

  int? _awardYear;
  int? get awardYear => _$this._awardYear;
  set awardYear(int? awardYear) => _$this._awardYear = awardYear;

  int? _awardAmount;
  int? get awardAmount => _$this._awardAmount;
  set awardAmount(int? awardAmount) => _$this._awardAmount = awardAmount;

  int? _duns;
  int? get duns => _$this._duns;
  set duns(int? duns) => _$this._duns = duns;

  int? _numberEmployees;
  int? get numberEmployees => _$this._numberEmployees;
  set numberEmployees(int? numberEmployees) =>
      _$this._numberEmployees = numberEmployees;

  String? _address1;
  String? get address1 => _$this._address1;
  set address1(String? address1) => _$this._address1 = address1;

  String? _address2;
  String? get address2 => _$this._address2;
  set address2(String? address2) => _$this._address2 = address2;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  String? _pocName;
  String? get pocName => _$this._pocName;
  set pocName(String? pocName) => _$this._pocName = pocName;

  String? _pocPhone;
  String? get pocPhone => _$this._pocPhone;
  set pocPhone(String? pocPhone) => _$this._pocPhone = pocPhone;

  String? _pocEmail;
  String? get pocEmail => _$this._pocEmail;
  set pocEmail(String? pocEmail) => _$this._pocEmail = pocEmail;

  String? _piName;
  String? get piName => _$this._piName;
  set piName(String? piName) => _$this._piName = piName;

  String? _piPhone;
  String? get piPhone => _$this._piPhone;
  set piPhone(String? piPhone) => _$this._piPhone = piPhone;

  String? _piEmail;
  String? get piEmail => _$this._piEmail;
  set piEmail(String? piEmail) => _$this._piEmail = piEmail;

  String? _riName;
  String? get riName => _$this._riName;
  set riName(String? riName) => _$this._riName = riName;

  String? _abstract;
  String? get abstract => _$this._abstract;
  set abstract(String? abstract) => _$this._abstract = abstract;

  String? _awardLink;
  String? get awardLink => _$this._awardLink;
  set awardLink(String? awardLink) => _$this._awardLink = awardLink;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SearchTestRecordBuilder() {
    SearchTestRecord._initializeBuilder(this);
  }

  SearchTestRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _firm = $v.firm;
      _awardTitle = $v.awardTitle;
      _agency = $v.agency;
      _phase = $v.phase;
      _proposalAwardDate = $v.proposalAwardDate;
      _contractEndDate = $v.contractEndDate;
      _solicitationYear = $v.solicitationYear;
      _awardYear = $v.awardYear;
      _awardAmount = $v.awardAmount;
      _duns = $v.duns;
      _numberEmployees = $v.numberEmployees;
      _address1 = $v.address1;
      _address2 = $v.address2;
      _city = $v.city;
      _state = $v.state;
      _pocName = $v.pocName;
      _pocPhone = $v.pocPhone;
      _pocEmail = $v.pocEmail;
      _piName = $v.piName;
      _piPhone = $v.piPhone;
      _piEmail = $v.piEmail;
      _riName = $v.riName;
      _abstract = $v.abstract;
      _awardLink = $v.awardLink;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchTestRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchTestRecord;
  }

  @override
  void update(void Function(SearchTestRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchTestRecord build() => _build();

  _$SearchTestRecord _build() {
    final _$result = _$v ??
        new _$SearchTestRecord._(
            firm: firm,
            awardTitle: awardTitle,
            agency: agency,
            phase: phase,
            proposalAwardDate: proposalAwardDate,
            contractEndDate: contractEndDate,
            solicitationYear: solicitationYear,
            awardYear: awardYear,
            awardAmount: awardAmount,
            duns: duns,
            numberEmployees: numberEmployees,
            address1: address1,
            address2: address2,
            city: city,
            state: state,
            pocName: pocName,
            pocPhone: pocPhone,
            pocEmail: pocEmail,
            piName: piName,
            piPhone: piPhone,
            piEmail: piEmail,
            riName: riName,
            abstract: abstract,
            awardLink: awardLink,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
