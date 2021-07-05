//this is basically the signup page.
//the code for designing the page goes here

import 'dart:ui';

import 'package:expense_tracker/Authentication/Authentication.dart';
import 'package:expense_tracker/screens/Authenticate/signin.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final AuthBase auth;

  const Register({@required this.auth});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String error = '';
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  String name;

  final _formkey = GlobalKey<FormState>();
  bool checkIfFormIsValid() {
    if (_formkey.currentState.validate()) {
      return true;
    }
    return false;
  }

  bool obs = true;
  void _toggle() {
    setState(() {
      obs = !obs;
    });
  }

  @override
  void dispose() {
    _password.dispose();
    _email.dispose();
    super.dispose();
  }

  Future<void> _signUpWithEmail() async {
    String email = _email.text.trim();
    String password = _password.text.trim();
    if (checkIfFormIsValid()) {
      try {
        await widget.auth.createEmailPassword(email, password);
        Navigator.pop(context);
      } catch (e) {
        setState(() => error = e.toString().substring(29));
        print(e.toString());
      }
    }
  }

  // final homeRef = FirebaseFirestore.instance.collection("user");
  // User user;

  //creating databae
  // _trialDatabase(String email, String name, String password) async {
  //   await homeRef
  //       .doc(name)
  //       .set({"EmailId": email, "FullName": name, "Password": password});
  // }

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
                        controller: _email,
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
                        controller: _password,
                        validator: (val) =>
                            val.length < 6 ? 'enter long passoword' : null,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: ' Enter Password',
                            suffixIcon: IconButton(
                              iconSize: 25,
                              onPressed: _toggle,
                              //elevation: 1.0,
                              icon: Icon(obs
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )),
                        obscureText: obs,
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
                      onPressed: _signUpWithEmail,
                    ),
                    SizedBox(height: 10),
                    Text(error,
                        style: TextStyle(
                          color: Colors.red[800],
                        )),

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
                          MaterialPageRoute(
                              builder: (context) => SignIn(
                                    auth: widget.auth,
                                  )),
                        );
                      },
                    ),

                    SizedBox(height: 8.0),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
