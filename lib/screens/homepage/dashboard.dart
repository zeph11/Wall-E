import 'package:expense_tracker/InandOut/Cashin.dart';
import 'package:expense_tracker/InandOut/Cashout.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //yo purra page ko container
        child: Column(
          //block block ma chutaune column
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text('Todays\'s date:',
                  style: TextStyle(
                    fontSize: 20.0,
                  )),
            ),
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
                          style:
                              TextStyle(fontSize: 30.0, color: Colors.red[800]),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '3400',
                          style:
                              TextStyle(fontSize: 30.0, color: Colors.red[800]),
                        ),
                      ],
                    )),
              ],
            )), //container2
            SizedBox(height: 40),
            Container(
              color: Colors.grey[300],
              /*child: Text(
                'Recent History',
                style: TextStyle(fontSize: 25.0, color: Colors.black),*/
              child: Table(
                defaultColumnWidth: FixedColumnWidth(120.0),
                border: TableBorder.all(
                    color: Colors.black, style: BorderStyle.solid, width: 2),
                children: [
                  TableRow(children: [
                    Column(children: [
                      Text('Icon', style: TextStyle(fontSize: 30.0))
                    ]),
                    Column(children: [
                      Text('Category', style: TextStyle(fontSize: 30.0))
                    ]),
                    Column(children: [
                      Text('Amount', style: TextStyle(fontSize: 30.0))
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [Text('Javatpoint')]),
                    Column(children: [Text('Flutter')]),
                    Column(children: [Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [Text('Javatpoint')]),
                    Column(children: [Text('MySQL')]),
                    Column(children: [Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [Text('Javatpoint')]),
                    Column(children: [Text('ReactJS')]),
                    Column(children: [Text('5*')]),
                  ]),
                ],
              ),
            ),

            //data tablee

            SizedBox(height: 40),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ignore: deprecated_member_use
                  RaisedButton(
                    color: Colors.green[600],
                    padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.red)),
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
                    padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.red)),
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
            )
          ],
        ),
      ),
    );
  }
}
