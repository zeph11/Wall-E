import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/Authentication/Authentication.dart';
import 'package:expense_tracker/InandOut/cashoutdebt.dart';
import 'package:expense_tracker/Models/cashoutmodel.dart';
import 'package:expense_tracker/Models/percentmodel.dart';
import 'package:expense_tracker/screens/homepage/dashboard.dart';
import 'package:expense_tracker/screens/homepage/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

final debtRef = FirebaseFirestore.instance.collection('debt');

class CashOut extends StatefulWidget {
  final AuthBase auth;
  final UserClass outuserinfo;

  const CashOut({@required this.auth, @required this.outuserinfo});
  @override
  _CashOutState createState() => _CashOutState();
}

class _CashOutState extends State<CashOut> {
  _buildDebtUIFuture() {
    return FutureBuilder(
        future: getDebtFuture(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data,
          );
        });
  }

  getDebtFuture() async {
    QuerySnapshot snapshot = await debtRef
        .doc(auth.currentUser.uid)
        .collection('debtid')
        .orderBy('timestamp', descending: true)
        .get();
    List<OutDebt> indebtItems = [];
    snapshot.docs.forEach((doc) {
      indebtItems.add(OutDebt.CustomModel(doc));
    });

    return indebtItems;
  }

  final _formkey = GlobalKey<FormState>();

  String amt = '';
  String finalDate = '';
  int eatingout = 0;
  int education = 0;
  int health = 0;
  int bills = 0;
  int communication = 0;
  int groceries = 0;
  int travel = 0;
  int sports = 0;
  int entertainment = 0;
  int household = 0;
  int gifts = 0;
  int others = 0;
  String cat = '';

  Future<void> updateSalary(
      String uid,
      int newEatingout,
      int newEducation,
      int newHealth,
      int newBills,
      int newCommunication,
      int newGroceries,
      int newTravel,
      int newSports,
      int newEntertainment,
      int newHousehold,
      int newGifts,
      int newOthers) async {
    FirebaseFirestore.instance.collection('CashOut').doc(uid).update({
      "eatingout": newEatingout,
      "education": newEducation,
      "health": newHealth,
      "bills": newBills,
      "communication": newCommunication,
      "groceries": newGroceries,
      "travel": newTravel,
      "sports": newSports,
      "entertainment": newEntertainment,
      "household": newHousehold,
      "gifts": newGifts,
      "others": newOthers,
    });
  }

  Future<void> updateDBValues() async {
    String id = FirebaseAuth.instance.currentUser.uid;
    DocumentSnapshot query =
        await FirebaseFirestore.instance.collection('CashOut').doc(id).get();
    CashoutModel newMod = CashoutModel.deserialize(query);
    int finalEatingout = newMod.eatingout + eatingout;
    int finalEducation = newMod.education + education;
    int finalHealth = newMod.health + health;
    int finalBills = newMod.bills + bills;
    int finalCommunication = newMod.communication + communication;
    int finalGroceries = newMod.groceries + groceries;
    int finalTravel = newMod.travel + travel;
    int finalSports = newMod.sports + sports;
    int finalEntertainment = newMod.entertainment + entertainment;
    int finalHousehold = newMod.household + household;
    int finalGifts = newMod.gifts + gifts;
    int finalOthers = newMod.others + others;

    updateSalary(
        id,
        finalEatingout,
        finalEducation,
        finalHealth,
        finalBills,
        finalCommunication,
        finalGroceries,
        finalTravel,
        finalSports,
        finalEntertainment,
        finalHousehold,
        finalGifts,
        finalOthers);
  }

  final historyRef = FirebaseFirestore.instance.collection("history");
  updateHistory(String email) async {
    String id = FirebaseAuth.instance.currentUser.uid;

    await historyRef
        .doc(id)
        .collection('historyid')
        .doc(DateTime.now().microsecond.toString())
        .set({
      "amount": amt,
      "category": cat,
      "date": finalDate,
      "timestamp": DateTime.now(),
    });
  }

  final percentRef = FirebaseFirestore.instance.collection("percent");
  // Future<void> setpercent(int amt) async {
  //   String id = FirebaseAuth.instance.currentUser.uid;
  //   print('4');
  //   await percentRef.doc(id).set({
  //     "amount": 0,
  //   });
  // }

  Future<void> addpercent(int amt) async {
    String id = FirebaseAuth.instance.currentUser.uid;

    DocumentSnapshot query =
        await FirebaseFirestore.instance.collection('percent').doc(id).get();

    PercentModel newm = PercentModel.deserialize(query);
    print(newm.amount);
    print(amt);
    int finalamt = newm.amount + amt;
    updatepercent(finalamt);
  }

  Future<void> updatepercent(int amt) async {
    String id = FirebaseAuth.instance.currentUser.uid;
    print('4');
    await percentRef.doc(id).update({
      "amount": amt,
      "timestamp": DateTime.now(),
      'date': finalDate,
    });
  }

  addamount() {}

  bool i1 = false;
  bool i2 = false;
  bool i3 = false;
  bool i4 = false;
  bool i5 = false;
  bool i6 = false;
  bool i7 = false;
  bool i8 = false;
  bool i9 = false;
  bool i10 = false;
  bool i11 = false;
  bool i12 = false;

  @override
  void initState() {
    //getCurrentDate()
    {
      var date = new DateTime.now().toString();
      var dateParse = DateTime.parse(date);
      var formattedDate =
          "${dateParse.day}-${dateParse.month}-${dateParse.year}";
      setState(() {
        finalDate = formattedDate.toString();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashBoard(
                          auth: widget.auth,
                          initialUser: widget.outuserinfo,
                        ),
                      ),
                    );
                  },
                ),
                backgroundColor: Color(0xff3282B8),
                elevation: 0.0, //removes dropshadow
                title: Text('Cash Out',
                    style: TextStyle(
                      fontSize: 27.0,
                    )),
                bottom: TabBar(
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white.withOpacity(0.4),
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
              //
              body: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 40.0,
                        horizontal: 50.0,
                      ), //removes away from edges
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 15.0,
                            ),
                            Text('Amount',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16)),
                            SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              width: 350,
                              height: 51,
                              //alignment: ,
                              child: TextFormField(
                                validator: (String value) {
                                  String sanitizedVal = value.trim();
                                  if (sanitizedVal.isEmpty) {
                                    return 'Amount  is required';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                  ),
                                  hintText: 'Enter Amount',
                                  prefixText: '    Rs. ',
                                  hintStyle: TextStyle(color: Colors.white38),
                                  filled: true,
                                  fillColor: Color(0xff3282B8).withOpacity(0.9),
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
                            Text('Date',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16)),
                            SizedBox(
                              height: 5.0,
                            ),
                            Container(
                                height: 51,
                                decoration: BoxDecoration(
                                  color: Color(0xff3282B8).withOpacity(0.9),
                                  borderRadius: BorderRadius.all(
                                    const Radius.circular(25),
                                  ),
                                ),
                                width: 350,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(28, 17, 17, 5),
                                  child: Text(
                                    " $finalDate",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                    //textAlign: TextAlign.center,
                                  ),
                                )),
                            /*SizedBox(
                              height: 30.0,
                            ),*/
                            /*Text('Notes',
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
                              ),*/

                            SizedBox(
                              height: 20.0,
                            ),
                            Text('To:',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16)),
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
                                              onPressed: () {
                                                cat = 'Eating Out';
                                                eatingout = int.parse(amt);
                                                setState(() {
                                                  i1 = !i1;
                                                });
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.orange[300],
                                              child: Icon(
                                                Icons.restaurant,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(
                                                side: BorderSide(
                                                    color: i1
                                                        ? Colors.blue
                                                        : Colors.transparent,
                                                    width: 2.2),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text('Eating Out '),
                                            )
                                          ]),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RawMaterialButton(
                                              onPressed: () {
                                                cat = 'Education';
                                                education = int.parse(amt);
                                                setState(() {
                                                  i2 = !i2;
                                                });
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.green[300],
                                              child: Icon(
                                                Icons.book,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(
                                                side: BorderSide(
                                                    color: i2
                                                        ? Colors.blue
                                                        : Colors.transparent,
                                                    width: 2.2),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text('Education'),
                                            )
                                          ]),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RawMaterialButton(
                                              onPressed: () {
                                                health = int.parse(amt);
                                                cat = 'Health';

                                                setState(() {
                                                  i3 = !i3;
                                                });
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.red[300],
                                              child: Icon(
                                                Icons.healing,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(
                                                side: BorderSide(
                                                    color: i3
                                                        ? Colors.blue
                                                        : Colors.transparent,
                                                    width: 2.2),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
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
                                              onPressed: () {
                                                bills = int.parse(amt);
                                                cat = 'Bills';
                                                setState(() {
                                                  i4 = !i4;
                                                });
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.indigo[200],
                                              child: Icon(
                                                Icons.receipt,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(
                                                side: BorderSide(
                                                    color: i4
                                                        ? Colors.blue
                                                        : Colors.transparent,
                                                    width: 2.2),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text('Bills '),
                                            )
                                          ]),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RawMaterialButton(
                                              onPressed: () {
                                                communication = int.parse(amt);
                                                cat = 'Communication';
                                                setState(() {
                                                  i5 = !i5;
                                                });
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.cyan[200],
                                              child: Icon(
                                                Icons.call,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(
                                                side: BorderSide(
                                                    color: i5
                                                        ? Colors.blue
                                                        : Colors.transparent,
                                                    width: 2.2),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text('Communication'),
                                            )
                                          ]),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RawMaterialButton(
                                              onPressed: () {
                                                groceries = int.parse(amt);
                                                cat = 'Groceries';
                                                setState(() {
                                                  i6 = !i6;
                                                });
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.blueGrey[300],
                                              child: Icon(
                                                Icons.shopping_basket,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(
                                                side: BorderSide(
                                                    color: i6
                                                        ? Colors.blue
                                                        : Colors.transparent,
                                                    width: 2.2),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
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
                                              onPressed: () {
                                                travel = int.parse(amt);
                                                cat = 'Travel';
                                                setState(() {
                                                  i7 = !i7;
                                                });
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.teal[200],
                                              child: Icon(
                                                Icons.directions_bus,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(
                                                side: BorderSide(
                                                    color: i7
                                                        ? Colors.blue
                                                        : Colors.transparent,
                                                    width: 2.2),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text('Travel '),
                                            )
                                          ]),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RawMaterialButton(
                                              onPressed: () {
                                                sports = int.parse(amt);
                                                cat = 'Sports';
                                                setState(() {
                                                  i8 = !i8;
                                                });
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.yellow[900],
                                              child: Icon(
                                                Icons.directions_run,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(
                                                side: BorderSide(
                                                    color: i8
                                                        ? Colors.blue
                                                        : Colors.transparent,
                                                    width: 2.2),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text('Sports'),
                                            )
                                          ]),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RawMaterialButton(
                                              onPressed: () {
                                                entertainment = int.parse(amt);
                                                cat = 'Entertainment';
                                                setState(() {
                                                  i9 = !i9;
                                                });
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.deepPurple[300],
                                              child: Icon(
                                                Icons.devices,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(
                                                side: BorderSide(
                                                    color: i9
                                                        ? Colors.blue
                                                        : Colors.transparent,
                                                    width: 2.2),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
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
                                              onPressed: () {
                                                household = int.parse(amt);
                                                cat = 'Household';
                                                setState(() {
                                                  i10 = !i10;
                                                });
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.amberAccent,
                                              child: Icon(
                                                Icons.home,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(
                                                side: BorderSide(
                                                    color: i10
                                                        ? Colors.blue
                                                        : Colors.transparent,
                                                    width: 2.2),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text('Household '),
                                            )
                                          ]),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RawMaterialButton(
                                              onPressed: () {
                                                gifts = int.parse(amt);
                                                cat = 'Gifts';
                                                setState(() {
                                                  i11 = !i11;
                                                });
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.pink[200],
                                              child: Icon(
                                                Icons.card_giftcard,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(
                                                side: BorderSide(
                                                    color: i11
                                                        ? Colors.blue
                                                        : Colors.transparent,
                                                    width: 2.2),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text('Gifts'),
                                            )
                                          ]),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RawMaterialButton(
                                              onPressed: () {
                                                others = int.parse(amt);
                                                cat = 'Expense Others';
                                                setState(() {
                                                  i12 = !i12;
                                                });
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.purple[200],
                                              splashColor: Colors.grey,
                                              child: Icon(
                                                Icons.more_horiz,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(
                                                side: BorderSide(
                                                    color: i12
                                                        ? Colors.blue
                                                        : Colors.transparent,
                                                    width: 2.2),
                                              ),
                                              hoverColor: Colors.red,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text('Others'),
                                            )
                                          ]),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: RawMaterialButton(
                                onPressed: () {
                                  if (_formkey.currentState.validate()) {
                                    if (cat == '') {
                                      Fluttertoast.showToast(
                                        msg: "Category not chosen",
                                        gravity: ToastGravity.BOTTOM,
                                        toastLength: Toast.LENGTH_LONG,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                      );
                                    } else {
                                      updateDBValues();
                                      updateHistory("abc");
                                      addpercent(int.parse(amt));
                                      if (true) {
                                        Fluttertoast.showToast(
                                          msg: "Transaction recorded",
                                          gravity: ToastGravity.CENTER,
                                          toastLength: Toast.LENGTH_SHORT,
                                          backgroundColor: Colors.blue,
                                          textColor: Colors.white,
                                        );
                                      }
                                      Navigator.pop(context, true);
                                    }
                                  }
                                },
                                elevation: 2.0,
                                fillColor: Colors.green[800],
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 34.0,
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
                      padding: EdgeInsets.fromLTRB(50, 30, 30, 30),
                      child: Form(
                        child: Column(children: <Widget>[
                          SizedBox(
                            height: 5.0,
                          ),
                          // Text('Amount', style: TextStyle(color: Colors.black)),

                          // Container(
                          //   width: 350,
                          //   //alignment: ,
                          //   child: TextField(
                          //     style:
                          //         TextStyle(color: Colors.white, fontSize: 17),
                          //     decoration: InputDecoration(
                          //       enabledBorder: OutlineInputBorder(
                          //         borderSide: BorderSide(color: Colors.white),
                          //         borderRadius: new BorderRadius.circular(25.0),
                          //       ),
                          //       hintText: 'Enter Amount',
                          //       prefixText: 'Rs. ',
                          //       hintStyle: TextStyle(color: Colors.white38),
                          //       filled: true,
                          //       fillColor: Color(0xff3282B8).withOpacity(0.9),
                          //     ),
                          //     keyboardType: TextInputType.number,
                          //     inputFormatters: <TextInputFormatter>[
                          //       FilteringTextInputFormatter.digitsOnly
                          //     ],
                          //     onChanged: (val) {
                          //       setState(() => amt = val);
                          //     },
                          //   ),
                          // ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Text('Date',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                color: Color(0xff3282B8).withOpacity(0.9),
                                borderRadius: BorderRadius.all(
                                  const Radius.circular(25),
                                ),
                              ),
                              width: 350,
                              height: 54,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(28, 17, 17, 5),
                                child: Text(
                                  " $finalDate",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                  //textAlign: TextAlign.center,
                                ),
                              )),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text('Debt To:',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                          SizedBox(height: 30),
                          Container(
                            height: MediaQuery.of(context).size.height / 1.9,
                            child: _buildDebtUIFuture(),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}

//floatingActionButtonLocation:
//     FloatingActionButtonLocation.endDocked,
// floatingActionButton: FloatingActionButton(
//   child: Icon(
//     Icons.check,
//     color: Colors.white,
//     size: 39.0,
//   ),
//   backgroundColor: Colors.green[800],
//   onPressed: () {
//     if (_formkey.currentState.validate()) {
//       if (cat == '') {
//         Fluttertoast.showToast(
//           msg: "Category not chosen",
//           gravity: ToastGravity.BOTTOM,
//           toastLength: Toast.LENGTH_LONG,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//         );
//       } else {
//         updateDBValues();
//         updateHistory("abc");
//         //setpercent(int.parse(amt));

//         addpercent(int.parse(amt));
//         if (true) {
//           Fluttertoast.showToast(
//             msg: "Transaction recorded",
//             gravity: ToastGravity.BOTTOM,
//             toastLength: Toast.LENGTH_SHORT,
//             backgroundColor: Colors.blue,
//             textColor: Colors.white,
//           );
//         }

//         Navigator.pop(context, true);
//       }
//     }
//   },
// ),


 // Container(
                          //   width: 350,
                          //   child: Column(
                          //     children: <Widget>[
                          //       Row(
                          //         //first row of icons
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Column(
                          //               mainAxisSize: MainAxisSize.min,
                          //               children: <Widget>[
                          //                 RawMaterialButton(
                          //                   onPressed: () {},
                          //                   elevation: 2.0,
                          //                   fillColor: Colors.orange[300],
                          //                   child: Icon(
                          //                     Icons.person_outline,
                          //                     color: Colors.white,
                          //                     size: 25.0,
                          //                   ),
                          //                   padding: EdgeInsets.all(15.0),
                          //                   shape: CircleBorder(),
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.all(10.0),
                          //                   child: Text('Person A'),
                          //                 )
                          //               ]),
                          //           Column(
                          //               mainAxisSize: MainAxisSize.min,
                          //               children: <Widget>[
                          //                 RawMaterialButton(
                          //                   onPressed: () {},
                          //                   elevation: 2.0,
                          //                   fillColor: Colors.green[300],
                          //                   child: Icon(
                          //                     Icons.person_outline,
                          //                     color: Colors.white,
                          //                     size: 25.0,
                          //                   ),
                          //                   padding: EdgeInsets.all(15.0),
                          //                   shape: CircleBorder(),
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.all(10.0),
                          //                   child: Text('Person B'),
                          //                 )
                          //               ]),
                          //           Column(
                          //               mainAxisSize: MainAxisSize.min,
                          //               children: <Widget>[
                          //                 RawMaterialButton(
                          //                   onPressed: () {},
                          //                   elevation: 2.0,
                          //                   fillColor: Colors.red[300],
                          //                   child: Icon(
                          //                     Icons.person_outline,
                          //                     color: Colors.white,
                          //                     size: 25.0,
                          //                   ),
                          //                   padding: EdgeInsets.all(15.0),
                          //                   shape: CircleBorder(),
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.all(10.0),
                          //                   child: Text('Person C'),
                          //                 )
                          //               ]),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: 15),
                          // Container(
                          //   width: 350,
                          //   child: Column(
                          //     children: <Widget>[
                          //       Row(
                          //         //second row of icons
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Column(
                          //               mainAxisSize: MainAxisSize.min,
                          //               children: <Widget>[
                          //                 RawMaterialButton(
                          //                   onPressed: () {},
                          //                   elevation: 2.0,
                          //                   fillColor: Colors.brown[300],
                          //                   child: Icon(
                          //                     Icons.person_outline,
                          //                     color: Colors.white,
                          //                     size: 25.0,
                          //                   ),
                          //                   padding: EdgeInsets.all(15.0),
                          //                   shape: CircleBorder(),
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.all(10.0),
                          //                   child: Text('Person D'),
                          //                 )
                          //               ]),
                          //           Column(
                          //               mainAxisSize: MainAxisSize.min,
                          //               children: <Widget>[
                          //                 RawMaterialButton(
                          //                   onPressed: () {},
                          //                   elevation: 2.0,
                          //                   fillColor: Colors.blue[300],
                          //                   child: Icon(
                          //                     Icons.person_outline,
                          //                     color: Colors.white,
                          //                     size: 25.0,
                          //                   ),
                          //                   padding: EdgeInsets.all(15.0),
                          //                   shape: CircleBorder(),
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.all(10.0),
                          //                   child: Text('Person E'),
                          //                 )
                          //               ]),
                          //           Column(
                          //               mainAxisSize: MainAxisSize.min,
                          //               children: <Widget>[
                          //                 RawMaterialButton(
                          //                   onPressed: () {},
                          //                   elevation: 2.0,
                          //                   fillColor: Colors.pink[300],
                          //                   child: Icon(
                          //                     Icons.person_outline,
                          //                     color: Colors.white,
                          //                     size: 25.0,
                          //                   ),
                          //                   padding: EdgeInsets.all(15.0),
                          //                   shape: CircleBorder(),
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.all(10.0),
                          //                   child: Text('Person F'),
                          //                 )
                          //               ]),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // // ),
                          // SizedBox(height: 100),
                          // Container(
                          //   alignment: Alignment.bottomRight,
                          //   child: RawMaterialButton(
                          //     onPressed: () {
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => DashBoard(
                          //                   auth: widget.auth,
                          //                   initialUser: widget.outuserinfo,
                          //                 )),
                          //       );
                          //     },
                          //     elevation: 2.0,
                          //     fillColor: Colors.green[800],
                          //     child: Icon(
                          //       Icons.check,
                          //       color: Colors.white,
                          //       size: 39.0,
                          //     ),
                          //     padding: EdgeInsets.all(15.0),
                          //     shape: CircleBorder(),
                          //   ),
                          // )