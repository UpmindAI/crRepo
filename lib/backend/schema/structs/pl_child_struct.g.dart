// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pl_child_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PlChildStruct> _$plChildStructSerializer =
    new _$PlChildStructSerializer();

class _$PlChildStructSerializer implements StructuredSerializer<PlChildStruct> {
  @override
  final Iterable<Type> types = const [PlChildStruct, _$PlChildStruct];
  @override
  final String wireName = 'PlChildStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, PlChildStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.folderName;
    if (value != null) {
      result
        ..add('folder_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.docRef;
    if (value != null) {
      result
        ..add('doc_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  PlChildStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlChildStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'folder_name':
          result.folderName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doc_ref':
          result.docRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$PlChildStruct extends PlChildStruct {
  @override
  final String? folderName;
  @override
  final DocumentReference<Object?>? docRef;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$PlChildStruct([void Function(PlChildStructBuilder)? updates]) =>
      (new PlChildStructBuilder()..update(updates))._build();

  _$PlChildStruct._(
      {this.folderName, this.docRef, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'PlChildStruct', 'firestoreUtilData');
  }

  @override
  PlChildStruct rebuild(void Function(PlChildStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlChildStructBuilder toBuilder() => new PlChildStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PlChildStruct &&
        folderName == other.folderName &&
        docRef == other.docRef &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, folderName.hashCode);
    _$hash = $jc(_$hash, docRef.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PlChildStruct')
          ..add('folderName', folderName)
          ..add('docRef', docRef)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class PlChildStructBuilder
    implements Builder<PlChildStruct, PlChildStructBuilder> {
  _$PlChildStruct? _$v;

  String? _folderName;
  String? get folderName => _$this._folderName;
  set folderName(String? folderName) => _$this._folderName = folderName;

  DocumentReference<Object?>? _docRef;
  DocumentReference<Object?>? get docRef => _$this._docRef;
  set docRef(DocumentReference<Object?>? docRef) => _$this._docRef = docRef;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  PlChildStructBuilder() {
    PlChildStruct._initializeBuilder(this);
  }

  PlChildStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _folderName = $v.folderName;
      _docRef = $v.docRef;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PlChildStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PlChildStruct;
  }

  @override
  void update(void Function(PlChildStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PlChildStruct build() => _build();

  _$PlChildStruct _build() {
    final _$result = _$v ??
        new _$PlChildStruct._(
            folderName: folderName,
            docRef: docRef,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'PlChildStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
