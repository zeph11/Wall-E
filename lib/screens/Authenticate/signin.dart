//this is the signin page
//the landing page if the user is logged out
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
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        elevation: 0.0, //removes dropshadow
        title: Text('Sign In'),
        actions: <Widget>[
          // ignore: deprecated_member_use
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () {
              print("pressed");
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 180.0,
          horizontal: 50.0,
        ), //removes away from edges
        child: Form(
            child: Column(children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Text('Email', style: TextStyle(color: Colors.white)),
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

          SizedBox(
            height: 20.0,
          ),
          Text('Password', style: TextStyle(color: Colors.white)),
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
                labelText: 'Enter Password',
              ),
              obscureText: true,
              onChanged: (val) {
                setState(() => password = val);
              },
            ),
          ),

          SizedBox(height: 20.0),
          // ignore: deprecated_member_use
          RaisedButton(
            color: Colors.green[800],
            padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red)),
            child: Text(
              'Sign In',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashBoard()),
              );
              //if (_formkey.currentState.validate()) {
            },
          )
        ])),
      ),
    );
  }
}
