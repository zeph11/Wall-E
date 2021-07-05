//this is the signin page
//the landing page if the user is logged out

import 'package:expense_tracker/Authentication/Authentication.dart';
import 'package:expense_tracker/screens/Authenticate/register.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/services/auth.dart';

class SignIn extends StatefulWidget {
  final AuthBase auth;

  const SignIn({@required this.auth});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String error = '';
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  bool checkIfFormICorrect() {
    if (_formkey.currentState.validate()) {
      return true;
    }
    return false;
  }

  Future<void> _signInService() async {
    if (checkIfFormICorrect()) {
      try {
        String email = _email.text.trim();
        String password = _password.text.trim();

        await widget.auth.signInWithEmailPassword(email, password);
      } catch (e) {
        setState(() => error = e.toString().substring(29));
        print(e.toString());
      }
    }
  }

  bool obs = true;
  void _toggle() {
    setState(() {
      obs = !obs;
    });
  }
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
                          controller: _email,
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
                        child: TextFormField(
                          controller: _password,
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
                          //side: BorderSide(color: Colors.white)
                        ),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white),
                        ),
                        //onPressed: deleteDatabase,
                        onPressed: _signInService,
                      ),
                      SizedBox(height: 10),
                      Text(error,
                          style: TextStyle(
                            color: Colors.red[800],
                          )),
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
                            MaterialPageRoute(
                                builder: (context) => Register(
                                      auth: widget.auth,
                                    )),
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
