import 'package:expense_tracker/Authentication/Authentication.dart';
import 'package:expense_tracker/Models/UserMOdel.dart';
import 'package:expense_tracker/screens/Authenticate/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expense_tracker/database.dart';
import 'package:expense_tracker/services/auth.dart';
import 'package:expense_tracker/services/user.dart';

class CollectInfo extends StatefulWidget {
  final UserClass intialData;
  @override
  CollectInfo({
    @required this.intialData,
  });
  _CollectInfoState createState() => _CollectInfoState();
}

class _CollectInfoState extends State<CollectInfo> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  String dexpense = "";

  String mexpense = "";

  String esavings = "";

  // final homeRef = FirebaseFirestore.instance.collection("user");

  // User user;

  // void updateDatabse(String dexpense, String mexpense, String esavings) async {
  //   await homeRef.doc(name).update(
  //       {"dexpense": dexpense, "mexpense": mexpense, "esavings": esavings});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff3282B8),
          elevation: 0.0, //removes dropshadow
          title: Text('Enter Details'),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 50.0),
              child: Form(
                key: _formkey,
                child: new Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('Your Full Name'),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                            hintText: ' John Smith',
                            hintStyle: TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Color(0xff3282B8).withOpacity(0.9),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text("How much do you expect to spend daily?"),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
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
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('How much is your estimated monthly expense?'),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
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
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('How much do you expect to save monthly?'),
                    Padding(
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
                          List passingData = [
                            widget.intialData.email,
                            nameController.text.trim(),
                            dexpense,
                            mexpense,
                            esavings
                          ];
                          Navigator.pop(context, passingData);
                        })
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
