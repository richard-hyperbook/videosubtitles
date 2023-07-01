import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCR5_zkGNYVi_G5PR0g-KaCaBdBkg2Ck7c",
            authDomain: "hyperbook-52ff7.firebaseapp.com",
            projectId: "hyperbook-52ff7",
            storageBucket: "hyperbook-52ff7.appspot.com",
            messagingSenderId: "759857387012",
            appId: "1:759857387012:web:f06eb36c780eac18bcc751",
            measurementId: "G-T67R96MPW6"));
  } else {
    await Firebase.initializeApp();
  }
}
