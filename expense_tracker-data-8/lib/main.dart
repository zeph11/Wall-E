import 'package:expense_tracker/Authentication/Authentication.dart';
import 'package:expense_tracker/Authentication/LandingPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthBase auth = Auth();
  //this widget is the root of the application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(
        auth: auth,
      ),
    );
  }
}
