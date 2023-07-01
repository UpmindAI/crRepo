import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMetaRecord extends FirestoreRecord {
  ChatMetaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_on" field.
  DateTime? _createdOn;
  DateTime? get createdOn => _createdOn;
  bool hasCreatedOn() => _createdOn != null;

  // "cid" field.
  String? _cid;
  String get cid => _cid ?? '';
  bool hasCid() => _cid != null;

  // "qids" field.
  List<String>? _qids;
  List<String> get qids => _qids ?? const [];
  bool hasQids() => _qids != null;

  // "first_message" field.
  String? _firstMessage;
  String get firstMessage => _firstMessage ?? '';
  bool hasFirstMessage() => _firstMessage != null;

  // "prompts" field.
  List<String>? _prompts;
  List<String> get prompts => _prompts ?? const [];
  bool hasPrompts() => _prompts != null;

  // "is_loading" field.
  bool? _isLoading;
  bool get isLoading => _isLoading ?? false;
  bool hasIsLoading() => _isLoading != null;

  // "completions" field.
  List<String>? _completions;
  List<String> get completions => _completions ?? const [];
  bool hasCompletions() => _completions != null;

  // "last_message" field.
  DateTime? _lastMessage;
  DateTime? get lastMessage => _lastMessage;
  bool hasLastMessage() => _lastMessage != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdOn = snapshotData['created_on'] as DateTime?;
    _cid = snapshotData['cid'] as String?;
    _qids = getDataList(snapshotData['qids']);
    _firstMessage = snapshotData['first_message'] as String?;
    _prompts = getDataList(snapshotData['prompts']);
    _isLoading = snapshotData['is_loading'] as bool?;
    _completions = getDataList(snapshotData['completions']);
    _lastMessage = snapshotData['last_message'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chat_meta')
          : FirebaseFirestore.instance.collectionGroup('chat_meta');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('chat_meta').doc();

  static Stream<ChatMetaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatMetaRecord.fromSnapshot(s));

  static Future<ChatMetaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatMetaRecord.fromSnapshot(s));

  static ChatMetaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatMetaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatMetaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatMetaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatMetaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatMetaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatMetaRecordData({
  DateTime? createdOn,
  String? cid,
  String? firstMessage,
  bool? isLoading,
  DateTime? lastMessage,
  String? uid,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_on': createdOn,
      'cid': cid,
      'first_message': firstMessage,
      'is_loading': isLoading,
      'last_message': lastMessage,
      'uid': uid,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatMetaRecordDocumentEquality implements Equality<ChatMetaRecord> {
  const ChatMetaRecordDocumentEquality();

  @override
  bool equals(ChatMetaRecord? e1, ChatMetaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdOn == e2?.createdOn &&
        e1?.cid == e2?.cid &&
        listEquality.equals(e1?.qids, e2?.qids) &&
        e1?.firstMessage == e2?.firstMessage &&
        listEquality.equals(e1?.prompts, e2?.prompts) &&
        e1?.isLoading == e2?.isLoading &&
        listEquality.equals(e1?.completions, e2?.completions) &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.uid == e2?.uid &&
        e1?.image == e2?.image;
  }

  @override
  int hash(ChatMetaRecord? e) => const ListEquality().hash([
        e?.createdOn,
        e?.cid,
        e?.qids,
        e?.firstMessage,
        e?.prompts,
        e?.isLoading,
        e?.completions,
        e?.lastMessage,
        e?.uid,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatMetaRecord;
}
