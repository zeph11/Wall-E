import 'package:expense_tracker/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //this widget is the root of the application
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialApp(
      home: Wrapper(),
    ));
  }
}
