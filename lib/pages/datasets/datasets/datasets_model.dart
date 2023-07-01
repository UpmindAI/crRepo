import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/confirm_delete/confirm_delete_widget.dart';
import '/components/edit_dataset_title/edit_dataset_title_widget.dart';
import '/components/edit_title/edit_title_widget.dart';
import '/components/main_menu/main_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/datasets/add_dataset/add_dataset_widget.dart';
import '/pages/datasets/add_list/add_list_widget.dart';
import '/pages/datasets/new_dataset_button/new_dataset_button_widget.dart';
import '/pages/datasets/upload_config/upload_config_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class DatasetsModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool urlTooltip = false;

  ///  State fields for stateful widgets in this page.

  // Model for mainMenu component.
  late MainMenuModel mainMenuModel;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for scrapeURL widget.
  TextEditingController? scrapeURLController;
  String? Function(BuildContext, String?)? scrapeURLControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in scrapeURL widget.
  UserTempUrlsRecord? createURLdocu;
  // Stores action output result for [Backend Call - API (scrapeServer)] action in scrapeURL widget.
  ApiCallResponse? scrapeURL;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for Checkbox widget.

  Map<UserDocsRecord, bool> checkboxValueMap = {};
  List<UserDocsRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainMenuModel = createModel(context, () => MainMenuModel());
  }

  void dispose() {
    mainMenuModel.dispose();
    scrapeURLController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
