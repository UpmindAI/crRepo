import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/chat/configure_bot/configure_bot_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ConfigureBotModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool guardrailOn = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for CostumGuardrail widget.
  bool? costumGuardrailValue;
  // State field(s) for guardRail widget.
  TextEditingController? guardRailController;
  String? Function(BuildContext, String?)? guardRailControllerValidator;
  // State field(s) for topK widget.
  TextEditingController? topKController;
  final topKMask = MaskTextInputFormatter(mask: '#');
  String? Function(BuildContext, String?)? topKControllerValidator;
  String? _topKControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return ' ';
    }

    if (val.length < 1) {
      return ' ';
    }
    if (val.length > 1) {
      return ' ';
    }
    if (!RegExp('').hasMatch(val)) {
      return ' ';
    }
    return null;
  }

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for persSwitch widget.
  bool? persSwitchValue;
  // State field(s) for chatPersonality widget.
  TextEditingController? chatPersonalityController;
  String? Function(BuildContext, String?)? chatPersonalityControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topKControllerValidator = _topKControllerValidator;
  }

  void dispose() {
    guardRailController?.dispose();
    topKController?.dispose();
    chatPersonalityController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
