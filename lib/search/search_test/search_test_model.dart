import '/components/main_menu/main_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchTestModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for mainMenu component.
  late MainMenuModel mainMenuModel;
  // State field(s) for searchInput widget.
  TextEditingController? searchInputController;
  String? Function(BuildContext, String?)? searchInputControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainMenuModel = createModel(context, () => MainMenuModel());
  }

  void dispose() {
    unfocusNode.dispose();
    mainMenuModel.dispose();
    searchInputController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
