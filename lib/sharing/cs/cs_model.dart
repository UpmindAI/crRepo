import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/chat/empt_chat/empt_chat_widget.dart';
import '/sharing/shared_chat_chunks/shared_chat_chunks_widget.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CsModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? setCid;

  bool multiLine = false;

  bool mouseEnter = false;

  DocumentReference? openFolder;

  DocumentReference? openSub;

  String bid = 'default';

  SharedChatMetaRecord? setChat;

  DocumentReference? setBot;

  bool inChat = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for chatColumn widget.
  ScrollController? chatColumn;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // State field(s) for startField widget.
  TextEditingController? startFieldController;
  String? Function(BuildContext, String?)? startFieldControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in startField widget.
  SharedChatMetaRecord? createSharedChatMetaPaal;
  // Stores action output result for [Backend Call - Create Document] action in startField widget.
  SharedChatsRecord? shareChatMessage;
  // State field(s) for sendField widget.
  TextEditingController? sendFieldController;
  String? Function(BuildContext, String?)? sendFieldControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in sendField widget.
  SharedChatsRecord? shareChatSendCopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    chatColumn = ScrollController();
  }

  void dispose() {
    unfocusNode.dispose();
    chatColumn?.dispose();
    startFieldController?.dispose();
    sendFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
