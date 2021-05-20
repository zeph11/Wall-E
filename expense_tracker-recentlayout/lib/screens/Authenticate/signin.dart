//this is the signin page
//the landing page if the user is logged out
import 'package:expense_tracker/screens/Authenticate/register.dart';
import 'package:expense_tracker/screens/homepage/home.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3282B8),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(
                vertical: 50.0,
                horizontal: 15,
              ),
              child: Column(
                children: [
                  Text(' Welcome !',
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        fontSize: 50.0,
                        //fontFamily: 'tnr',
                        color: Colors.white,
                      )),
                  Text(
                    'Log in to your account.',
                    textAlign: TextAlign.left,
                    style: new TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 230.0,
                horizontal: 50.0,
              ), //removes away from edges
              child: Form(
                  child: Column(children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Text('Email', style: TextStyle(color: Colors.white)),
                SizedBox(
                  height: 10.0,
                ),
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
                      hintText: ' Enter Email',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),
                Text('Password', style: TextStyle(color: Colors.white)),
                SizedBox(
                  height: 10.0,
                ),
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
                        //borderSide: BorderSide
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
                    //side: BorderSide(color: Colors.white)
                  ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashBoard()),
                    );
                    //if (_formkey.currentState.validate()) {
                  },
                ),
                SizedBox(height: 35.0),
                Text('Don\'t have an account yet?',
                    style: TextStyle(color: Colors.white)),
                InkWell(
                  child: Text('Register',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                ),
              ])),
            ),
          ],
        )),
      ),
    );
  }
}
