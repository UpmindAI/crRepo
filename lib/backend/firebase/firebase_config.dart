import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD1Fh6ztMi7CrKa7A-p8A85-oZc0NcZpO0",
            authDomain: "crispai.firebaseapp.com",
            projectId: "crispai",
            storageBucket: "crispai.appspot.com",
            messagingSenderId: "1003522928061",
            appId: "1:1003522928061:web:1c1c2850d1f0ad6557f6d4",
            measurementId: "G-ZF0FE5FB45"));
  } else {
    await Firebase.initializeApp();
  }
}
