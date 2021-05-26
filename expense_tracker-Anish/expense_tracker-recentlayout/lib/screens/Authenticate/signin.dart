//this is the signin page
//the landing page if the user is logged out
import 'package:expense_tracker/screens/Authenticate/info.dart';
import 'package:expense_tracker/screens/Authenticate/register.dart';
import 'package:expense_tracker/screens/homepage/home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  // final homeRef = FirebaseFirestore.instance.collection("user");
  // User user;

  //creating databae
  // _trialDatabase(String email) async {
  //   await homeRef.doc("username").set({"EmailId": email});
  //}

  // readDatabase()async{
  //   QuerySnapshot query = await homeRef.get();
  //
  //   query.docs.forEach((value){
  //     print(value.data());
  //   });
  // }

  //upadteDatabase
  // void updateDatabse()async{
  //   await homeRef.doc("username").update({
  //
  //     "data":"Project"
  //   });
  // }

  //deleteDatabae

  void deleteDatabase() async {
    //await homeRef.doc('username').delete();
  }

  //final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

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
                    key: _formkey,
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
                        child: TextFormField(
                          validator: (String value) {
                            String sanitizedVal = value.trim();
                            if (sanitizedVal.isEmpty) {
                              return 'Email is required';
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
                          validator: (val) =>
                              val.length < 6 ? 'enter long passoword' : null,
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
                        //onPressed: deleteDatabase,
                        onPressed: () async {
                          if (_formkey.currentState.validate()) {
                            dynamic result =
                                await _auth.signinwithemail(email, password);
                            if (result == null) {
                              setState(
                                  () => error = "INVALID EMAIL OR PASSSWORD.");
                            } else {
                              //_trialDatabase(email);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashBoard()),
                              );
                            }
                          }
                        },
                      ),
                      Text(error),
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
                          /*signInWithGoogle().then(
                        (user) => {
                          this.user = user,
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashBoard()),
                          ),
                        },
                      );*/
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                      ),
                    ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
