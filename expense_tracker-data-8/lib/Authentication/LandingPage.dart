import 'package:expense_tracker/screens/Authenticate/signin.dart';
import 'package:expense_tracker/screens/homepage/home.dart';
import 'package:flutter/material.dart';
import 'Authentication.dart';

class LandingPage extends StatelessWidget {
  final AuthBase auth;

  const LandingPage({@required this.auth});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserClass>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            UserClass user = snapshot.data;
            if (user == null) {
              return SignIn(
                auth: auth,
              );
            }

            return DashBoard(auth: auth, initialUser: user);
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
