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

class AddPromptModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for promptName widget.
  TextEditingController? promptNameController;
  String? Function(BuildContext, String?)? promptNameControllerValidator;
  // State field(s) for promptField widget.
  TextEditingController? promptFieldController;
  String? Function(BuildContext, String?)? promptFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    promptNameController?.dispose();
    promptFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
