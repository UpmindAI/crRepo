import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/datasets_sidebar_widget.dart';
import '/components/main_menu/main_menu_widget.dart';
import '/components/promptlab_prompt_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/prompt_lab/add_prompt/add_prompt_widget.dart';
import '/pages/prompt_lab/add_sub_folder/add_sub_folder_widget.dart';
import '/pages/prompt_lab/empty_promtlab/empty_promtlab_widget.dart';
import '/pages/prompt_lab/folder_options/folder_options_widget.dart';
import '/pages/prompt_lab/folder_options_sub/folder_options_sub_widget.dart';
import '/pages/prompt_lab/pl_completion/pl_completion_widget.dart';
import '/pages/prompt_lab/prompt_lab_system/prompt_lab_system_widget.dart';
import '/pages/prompt_lab/promptlabl_content/promptlabl_content_widget.dart';
import '/pages/prompt_lab/prompts_main/prompts_main_widget.dart';
import '/pages/prompt_lab/prompts_sub/prompts_sub_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PromptLabModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  PromptlabRecord? projectDoc;

  bool addFolder = false;

  DocumentReference? openFolder;

  DocumentReference? openSub;

  DocumentReference? setPLref;

  String? setSystem;

  bool configView = false;

  ///  State fields for stateful widgets in this page.

  // Model for mainMenu component.
  late MainMenuModel mainMenuModel;
  // State field(s) for searchBar widget.
  TextEditingController? searchBarController;
  String? Function(BuildContext, String?)? searchBarControllerValidator;
  // State field(s) for nameFolder widget.
  TextEditingController? nameFolderController;
  String? Function(BuildContext, String?)? nameFolderControllerValidator;
  // Model for promptLabSystem component.
  late PromptLabSystemModel promptLabSystemModel;
  // Model for promptlablContent component.
  late PromptlablContentModel promptlablContentModel;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Model for promptlabPrompt component.
  late PromptlabPromptModel promptlabPromptModel;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PlPromptsRecord? setPromptDataset;
  // Stores action output result for [Backend Call - API (promptLab)] action in Button widget.
  ApiCallResponse? apiResulty84;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PlPromptsRecord? setPromptNoDataset;
  // Stores action output result for [Backend Call - API (promptLab)] action in Button widget.
  ApiCallResponse? apiResulty85;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  final textFieldMask = MaskTextInputFormatter(mask: '#');
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for Slider widget.
  double? sliderValue;
  // Model for plCompletion component.
  late PlCompletionModel plCompletionModel;
  // Model for datasetsSidebar component.
  late DatasetsSidebarModel datasetsSidebarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainMenuModel = createModel(context, () => MainMenuModel());
    promptLabSystemModel = createModel(context, () => PromptLabSystemModel());
    promptlablContentModel =
        createModel(context, () => PromptlablContentModel());
    promptlabPromptModel = createModel(context, () => PromptlabPromptModel());
    plCompletionModel = createModel(context, () => PlCompletionModel());
    datasetsSidebarModel = createModel(context, () => DatasetsSidebarModel());
  }

  void dispose() {
    mainMenuModel.dispose();
    searchBarController?.dispose();
    nameFolderController?.dispose();
    promptLabSystemModel.dispose();
    promptlablContentModel.dispose();
    promptlabPromptModel.dispose();
    textController3?.dispose();
    plCompletionModel.dispose();
    datasetsSidebarModel.dispose();
  }

  /// Additional helper methods are added here.

}
