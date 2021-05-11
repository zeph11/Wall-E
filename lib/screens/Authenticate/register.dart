//this is basically the signup page.
//the code for designing the page goes here

import 'package:expense_tracker/screens/Authenticate/info.dart';
import 'package:expense_tracker/screens/Authenticate/signin.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  String email = ' ';
  String password = ' ';
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[400],
        body: Column(children: <Widget>[
          Container(
              child: Container(
            child: new Text(
              'Create an account',
              textAlign: TextAlign.left,
              style: new TextStyle(fontSize: 40.0, color: Colors.white),
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
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Email',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white)),
                  Container(
                    width: 350,
                    //alignment: ,
                    child: TextField(
                      /*validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Enter an email';
              }
              return null;
            },*/
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),

                          // borderSide: BorderSide(color: Colors.white)
                        ),
                        labelText: 'Enter Email',
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
                  Container(
                    width: 350,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0)),
                        labelText: 'Enter Full Name',
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
                  Container(
                    width: 350,
                    /*child:
            Padding(
      padding: const EdgeInsets.all(10.0),*/
                    child: TextFormField(
                      /*validator: (val) {
              if (val == null || val.length > 6) {
                return 'Enter an passowrd more than 6 characters';
              }
              return null;
            },*/
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Enter Password',
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
                    color: Colors.green[800],
                    padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CollectInfo()),
                      );
                      //if (_formkey.currentState.validate()) {
                      //return CollectInfo();
                      // print('registerd');
                    },
                  ),
                  SizedBox(height: 30.0),
                  Text('Already registered?'),
                  SizedBox(height: 8.0),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    color: Colors.green[300],
                    child: Text('Go back to Sign In',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                      widget.toggleView();
                    },
                  )
                ],
              ),
            ),
          ),
        ]));
  }
}
