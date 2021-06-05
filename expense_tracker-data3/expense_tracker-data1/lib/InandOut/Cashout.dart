import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/Authentication/Authentication.dart';
import 'package:expense_tracker/Models/cashoutmodel.dart';
import 'package:expense_tracker/screens/homepage/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CashOut extends StatefulWidget {
  final AuthBase auth;
  final UserClass outuserinfo;

  const CashOut({@required this.auth, @required this.outuserinfo});
  @override
  _CashOutState createState() => _CashOutState();
}

class _CashOutState extends State<CashOut> {
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
    print("Debung point 1");
    String id = FirebaseAuth.instance.currentUser.uid;
    print(id);
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

  Color color1 = Colors.white;
  Color color2 = Colors.black;

  void _changeColor() {
    setState(() {
      color1 = Colors.black;
      color2 = Colors.white;
    });
  }

  bool pressed = true;
  bool iconpressed = true;

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
                automaticallyImplyLeading: true,
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
                              height: 15.0,
                            ),
                            Text('Amount',
                                style: TextStyle(color: Colors.black)),
                            SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              width: 350,
                              //alignment: ,
                              child: TextField(
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                  ),
                                  hintText: 'Enter Amount',
                                  prefixText: 'Rs. ',
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
                            Text('Date', style: TextStyle(color: Colors.black)),
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
                                              fillColor: pressed
                                                  ? Colors.orange[300]
                                                  : Color(0xff3282B8),
                                              onPressed: () {
                                                eatingout = int.parse(amt);
                                                setState(
                                                    () => pressed = !pressed);
                                                _changeColor();
                                              },
                                              elevation: 2.0,
                                              //fillColor: Colors.orange[300],
                                              child: Icon(
                                                Icons.restaurant,
                                                color: iconpressed
                                                    ? color1
                                                    : color2,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
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
                                                education = int.parse(amt);
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.green[300],
                                              child: Icon(
                                                Icons.book,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
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
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.red[300],
                                              child: Icon(
                                                Icons.healing,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
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
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.indigo[200],
                                              child: Icon(
                                                Icons.receipt,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
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
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.cyan[200],
                                              child: Icon(
                                                Icons.call,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
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
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.blueGrey[300],
                                              child: Icon(
                                                Icons.shopping_basket,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
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
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.teal[200],
                                              child: Icon(
                                                Icons.directions_bus,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
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
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.yellow[900],
                                              child: Icon(
                                                Icons.directions_run,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
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
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.deepPurple[300],
                                              child: Icon(
                                                Icons.devices,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
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
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.amberAccent,
                                              child: Icon(
                                                Icons.home,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
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
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.pink[200],
                                              child: Icon(
                                                Icons.card_giftcard,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
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
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.purple[200],
                                              splashColor: Colors.grey,
                                              child: Icon(
                                                Icons.more_horiz,
                                                color: color1,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
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
                                  updateDBValues();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DashBoard(
                                              auth: widget.auth,
                                              initialUser: widget.outuserinfo,
                                            )),
                                  );
                                },
                                elevation: 2.0,
                                fillColor: Colors.green[800],
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
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
                            height: 15.0,
                          ),
                          Text('Amount', style: TextStyle(color: Colors.black)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            width: 350,
                            //alignment: ,
                            child: TextField(
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.0),
                                ),
                                hintText: 'Enter Amount',
                                prefixText: 'Rs. ',
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
                          Text('Date', style: TextStyle(color: Colors.black)),
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
                                              color: Colors.white,
                                              size: 25.0,
                                            ),
                                            padding: EdgeInsets.all(15.0),
                                            shape: CircleBorder(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
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
                                              color: Colors.white,
                                              size: 25.0,
                                            ),
                                            padding: EdgeInsets.all(15.0),
                                            shape: CircleBorder(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
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
                                              color: Colors.white,
                                              size: 25.0,
                                            ),
                                            padding: EdgeInsets.all(15.0),
                                            shape: CircleBorder(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text('Person C'),
                                          )
                                        ]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: 350,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  //second row of icons
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          RawMaterialButton(
                                            onPressed: () {},
                                            elevation: 2.0,
                                            fillColor: Colors.brown[300],
                                            child: Icon(
                                              Icons.person_outline,
                                              color: Colors.white,
                                              size: 25.0,
                                            ),
                                            padding: EdgeInsets.all(15.0),
                                            shape: CircleBorder(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text('Person D'),
                                          )
                                        ]),
                                    Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          RawMaterialButton(
                                            onPressed: () {},
                                            elevation: 2.0,
                                            fillColor: Colors.blue[300],
                                            child: Icon(
                                              Icons.person_outline,
                                              color: Colors.white,
                                              size: 25.0,
                                            ),
                                            padding: EdgeInsets.all(15.0),
                                            shape: CircleBorder(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text('Person E'),
                                          )
                                        ]),
                                    Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          RawMaterialButton(
                                            onPressed: () {},
                                            elevation: 2.0,
                                            fillColor: Colors.pink[300],
                                            child: Icon(
                                              Icons.person_outline,
                                              color: Colors.white,
                                              size: 25.0,
                                            ),
                                            padding: EdgeInsets.all(15.0),
                                            shape: CircleBorder(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text('Person F'),
                                          )
                                        ]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 100),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: RawMaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashBoard(
                                            auth: widget.auth,
                                            initialUser: widget.outuserinfo,
                                          )),
                                );
                              },
                              elevation: 2.0,
                              fillColor: Colors.green[800],
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
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
