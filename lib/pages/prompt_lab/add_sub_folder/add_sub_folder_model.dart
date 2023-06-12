import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddSubFolderModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for subFolder widget.
  TextEditingController? subFolderController;
  String? Function(BuildContext, String?)? subFolderControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PromptlabSub0Record? createSub;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    subFolderController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
