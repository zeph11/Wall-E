import 'package:expense_tracker/screens/homepage/home.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class CashOut extends StatefulWidget {
  @override
  _CashOutState createState() => _CashOutState();
}

class _CashOutState extends State<CashOut> {
  String amt = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: true,
                backgroundColor: Colors.blue[400],
                elevation: 0.0, //removes dropshadow
                title: Text('Cash Out',
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
                                  labelText: 'Enter Amount',
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
                                  labelText: 'Enter Date',
                                ),
                                obscureText: true,
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
                                  labelText: 'Enter any Note',
                                ),
                                obscureText: true,
                                onChanged: (val) {
                                  setState(() => amt = val);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text('To:', style: TextStyle(color: Colors.black)),
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
                                                Icons.restaurant,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text('Eating Out '),
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
                                                Icons.book,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text('Education'),
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
                                                Icons.healing,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text('Health'),
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
                                                Icons.receipt,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text('Bills '),
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
                                                Icons.call,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text('Communication'),
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
                                                Icons.shopping_basket,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text('Groceries'),
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
                                              fillColor: Colors.teal[200],
                                              child: Icon(
                                                Icons.directions_bus,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text('Travel '),
                                            )
                                          ]),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RawMaterialButton(
                                              onPressed: () {},
                                              elevation: 2.0,
                                              fillColor: Colors.yellow[200],
                                              child: Icon(
                                                Icons.directions_run,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text('Sports'),
                                            )
                                          ]),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RawMaterialButton(
                                              onPressed: () {},
                                              elevation: 2.0,
                                              fillColor: Colors.deepPurple[300],
                                              child: Icon(
                                                Icons.devices,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text('Entertainment'),
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
                                              fillColor: Colors.amberAccent,
                                              child: Icon(
                                                Icons.home,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text('Household '),
                                            )
                                          ]),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RawMaterialButton(
                                              onPressed: () {},
                                              elevation: 2.0,
                                              fillColor: Colors.pink[200],
                                              child: Icon(
                                                Icons.card_giftcard,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text('Gifts'),
                                            )
                                          ]),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RawMaterialButton(
                                              onPressed: () {},
                                              elevation: 2.0,
                                              fillColor: Colors.purple[300],
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
                                labelText: 'Enter Amount',
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
                                labelText: 'Enter Date',
                              ),
                              obscureText: true,
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
                                labelText: 'Enter any Note',
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
