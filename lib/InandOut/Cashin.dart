import 'package:expense_tracker/screens/homepage/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CashIn extends StatefulWidget {
  @override
  _CashInState createState() => _CashInState();
}

class _CashInState extends State<CashIn> {
  String amt;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue[400],
                elevation: 0.0, //removes dropshadow
                title: Text('Cash In',
                    style: TextStyle(
                      fontSize: 27.0,
                    )),
                bottom: TabBar(
                  tabs: [
                    Tab(
                      text: "Cash",
                    ),
                    Tab(
                      text: "Debt",
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 40.0,
                        horizontal: 50.0,
                      ), //removes away from edges
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 30.0,
                            ),
                            Text('Amount',
                                style: TextStyle(color: Colors.black)),
                            Container(
                              width: 350,
                              //alignment: ,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                  ),
                                  hintText: 'Enter Amount',
                                  prefixText: 'Rs. ',
                                  filled: true,
                                  fillColor: Colors.blue[200],
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onChanged: (val) {
                                  setState(() => amt = val);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Text('Date', style: TextStyle(color: Colors.black)),
                            Container(
                              width: 350,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.0)),
                                  filled: true,
                                  fillColor: Colors.blue[200],
                                  hintText: 'Enter Date',
                                ),
                                onChanged: (val) {
                                  setState(() => amt = val);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Text('Notes',
                                style: TextStyle(color: Colors.black)),
                            Container(
                              width: 350,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.0)),
                                  filled: true,
                                  fillColor: Colors.blue[200],
                                  hintText: 'Enter any Note',
                                ),
                                onChanged: (val) {
                                  setState(() => amt = val);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text('From:',
                                style: TextStyle(color: Colors.black)),
                            SizedBox(height: 15),
                            Container(
                              width: 350,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    //first row of icons
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RawMaterialButton(
                                              onPressed: () {},
                                              elevation: 2.0,
                                              fillColor: Colors.orange[300],
                                              child: Icon(
                                                Icons.local_atm,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text('Salary '),
                                            )
                                          ]),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RawMaterialButton(
                                              onPressed: () {},
                                              elevation: 2.0,
                                              fillColor: Colors.green[300],
                                              child: Icon(
                                                Icons.trending_up,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text('Profit'),
                                            )
                                          ]),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RawMaterialButton(
                                              onPressed: () {},
                                              elevation: 2.0,
                                              fillColor: Colors.red[300],
                                              child: Icon(
                                                Icons.bar_chart,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text('Investment'),
                                            )
                                          ]),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RawMaterialButton(
                                              onPressed: () {},
                                              elevation: 2.0,
                                              fillColor: Colors.indigo[200],
                                              child: Icon(
                                                Icons.domain,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text('Property '),
                                            )
                                          ]),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RawMaterialButton(
                                              onPressed: () {},
                                              elevation: 2.0,
                                              fillColor: Colors.cyan[200],
                                              child: Icon(
                                                Icons.local_offer,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text('Sale'),
                                            )
                                          ]),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RawMaterialButton(
                                              onPressed: () {},
                                              elevation: 2.0,
                                              fillColor: Colors.blueGrey[300],
                                              child: Icon(
                                                Icons.more_horiz,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text('Others'),
                                            )
                                          ]),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: RawMaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DashBoard()),
                                  );
                                },
                                elevation: 2.0,
                                fillColor: Colors.green[800],
                                child: Icon(
                                  Icons.check,
                                  size: 39.0,
                                ),
                                padding: EdgeInsets.all(15.0),
                                shape: CircleBorder(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 40.0,
                        horizontal: 50.0,
                      ), //removes away from edges
                      child: Form(
                        child: Column(children: <Widget>[
                          SizedBox(
                            height: 20.0,
                          ),
                          Text('Amount', style: TextStyle(color: Colors.black)),
                          Container(
                            width: 350,
                            //alignment: ,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                ),
                                hintText: 'Enter Amount',
                                prefixText: 'Rs. ',
                                filled: true,
                                fillColor: Colors.blue[200],
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (val) {
                                setState(() => amt = val);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text('Date', style: TextStyle(color: Colors.black)),
                          Container(
                            width: 350,
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0)),
                                filled: true,
                                fillColor: Colors.blue[200],
                                hintText: 'Enter Date',
                              ),
                              onChanged: (val) {
                                setState(() => amt = val);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text('Notes', style: TextStyle(color: Colors.black)),
                          Container(
                            width: 350,
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0)),
                                filled: true,
                                fillColor: Colors.blue[200],
                                hintText: 'Enter any Note',
                              ),
                              onChanged: (val) {
                                setState(() => amt = val);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text('From:', style: TextStyle(color: Colors.black)),
                          SizedBox(height: 15),
                          Container(
                            width: 350,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  //first row of icons
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          RawMaterialButton(
                                            onPressed: () {},
                                            elevation: 2.0,
                                            fillColor: Colors.orange[300],
                                            child: Icon(
                                              Icons.person_outline,
                                              size: 25.0,
                                            ),
                                            padding: EdgeInsets.all(15.0),
                                            shape: CircleBorder(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text('Person A'),
                                          )
                                        ]),
                                    Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          RawMaterialButton(
                                            onPressed: () {},
                                            elevation: 2.0,
                                            fillColor: Colors.green[300],
                                            child: Icon(
                                              Icons.person_outline,
                                              size: 25.0,
                                            ),
                                            padding: EdgeInsets.all(15.0),
                                            shape: CircleBorder(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text('Person B'),
                                          )
                                        ]),
                                    Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          RawMaterialButton(
                                            onPressed: () {},
                                            elevation: 2.0,
                                            fillColor: Colors.red[300],
                                            child: Icon(
                                              Icons.person_outline,
                                              size: 25.0,
                                            ),
                                            padding: EdgeInsets.all(15.0),
                                            shape: CircleBorder(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text('Person C'),
                                          )
                                        ]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 65),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: RawMaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashBoard()),
                                );
                              },
                              elevation: 2.0,
                              fillColor: Colors.green[700],
                              child: Icon(
                                Icons.check,
                                size: 39.0,
                              ),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
