import 'package:expense_tracker/InandOut/Cashin.dart';
import 'package:expense_tracker/InandOut/Cashout.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  String finalDate = '';

  getCurrentDate() {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    setState(() {
      finalDate = formattedDate.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[400],
        elevation: 0.0, //removes dropshadow
        title: Text('Dashboard',
            style: TextStyle(
              fontSize: 27.0,
            )),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12.0),

        // ignore: deprecated_member_use
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.green[600],
                padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.white)),
                child: Text(
                  'Cash In',
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CashIn()),
                  );
                  //if (_formkey.currentState.validate()) {
                },
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.red[700],
                padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.white)),
                child: Text(
                  'CashOut',
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CashOut()),
                  );
                  //if (_formkey.currentState.validate()) {
                },
              ),
            ],
          ),
        ),
        /*RaisedButton(
          onPressed: () {},
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('Fixed Button'),
        ),*/
      ),
      body: SingleChildScrollView(
        child: Container(
          //yo purra page ko container
          child: Column(
            //block block ma chutaune column
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Today's Date = $finalDate",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  )),
              SizedBox(height: 15),
              Container(
                // yo first block ko container
                alignment: Alignment.center,
                height: 95,
                width: 300,
                padding: EdgeInsets.symmetric(vertical: 10),
                color: Colors.blue[100],
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Available Balance:',
                      style: TextStyle(fontSize: 33.0, color: Colors.blue[800]),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '34000',
                      style: TextStyle(fontSize: 33.0, color: Colors.blue[800]),
                    ),
                  ],
                ),
              ), //container1
              SizedBox(
                height: 15,
              ),
              Container(
                  //second batta ko container
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      //income container
                      alignment: Alignment.bottomLeft,
                      color: Colors.green[100],
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Income',
                            style: TextStyle(
                                fontSize: 30.0, color: Colors.green[800]),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '340000',
                            style: TextStyle(
                                fontSize: 30.0, color: Colors.green[800]),
                          ),
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      //expense container
                      alignment: Alignment.bottomLeft,
                      color: Colors.red[100],
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Expense',
                            style: TextStyle(
                                fontSize: 30.0, color: Colors.red[800]),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '3400',
                            style: TextStyle(
                                fontSize: 30.0, color: Colors.red[800]),
                          ),
                        ],
                      )),
                ],
              )), //container2
              SizedBox(height: 40),
              Container(
                  color: Colors.grey[00],
                  child: Column(
                    children: [
                      Text(
                        'Recent History',
                        style: TextStyle(fontSize: 25.0, color: Colors.black),
                      ),
                      Divider(
                        color: Colors.black,
                      )
                    ],
                  )),

              //data tablee

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
