// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:file_picker/file_picker.dart';

Future<List<String>?> pickFiles() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.custom,
    allowedExtensions: ['epub', 'pdf', 'docx', 'txt', 'mp3'],
  );
  if (result != null) {
    List<String> list = [];
    for (int i = 0; i < result.paths.length; i++) {
      list.add(result.paths[i]!);
    }
    return list;
  } else {
    return null;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
