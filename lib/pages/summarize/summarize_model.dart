import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/main_menu/main_menu_widget.dart';
import '/components/summary_prompt_field/summary_prompt_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/datasets/add_dataset/add_dataset_widget.dart';
import '/pages/datasets/new_dataset_button/new_dataset_button_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class SummarizeModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String setTab = 'Templates';

  ///  State fields for stateful widgets in this page.

  // Model for mainMenu component.
  late MainMenuModel mainMenuModel;
  // Stores action output result for [Backend Call - Create Document] action in ButtonSummarize widget.
  UserPromptsRecord? setPromptSummarize;
  // Stores action output result for [Backend Call - API (recursiveSummarizer)] action in ButtonSummarize widget.
  ApiCallResponse? apiResultdataSummarizeBTN;
  // Stores action output result for [Backend Call - API (downloadServer)] action in Button widget.
  ApiCallResponse? apiResult4sp;
  // State field(s) for Checkbox widget.

  Map<UserDatasetsRecord, bool> checkboxValueMap = {};
  List<UserDatasetsRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainMenuModel = createModel(context, () => MainMenuModel());
  }

  void dispose() {
    mainMenuModel.dispose();
  }

  /// Additional helper methods are added here.

}
