import 'package:expense_tracker/Authentication/Authentication.dart';
import 'package:expense_tracker/screens/homepage/dashboard.dart';
import 'package:expense_tracker/screens/homepage/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailsPage extends StatefulWidget {
  final AuthBase auth;
  final UserClass editdeatils;

  const DetailsPage({this.auth, this.editdeatils});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String nname = '';
  String ndexpense = '';
  String nmexpense = '';
  String nsavings = '';
  final _formkey = GlobalKey<FormState>();

//upadteDatabase
  Future _updateDatabse(
    String nname,
    String ndexpense,
    String nmexpense,
    String nsavings,
  ) async {
    await mainRef.doc(widget.editdeatils.id).update({
      'name': nname,
      'dexpense': ndexpense,
      'mexpense': nmexpense,
      'esavings': nsavings
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff3282B8),
          elevation: 0.0, //removes dropshadow
          title: Text('Edit details'),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 50.0),
              child: Form(
                  key: _formkey,
                  child: new Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Change name',
                          style: TextStyle(color: Colors.black)),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        width: 350,
                        //alignment: ,
                        child: TextFormField(
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'This field is Empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                            hintText: 'Enter new name',
                            hintStyle: TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Color(0xff3282B8).withOpacity(0.9),
                          ),
                          onChanged: (val) {
                            setState(() => nname = val);
                          },
                        ),
                      ),

                      SizedBox(
                        height: 20.0,
                      ),

                      Text('Change expected daily expenditure',
                          style: TextStyle(color: Colors.black)),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        width: 350,
                        //alignment: ,
                        child: TextFormField(
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'This field is Empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                            hintText: 'Enter new expected daily expenditure',
                            hintStyle: TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Color(0xff3282B8).withOpacity(0.9),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (val) {
                            setState(() => ndexpense = val);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),

                      Text('Change expected monthly expenditure',
                          style: TextStyle(color: Colors.black)),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        width: 350,
                        //alignment: ,
                        child: TextFormField(
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'This field is Empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                            hintText: 'Enter new expected monthly expenditure',
                            hintStyle: TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Color(0xff3282B8).withOpacity(0.9),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (val) {
                            setState(() => nmexpense = val);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text('Change expected monthly saving',
                          style: TextStyle(color: Colors.black)),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        width: 350,
                        //alignment: ,
                        child: TextFormField(
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'This field is Empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                            hintText: 'Enter new expected savings',
                            hintStyle: TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Color(0xff3282B8).withOpacity(0.9),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (val) {
                            setState(() => nsavings = val);
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
                            'DONE',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if (_formkey.currentState.validate()) {
                              _updateDatabse(
                                  nname, ndexpense, nmexpense, nsavings);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage(
                                            auth: widget.auth,
                                            userInformation: widget.editdeatils,
                                          )));
                            }
                          })
                    ],
                  ))),
        ));
  }
}
