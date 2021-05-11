import 'package:flutter/material.dart';

class CollectInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          elevation: 0.0, //removes dropshadow
          title: Text('Your Details'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 50.0),
          child: Form(
            child: new Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Enter your Expected Monthly Income"),
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
                          labelText: 'Expected Income',
                          filled: true,
                          fillColor: Colors.blue[400],
                        ),
                        onChanged: (val) {
                          //setState(() => name = val);
                        },
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Enter your Expected Monthy Expenditure'),
                new Flexible(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0)),
                          labelText: 'Expected Expenditure',
                          filled: true,
                          fillColor: Colors.blue[400],
                        ),
                        onChanged: (val) {
                          //setState(() => name = val);
                        },
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('What percent of total Income would you love to save?'),
                new Flexible(
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: new TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0)),
                          labelText: 'Expected Savings',
                          filled: true,
                          fillColor: Colors.blue[400],
                        ),
                        onChanged: (val) {
                          //setState(() => name = val);
                        },
                      )),
                ),
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
