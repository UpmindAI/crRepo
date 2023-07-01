import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/main_menu/main_menu_widget.dart';
import '/components/refresh_required_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/datasets/add_dataset/add_dataset_widget.dart';
import '/pages/datasets/new_dataset_button/new_dataset_button_widget.dart';
import '/pages/play/prompt_config/prompt_config_widget.dart';
import '/pages/prompt_lab/empty_promtlab/empty_promtlab_widget.dart';
import '/pages/prompt_lab/prompts_main/prompts_main_widget.dart';
import '/pages/prompt_lab/prompts_sub/prompts_sub_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  DocumentReference? openFolder;

  DocumentReference? openSub;

  bool mouseEnter = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for mainMenu component.
  late MainMenuModel mainMenuModel;
  // State field(s) for PromptField widget.
  TextEditingController? promptFieldController;
  String? Function(BuildContext, String?)? promptFieldControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Stores action output result for [Backend Call - Create Document] action in ButtonMix widget.
  UserPromptsRecord? setPrompt;
  // Stores action output result for [Backend Call - Create Document] action in ButtonGPT widget.
  UserPromptsRecord? setPromptGPT;
  // Stores action output result for [Backend Call - Create Document] action in ButtonMyData widget.
  UserPromptsRecord? setPromptG;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Checkbox widget.

  Map<UserDatasetsRecord, bool> checkboxValueMap = {};
  List<UserDatasetsRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for Timer widget.
  int timerMilliseconds = 1000;
  String timerValue = StopWatchTimer.getDisplayTime(1000, milliSecond: false);
  StopWatchTimer timerController =
      StopWatchTimer(mode: StopWatchMode.countDown);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainMenuModel = createModel(context, () => MainMenuModel());
  }

  void dispose() {
    mainMenuModel.dispose();
    promptFieldController?.dispose();
    timerController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
