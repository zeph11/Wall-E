import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          elevation: 0.0, //removes dropshadow
          title: Text('Profile'),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(
              vertical: 180.0,
              horizontal: 50.0,
            ), //removes away from edges
            child: Form(
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('About you'),
                    Text('Edit'),
                  ],
                )
                //name
                //email
                //username
              ]),
            )));
  }
}
