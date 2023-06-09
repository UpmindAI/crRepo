import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/main_menu/main_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoryModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for mainMenu component.
  late MainMenuModel mainMenuModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainMenuModel = createModel(context, () => MainMenuModel());
  }

  void dispose() {
    unfocusNode.dispose();
    mainMenuModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
