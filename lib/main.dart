import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:napples/screens/splash_screen.dart';

import 'api/google_sheets_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleSheetsApi().init();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const SplashScreen(),
    );
  }
}
