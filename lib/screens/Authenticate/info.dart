import 'package:flutter/material.dart';

class CollectInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 50.0),
            child: Form(
                child: Column(
              children: <Widget>[
                Text("Your expected Income:"),
                SizedBox(
                  height: 30.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Expected INcome',
                  ),
                  //onChanged: ,
                )
              ],
            ))));
  }
}
