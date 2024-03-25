import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDYlnsBHpd2U_oPOymljnMQGPYQ9CfXhc4",
            authDomain: "scafflife-support1-v2xz8c.firebaseapp.com",
            projectId: "scafflife-support1-v2xz8c",
            storageBucket: "scafflife-support1-v2xz8c.appspot.com",
            messagingSenderId: "573927619253",
            appId: "1:573927619253:web:7c12228158a42653885cfc"));
  } else {
    await Firebase.initializeApp();
  }
}
