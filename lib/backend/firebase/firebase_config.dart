import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBiNY_TswNvB2pJ8Ns6DlNbou4FNg7TZkc",
            authDomain: "a-i-art-sqtyyy.firebaseapp.com",
            projectId: "a-i-art-sqtyyy",
            storageBucket: "a-i-art-sqtyyy.firebasestorage.app",
            messagingSenderId: "830130915287",
            appId: "1:830130915287:web:434104083137af18caed92"));
  } else {
    await Firebase.initializeApp();
  }
}
