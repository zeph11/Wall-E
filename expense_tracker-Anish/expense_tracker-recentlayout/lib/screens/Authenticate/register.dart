//this is basically the signup page.
//the code for designing the page goes here

import 'dart:html';
import 'dart:ui';

import 'package:expense_tracker/screens/Authenticate/info.dart';
import 'package:expense_tracker/screens/Authenticate/signin.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:expense_tracker/services/user.dart';

class Register extends StatefulWidget {
  // final Function toggleView;
  // Register({this.toggleView});
  String uid = 'a';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  final homeRef = FirebaseFirestore.instance.collection("user");
  User user;

  Userclass _userfromfirebaseuser(User user) {
    return user != null ? Userclass(uid: user.uid) : null;
  }

  //creating databae
  _trialDatabase(String email, String name, String password) async {
    await homeRef
        .doc(name)
        .set({"EmailId": email, "FullName": name, "Password": password});
  }

  String email = ' ';
  String password = ' ';
  String name = '';
  String error = '';
  String uid = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff3282B8),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
                child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(
                vertical: 50.0,
                horizontal: 20,
              ),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  new Text(
                    'Create an account.',
                    textAlign: TextAlign.left,
                    style: new TextStyle(fontSize: 45.0, color: Colors.white),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '   Enter deatils to register.',
                      textAlign: TextAlign.left,
                      style: new TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  )
                ],
              ),
            )
                // Text('Enter details to register'),
                ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 140.0,
                horizontal: 50.0,
              ),
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Email',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white)),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 350,
                      //alignment: ,
                      child: TextFormField(
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Enter an email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),

                            // borderSide: BorderSide(color: Colors.white)
                          ),
                          hintText: ' Enter Email',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text('Full Name',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white)),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 350,
                      child: TextFormField(
                        validator: (val) =>
                            val.length < 6 ? 'enter name' : null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0)),
                          hintText: ' Enter Full Name',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: (val) {
                          setState(() => name = val);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('Password',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white)),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 350,
                      /*child:
              Padding(
      padding: const EdgeInsets.all(10.0),*/
                      child: TextFormField(
                        validator: (val) =>
                            val.length < 6 ? 'enter long passoword' : null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: ' Enter Password',
                        ),
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                    ),

                    SizedBox(height: 40.0),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      color: Colors.green[900],
                      padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        //side: BorderSide(color: Colors.white),
                      ),
                      child: Text(
                        'REGISTER',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        print(email);
                        if (_formkey.currentState.validate()) {
                          dynamic result =
                              await _auth.registerwithemail(email, password);
                          if (result == null) {
                            setState(() => error = "invalid email");
                          } else {
                            _trialDatabase(email, name, password);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CollectInfo(name)),
                            );
                          }
                        }
                        if (_formkey.currentState.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CollectInfo(name)),
                          );
                          print('registerd');
                        }
                      },
                    ),
                    SizedBox(height: 35.0),
                    Text('Already registered?',
                        style: TextStyle(color: Colors.white)),
                    InkWell(
                      child: Text('Go back to Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          )),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                    ),

                    SizedBox(height: 8.0),
                    // ignore: deprecated_member_use
                    /*RaisedButton(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      color: Colors.green[300],
                      child: Text('Go back to Sign In',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () async {
                        widget.toggleView();
                      },
                    )*/
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
