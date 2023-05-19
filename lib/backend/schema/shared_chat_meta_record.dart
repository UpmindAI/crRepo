import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SharedChatMetaRecord extends FirestoreRecord {
  SharedChatMetaRecord._(
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

  // "bid" field.
  String? _bid;
  String get bid => _bid ?? '';
  bool hasBid() => _bid != null;

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
    _bid = snapshotData['bid'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('shared_chat_meta')
          : FirebaseFirestore.instance.collectionGroup('shared_chat_meta');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('shared_chat_meta').doc();

  static Stream<SharedChatMetaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SharedChatMetaRecord.fromSnapshot(s));

  static Future<SharedChatMetaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SharedChatMetaRecord.fromSnapshot(s));

  static SharedChatMetaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SharedChatMetaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SharedChatMetaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SharedChatMetaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SharedChatMetaRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createSharedChatMetaRecordData({
  DateTime? createdOn,
  String? cid,
  String? firstMessage,
  bool? isLoading,
  DateTime? lastMessage,
  String? uid,
  String? image,
  String? bid,
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
      'bid': bid,
    }.withoutNulls,
  );

  return firestoreData;
}
