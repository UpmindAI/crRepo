import '/auth/firebase_auth/auth_util.dart';
import '/components/admin_tools_widget.dart';
import '/components/main_menu/main_menu_widget.dart';
import '/components/settings_page/settings_page_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for mainMenu component.
  late MainMenuModel mainMenuModel;
  // Model for settingsPage component.
  late SettingsPageModel settingsPageModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainMenuModel = createModel(context, () => MainMenuModel());
    settingsPageModel = createModel(context, () => SettingsPageModel());
  }

  void dispose() {
    unfocusNode.dispose();
    mainMenuModel.dispose();
    settingsPageModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
