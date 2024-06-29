import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDRMqShqDEcSd49BkMmpEnS2BUsGymdnMQ",
            authDomain: "scafflifetestspec-tav5ez.firebaseapp.com",
            projectId: "scafflifetestspec-tav5ez",
            storageBucket: "scafflifetestspec-tav5ez.appspot.com",
            messagingSenderId: "266467834452",
            appId: "1:266467834452:web:22e8ad4c8e490797950bc1"));
  } else {
    await Firebase.initializeApp();
  }
}
