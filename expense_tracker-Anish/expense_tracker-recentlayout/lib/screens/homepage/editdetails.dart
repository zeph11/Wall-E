import 'package:expense_tracker/screens/homepage/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff3282B8),
          elevation: 0.0, //removes dropshadow
          title: Text('Edit details'),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 50.0),
            child: Form(
                child: new Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Change name', style: TextStyle(color: Colors.black)),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: 350,
                  //alignment: ,
                  child: TextField(
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
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (val) {
                      //setState(() => amt = val);
                    },
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),
                Text('Change password', style: TextStyle(color: Colors.black)),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: 350,
                  //alignment: ,
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      hintText: 'Enter new password',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff3282B8).withOpacity(0.9),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (val) {
                      //setState(() => amt = val);
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
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      hintText: 'Enter new expected expenditure',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff3282B8).withOpacity(0.9),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (val) {
                      //setState(() => amt = val);
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
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      hintText: 'Enter new expected expenditure',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xff3282B8).withOpacity(0.9),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (val) {
                      //setState(() => amt = val);
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
                  child: TextField(
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
                      //setState(() => amt = val);
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    })
              ],
            ))));
  }
}
