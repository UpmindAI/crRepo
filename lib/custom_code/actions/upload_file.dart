// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

Future<List<String>?> uploadFile(String filePath, String storagePath) async {
  try {
    final FirebaseStorage storage = FirebaseStorage.instance;
    File file = File(filePath);
    final String fileName = file.path.split("/").last;
    late String downloadUrl;

    final Reference firebaseStorageRef =
        storage.ref().child("/users/${storagePath}/$fileName");

    await firebaseStorageRef.putFile(file).then((snapshot) async {
      downloadUrl = await snapshot.ref.getDownloadURL();
      downloadUrl = downloadUrl.toString();
    });
    return [fileName, downloadUrl];
  } catch (e) {
    return null;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
