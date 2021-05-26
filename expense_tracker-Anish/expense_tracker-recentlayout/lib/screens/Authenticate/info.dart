import 'package:expense_tracker/screens/Authenticate/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:expense_tracker/database.dart';

String name;

class CollectInfo extends StatefulWidget {
  CollectInfo(name) {
    //this.name = name;
  }
  @override
  _CollectInfoState createState() => _CollectInfoState();
}

class _CollectInfoState extends State<CollectInfo> {
  String dexpense = "";

  String mexpense = "";

  String esavings = "";

  final homeRef = FirebaseFirestore.instance.collection("user");

  User user;

  void updateDatabse(String dexpense, String mexpense, String esavings) async {
    await homeRef.doc(name).update(
        {"dexpense": dexpense, "mexpense": mexpense, "esavings": esavings});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff3282B8),
          elevation: 0.0, //removes dropshadow
          title: Text('Enter Details'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 50.0),
          child: Form(
            child: new Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("How much do you expect to spend daily?"),
                SizedBox(
                  height: 10.0,
                ),
                new Flexible(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.0),
                          ),
                          hintText: ' Enter daily expense',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff3282B8).withOpacity(0.9),
                        ),
                        onChanged: (val) {
                          setState(() => dexpense = val);
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('How much is your estimated monthly expense?'),
                SizedBox(
                  height: 10.0,
                ),
                new Flexible(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.0),
                          ),
                          hintText: ' Enter estimated monthly expenditure',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff3282B8).withOpacity(0.9),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (val) {
                          setState(() => mexpense = val);
                        },
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('How much do you expect to save monthly?'),
                new Flexible(
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: new TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.0),
                          ),
                          hintText: ' Enter expected savings',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff3282B8).withOpacity(0.9),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (val) {
                          setState(() => esavings = val);
                        },
                      )),
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
                      'NEXT',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      await DatabaseService()
                          .updateDatabse(dexpense, mexpense, esavings);

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    })
              ],

              /* Column(
            children: <Widget>[
              Text(
                "Your expected Income:",
                textAlign: TextAlign.left,
                // style:TextStyle,
              ),
              Container(
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0)),
                      labelText: 'Expected Income',
                      filled: true,
                      fillColor: Colors.blue[400],
                    ),
                    onChanged: (val) {
                      //setState(() => name = val);
                    },
                  ))
            ],
          ),*/
            ),
          ),
        ));
  }
}
