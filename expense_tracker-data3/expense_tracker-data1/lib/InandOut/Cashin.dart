import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/Authentication/Authentication.dart';
import 'package:expense_tracker/Models/cashinmodel.dart';
import 'package:expense_tracker/screens/homepage/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

// CashinModel currentUser;

final cashinRef = FirebaseFirestore.instance.collection("CashIn");

class CashIn extends StatefulWidget {
  final AuthBase auth;
  final UserClass inuserinfo;

  const CashIn({@required this.auth, @required this.inuserinfo});

  @override
  _CashInState createState() => _CashInState();
}

class _CashInState extends State<CashIn> {
  String amt;
  String finalDate = '';

  int salary = 0;
  int profit = 0;
  int investment = 0;
  int property = 0;
  int sale = 0;
  int others = 0;
  int oldsalary;

  // updateDatabase(int salary) {
  //   return StreamBuilder(
  //       stream: mainRef.doc(widget.inuserinfo.id).snapshots(),
  //       builder: (context, snapshot) {
  //         CashinModel userInfo = CashinModel.deserialize(snapshot.data);
  //           print('abc');
  //         oldsalary = userInfo.salary + salary;
  //         print('abc');
  //         print(oldsalary);
  //         return null;
  //       });
  // }

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
                title: Text('Cash In',
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
                                    color: Colors.white, fontSize: 17),
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
                            SizedBox(
                              height: 30.0,
                            ),
                            SizedBox(
                              height: 10.0,
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
                                              onPressed: () {
                                                salary = int.parse(amt);
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.orange[300],
                                              hoverColor: Colors.blue,
                                              child: Icon(
                                                Icons.local_atm,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text('Salary '),
                                            )
                                          ]),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RawMaterialButton(
                                              onPressed: () {
                                                profit = int.parse(amt);
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.green[300],
                                              child: Icon(
                                                Icons.trending_up,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text('Profit'),
                                            )
                                          ]),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RawMaterialButton(
                                              onPressed: () {
                                                investment = int.parse(amt);
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.red[300],
                                              child: Icon(
                                                Icons.bar_chart,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
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
                                              onPressed: () {
                                                property = int.parse(amt);
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.indigo[200],
                                              child: Icon(
                                                Icons.domain,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text('Property '),
                                            )
                                          ]),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RawMaterialButton(
                                              onPressed: () {
                                                sale = int.parse(amt);
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.cyan[200],
                                              child: Icon(
                                                Icons.local_offer,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text('Sale'),
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
                                              fillColor: Colors.blueGrey[300],
                                              child: Icon(
                                                Icons.more_horiz,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              padding: EdgeInsets.all(15.0),
                                              shape: CircleBorder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text('Others'),
                                            )
                                          ]),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 80,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: RawMaterialButton(
                                onPressed: () {
                                  // print(salary);
                                  // readDatabase();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DashBoard(
                                        auth: widget.auth,
                                        initialUser: widget.inuserinfo,
                                      ),
                                    ),
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
                          SizedBox(height: 90),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: RawMaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashBoard(
                                            auth: widget.auth,
                                            initialUser: widget.inuserinfo,
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
//  _Functiontoupdate() {
//     return StreamBuilder(
//         stream: cashinRef.doc(widget.inuserinfo.id).snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(child: CircularProgressIndicator());
//           }
//           CashinModel userInfo = CashinModel.deserialize(snapshot.data);
//           print(userInfo.investment);
//           print('kansdfnaqjdsngjandkjfmakdmfa');
//           return null;
//         });
//   }

//   updateDatabase() async {
//     //QuerySnapshot query = await cashinRef.doc('CashIn').get();
//     await cashinRef.doc("username").set({"data": "Project"});
//     //}
//   }
//   // createUserinfirebase(int salary, int profit, int investment, int property,
//   //     int sale, int others) async {
//   //   DocumentSnapshot doc = await cashinRef.doc(widget.inuserinfo.id).get();
//   //
//   //   await cashinRef.doc(widget.inuserinfo.id).set({
//   //     "salary": salary,
//   //     "profit": profit,
//   //     "investment": investment,
//   //     "property": property,
//   //     "sale": sale,
//   //     "others": others
//   //   });

//   //doc = await cashinRef.doc(widget.inuserinfo.id).get();
//   //   currentUser1 = CashinModel.deserialize(doc);
//   // }
