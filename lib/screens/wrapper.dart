//wrapper page decides which page to show when the app is opened
//either the homepage, or signin page

//authenciation ko ni kei kei code huncha

import 'package:expense_tracker/screens/Authenticate/authenciate.dart';
import 'package:expense_tracker/screens/Authenticate/signin.dart';
import 'package:expense_tracker/screens/homepage/profile.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/screens/homepage/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DashBoard();
  }
}
