import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learny/firebase_options.dart';

class AppInitializer {
  Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
