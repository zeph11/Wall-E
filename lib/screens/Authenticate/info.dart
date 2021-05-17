import 'package:expense_tracker/screens/Authenticate/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                Text("How much do you expect to spend daily?"),
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
                          hintText: 'Daily Expense',
                          filled: true,
                          fillColor: Colors.blue[400],
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (val) {
                          //setState(() => name = val);
                        },
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('How much do you think your monthy expense will be?'),
                new Flexible(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              //borderSide: new BorderSide(color: Colors.teal),
                              borderRadius: new BorderRadius.circular(25.0)),
                          hintText: 'Monthly Expenditure',
                          filled: true,
                          fillColor: Colors.blue[400],
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (val) {
                          //setState(() => name = val);
                        },
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('HOw much would you expect to save monthly?'),
                new Flexible(
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: new TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0)),
                          hintText: 'Expected Savings',
                          filled: true,
                          fillColor: Colors.blue[400],
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
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
                        side: BorderSide(color: Colors.white)),
                    child: Text(
                      'Done',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
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
