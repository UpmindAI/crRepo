import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailSignup widget.
  TextEditingController? emailSignupController;
  String? Function(BuildContext, String?)? emailSignupControllerValidator;
  // State field(s) for Password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'Your password needs to be at least 8 characters, and inlcude at least one lowercase, one uppercase, one number and one special character.';
    }

    if (!RegExp('(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\\W)').hasMatch(val)) {
      return 'Your password needs to be at least 8 characters, and inlcude at least one lowercase, one uppercase, one number and one special character.';
    }
    return null;
  }

  // State field(s) for PasswordRepeat widget.
  TextEditingController? passwordRepeatController;
  late bool passwordRepeatVisibility;
  String? Function(BuildContext, String?)? passwordRepeatControllerValidator;
  String? _passwordRepeatControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'Your password needs to be at least 8 characters, and inlcude at least one lowercase, one uppercase, one number and one special character.';
    }

    if (!RegExp('(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\\W)').hasMatch(val)) {
      return 'Your password needs to be at least 8 characters, and inlcude at least one lowercase, one uppercase, one number and one special character.';
    }
    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordControllerValidator = _passwordControllerValidator;
    passwordRepeatVisibility = false;
    passwordRepeatControllerValidator = _passwordRepeatControllerValidator;
  }

  void dispose() {
    emailSignupController?.dispose();
    passwordController?.dispose();
    passwordRepeatController?.dispose();
  }

  /// Additional helper methods are added here.

}
