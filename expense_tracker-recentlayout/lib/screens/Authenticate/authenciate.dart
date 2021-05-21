//toggle between signin page and register page

import 'package:expense_tracker/screens/Authenticate/signin.dart';
import 'package:flutter/material.dart';
import 'register.dart';

class Authenciate extends StatefulWidget {
  @override
  _AuthenciateState createState() => _AuthenciateState();
}

class _AuthenciateState extends State<Authenciate> {
  bool showsignin = true;

  void toggleView() {
    setState(() => showsignin = !showsignin);
  }

  @override
  Widget build(BuildContext context) {
    if (showsignin) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
