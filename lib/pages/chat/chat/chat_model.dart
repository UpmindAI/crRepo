import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/main_menu/main_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/chat/chat_chunks/chat_chunks_widget.dart';
import '/pages/chat/chat_history/chat_history_widget.dart';
import '/pages/chat/configure_bot/configure_bot_widget.dart';
import '/pages/chat/empt_chat/empt_chat_widget.dart';
import '/pages/datasets/add_dataset/add_dataset_widget.dart';
import '/pages/datasets/new_dataset_button/new_dataset_button_widget.dart';
import '/pages/prompt_lab/empty_promtlab/empty_promtlab_widget.dart';
import '/pages/prompt_lab/prompts_main/prompts_main_widget.dart';
import '/pages/prompt_lab/prompts_sub/prompts_sub_widget.dart';
import '/sharing/share_popup/share_popup_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? setCid;

  bool multiLine = false;

  bool mouseEnter = false;

  DocumentReference? openFolder;

  DocumentReference? openSub;

  String setBid = 'default';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for mainMenu component.
  late MainMenuModel mainMenuModel;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SharedBotsRecord? createBot;
  // State field(s) for chatColumn widget.
  ScrollController? chatColumn;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // State field(s) for startField widget.
  TextEditingController? startFieldController;
  String? Function(BuildContext, String?)? startFieldControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in startField widget.
  ChatMetaRecord? createChatForm;
  // Stores action output result for [Backend Call - Create Document] action in startField widget.
  ChatsRecord? createMessageForm;
  // Stores action output result for [Backend Call - API (MixedChat)] action in startField widget.
  ApiCallResponse? apiResultStartForm;
  // State field(s) for sendField widget.
  TextEditingController? sendFieldController;
  String? Function(BuildContext, String?)? sendFieldControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in sendField widget.
  ChatsRecord? chatMessageNewFromField;
  // Stores action output result for [Backend Call - API (MixedChat)] action in sendField widget.
  ApiCallResponse? apiResultzymFF;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for Checkbox widget.

  Map<UserDatasetsRecord, bool> checkboxValueMap = {};
  List<UserDatasetsRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainMenuModel = createModel(context, () => MainMenuModel());
    chatColumn = ScrollController();
    columnController1 = ScrollController();
    listViewController1 = ScrollController();
    columnController2 = ScrollController();
    listViewController2 = ScrollController();
  }

  void dispose() {
    unfocusNode.dispose();
    mainMenuModel.dispose();
    chatColumn?.dispose();
    startFieldController?.dispose();
    sendFieldController?.dispose();
    columnController1?.dispose();
    listViewController1?.dispose();
    columnController2?.dispose();
    listViewController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
