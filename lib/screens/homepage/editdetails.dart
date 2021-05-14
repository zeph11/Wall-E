import 'package:expense_tracker/screens/homepage/profile.dart';
import 'package:flutter/material.dart';

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
          backgroundColor: Colors.blue[400],
          elevation: 0.0, //removes dropshadow
          title: Text('Edit your Details'),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 50.0),
            child: Form(
                child: new Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(" Change Name",
                    style: TextStyle(
                      fontSize: 17.0,
                    )),
                SizedBox(
                  height: 10.0,
                ),
                new Flexible(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0)),
                          labelText: ' New  Name',
                          filled: true,
                          fillColor: Colors.blue[100],
                        ),
                        onChanged: (val) {
                          //setState(() => name = val);
                        },
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Change Password',
                    style: TextStyle(
                      fontSize: 17.0,
                    )),
                new Flexible(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0)),
                          labelText: 'New Password ',
                          filled: true,
                          fillColor: Colors.blue[100],
                        ),
                        onChanged: (val) {
                          //setState(() => name = val);
                        },
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Change  Expected Monthly Expenditure',
                    style: TextStyle(
                      fontSize: 17.0,
                    )),
                new Flexible(
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: new TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0)),
                          labelText: ' New Expected Expenditure',
                          filled: true,
                          fillColor: Colors.blue[100],
                        ),
                        onChanged: (val) {
                          //setState(() => name = val);
                        },
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Change  Expected Monthly Saving',
                    style: TextStyle(
                      fontSize: 17.0,
                    )),
                new Flexible(
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: new TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0)),
                          labelText: ' New Expected Savings',
                          filled: true,
                          fillColor: Colors.blue[100],
                        ),
                        onChanged: (val) {
                          //setState(() => name = val);
                        },
                      )),
                ),
                SizedBox(height: 40.0),
                // ignore: deprecated_member_use
                RaisedButton(
                    color: Colors.blue[600],
                    padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.red)),
                    child: Text(
                      'Done',
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
