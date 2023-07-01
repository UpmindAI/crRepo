import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/main_menu/main_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class EditProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for mainMenu component.
  late MainMenuModel mainMenuModel;
  // State field(s) for firstNameEdit widget.
  TextEditingController? firstNameEditController;
  String? Function(BuildContext, String?)? firstNameEditControllerValidator;
  // State field(s) for lastNameEdit widget.
  TextEditingController? lastNameEditController;
  String? Function(BuildContext, String?)? lastNameEditControllerValidator;
  // State field(s) for companyEdit widget.
  TextEditingController? companyEditController;
  String? Function(BuildContext, String?)? companyEditControllerValidator;
  // State field(s) for industryEdit widget.
  TextEditingController? industryEditController;
  String? Function(BuildContext, String?)? industryEditControllerValidator;
  // State field(s) for roleEdit widget.
  TextEditingController? roleEditController;
  String? Function(BuildContext, String?)? roleEditControllerValidator;
  // State field(s) for phoneEdit widget.
  TextEditingController? phoneEditController;
  final phoneEditMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneEditControllerValidator;
  // State field(s) for walletEdit widget.
  TextEditingController? walletEditController;
  String? Function(BuildContext, String?)? walletEditControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainMenuModel = createModel(context, () => MainMenuModel());
  }

  void dispose() {
    mainMenuModel.dispose();
    firstNameEditController?.dispose();
    lastNameEditController?.dispose();
    companyEditController?.dispose();
    industryEditController?.dispose();
    roleEditController?.dispose();
    phoneEditController?.dispose();
    walletEditController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
