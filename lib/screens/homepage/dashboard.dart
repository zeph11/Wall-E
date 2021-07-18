import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/Authentication/Authentication.dart';
import 'package:expense_tracker/InandOut/Cashin.dart';
import 'package:expense_tracker/InandOut/Cashout.dart';
import 'package:expense_tracker/Models/UserMOdel.dart';
import 'package:expense_tracker/Models/cashinmodel.dart';
import 'package:expense_tracker/Models/cashoutmodel.dart';
import 'package:expense_tracker/Models/historymodel.dart';
import 'package:expense_tracker/Models/percentmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../History.dart';
import 'home.dart';

UserModel currentUser;
CashinModel currentUser1;
CashoutModel currentUser2;
HistoryModel currentUser3;

FirebaseAuth auth = FirebaseAuth.instance;

final mainRef = FirebaseFirestore.instance.collection('user');
final historyRef = FirebaseFirestore.instance.collection('history');
final cashInRerf = FirebaseFirestore.instance.collection('CashIn');
final cashOutRef = FirebaseFirestore.instance.collection('CashOut');

class DashBoardPage extends StatefulWidget {
  final AuthBase auth;
  final UserClass dashuserInformation;

  const DashBoardPage(
      {@required this.auth, @required this.dashuserInformation});
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  String finalDate = '';

  void displayavailable() async {
    String id = FirebaseAuth.instance.currentUser.uid;
    DocumentSnapshot query =
        await FirebaseFirestore.instance.collection('CashIn').doc(id).get();
    CashinModel newMod = CashinModel.deserialize(query);
    DocumentSnapshot query2 =
        await FirebaseFirestore.instance.collection('CashOut').doc(id).get();
    CashoutModel neww = CashoutModel.deserialize(query2);
    int available = newMod.totalincome - neww.totalexpense;

    updateava(id, available);
  }

  void updateava(String id, int available) async {
    FirebaseFirestore.instance.collection('CashIn').doc(id).update({
      'available': available,
    });
  }

  Stream<List<HistoryModel>> getHistory() {
    final snapshots = historyRef
        .doc(auth.currentUser.uid)
        .collection('historyid')
        .orderBy('timestamp', descending: true)
        .snapshots();

    return snapshots.map((event) => event.docs
        .map((snapshot) => HistoryModel.deserialize(snapshot))
        .toList());
  }

  void displayincome() async {
    String id = FirebaseAuth.instance.currentUser.uid;
    DocumentSnapshot query =
        await FirebaseFirestore.instance.collection('CashIn').doc(id).get();
    CashinModel newMod = CashinModel.deserialize(query);
    int totalincome = newMod.salary +
        newMod.profit +
        newMod.investment +
        newMod.property +
        newMod.sale +
        newMod.others;
    updatein(id, totalincome);
  }

  void updatein(String id, int totalincome) async {
    FirebaseFirestore.instance.collection('CashIn').doc(id).update({
      'totalincome': totalincome,
    });
  }

  void displayexpense() async {
    String id = FirebaseAuth.instance.currentUser.uid;

    DocumentSnapshot query2 =
        await FirebaseFirestore.instance.collection('CashOut').doc(id).get();
    CashoutModel neww = CashoutModel.deserialize(query2);
    int totalexpense = neww.eatingout +
        neww.education +
        neww.health +
        neww.bills +
        neww.communication +
        neww.groceries +
        neww.travel +
        neww.sports +
        neww.entertainment +
        neww.household +
        neww.gifts +
        neww.others;
    updateout(id, totalexpense);
  }

  void updateout(String id, int totalexpense) async {
    FirebaseFirestore.instance.collection('CashOut').doc(id).update({
      'totalexpense': totalexpense,
    });
  }

  void checkpercent() async {
    String id = FirebaseAuth.instance.currentUser.uid;

    DocumentSnapshot query2 =
        await FirebaseFirestore.instance.collection('percent').doc(id).get();
    PercentModel neww = PercentModel.deserialize(query2);
    print(neww.date);
    print(finalDate);
    if (neww.date != finalDate) {
      print('contition not equal to ');

      await percentRef.doc(id).update({
        "amount": 0,
        "timestamp": DateTime.now(),
        'date': finalDate,
      });
    }
  }

  @override
  void initState() {
    displayexpense();
    displayincome();
    displayavailable();
    checkpercent();

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
    setState(() {});

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3282B8),
        elevation: 0.0, //removes dropshadow
        title: Text('Dashboard',
            style: TextStyle(
              fontSize: 27.0,
            )),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => super.widget));
            },
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 1),
        // ignore: deprecated_member_use
        child: Container(
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.green[900],
                padding: EdgeInsets.fromLTRB(35, 15, 35, 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  //side: BorderSide(color: Colors.white),
                ),
                child: Text(
                  ' CASH IN  ',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                onPressed: () async {
                  final refresh = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CashIn(
                              auth: widget.auth,
                              inuserinfo: widget.dashuserInformation,
                            )),
                  );
                  if (refresh) {
                    if (mounted) {
                      setState(() {});
                    }
                  }
                },
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                color: Color(0xffB30000),
                padding: EdgeInsets.fromLTRB(35, 15, 35, 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  // side: BorderSide(color: Colors.white),
                ),
                child: Text(
                  'CASH OUT',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                onPressed: () async {
                  final refresh = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CashOut(
                                auth: widget.auth,
                                outuserinfo: widget.dashuserInformation,
                              )));
                  if (refresh) {
                    if (mounted) {
                      setState(() {});
                    }
                  }
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => CashOut(
                  //             auth: widget.auth,
                  //             outuserinfo: widget.dashuserInformation,
                  //           ));

                  // );
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          //yo purra page ko container
          child: Column(
            //block block ma chutaune column
            children: [
              SizedBox(
                height: 10.0,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 1, vertical: 3),

                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.all(
                    const Radius.circular(20),
                  ),
                ),
                // yo first block ko container

                alignment: Alignment.center,
                height: 69,
                width: 350,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: _displayavailable(),
              ), //container1
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      const Radius.circular(25.0),
                    ),
                  ),
                  //second batta ko container
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.all(
                              const Radius.circular(20),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 12,
                          ),

                          //income container
                          alignment: Alignment.bottomLeft,
                          child: _displayincome()),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.all(
                              const Radius.circular(20),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 12,
                          ),
                          //expense container
                          alignment: Alignment.bottomLeft,
                          child: _displayexpense()),
                    ],
                  )), //container2
              SizedBox(height: 10),
              Container(
                  alignment: Alignment.center,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.yellow[100],
                    borderRadius: BorderRadius.all(
                      const Radius.circular(4000),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: _displaypercent()
                  // Text(
                  //   'You have spent 101% of your daily expected expense.',
                  //   style: TextStyle(fontSize: 16),
                  // ),
                  ),
              SizedBox(height: 25),

              Container(
                  color: Colors.grey[00],
                  child: Column(
                    children: [
                      Text(
                        'Recent History',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ],
                  )),

              SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height / 2.1,
                child: _buildHistoryUIFuture(),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildHistoryUIFuture() {
    return FutureBuilder(
        future: getHistoryFuture(),
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

  getHistoryFuture() async {
    QuerySnapshot snapshot = await historyRef
        .doc(auth.currentUser.uid)
        .collection('historyid')
        .orderBy('timestamp', descending: true)
        .get();
    List<history> historyItems = [];
    snapshot.docs.forEach((doc) {
      historyItems.add(history.CustomModel(doc));
    });

    return historyItems;
  }

  _displayavailable() {
    return StreamBuilder(
        stream: cashinRef.doc(widget.dashuserInformation.id).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          CashinModel newMod = CashinModel.deserialize(snapshot.data);

          return Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 0,
                ),
                child: Text(
                  'Available Balance',
                  style: TextStyle(fontSize: 24.0, color: Colors.blue[800]),
                ),
              ),
              //SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 0,
                ),
                child: Text(
                  //'$available',
                  newMod.available.toString(),

                  style: TextStyle(fontSize: 24.0, color: Colors.blue[800]),
                ),
              ),
            ],
          );
        });
  }

  _displayincome() {
    return StreamBuilder(
        stream: cashinRef.doc(widget.dashuserInformation.id).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          CashinModel newMod = CashinModel.deserialize(snapshot.data);

          return Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Income',
                style: TextStyle(fontSize: 21.0, color: Colors.green[800]),
              ),
              SizedBox(height: 7),
              Text(
                newMod.totalincome.toString(),
                style: TextStyle(fontSize: 21.0, color: Colors.green[800]),
              ),
            ],
          );
        });
  }

//final mainRef = FirebaseFirestore.instance.collection('user');
  _displaypercent() {
    return StreamBuilder(
        stream: percentRef.doc(widget.dashuserInformation.id).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          PercentModel neww = PercentModel.deserialize(snapshot.data);
          return StreamBuilder(
              stream: mainRef.doc(widget.dashuserInformation.id).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                UserModel newMod = UserModel.deserialize(snapshot.data);
                double percent =
                    ((neww.amount) / double.parse(newMod.dexpense)) * 100;
                // double p = 100 - percent.abs();
                String per = percent.toStringAsFixed(1);
                return Text(
                  "You've spent $per% of your daily expected expense.",
                  style: TextStyle(fontSize: 17.5, color: Colors.yellow[800]),
                );
              });
        });
  }

  _displayexpense() {
    return StreamBuilder(
        stream: cashoutRef.doc(widget.dashuserInformation.id).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          CashoutModel neww = CashoutModel.deserialize(snapshot.data);

          return Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Expense',
                style: TextStyle(fontSize: 21.0, color: Colors.red[800]),
              ),
              SizedBox(height: 7),
              Text(
                neww.totalexpense.toString(),
                style: TextStyle(fontSize: 21.0, color: Colors.red[800]),
              ),
            ],
          );
        });
  }
}
//     "dexpense" = data[0],
//  "email" = data[0],
//  "esavings" = data[0],
//  "name" = data[0],
//  "password" = data[0],
//  "mexpense" = data[0],
// int totalexpense = 0;
// int totalincome = 0;
// int available = 0;

// Future<void> updateDBValues() async {
//   print("Debung point 1");
//   String id = FirebaseAuth.instance.currentUser.uid;
//   print(id);
//   DocumentSnapshot query =
//       await FirebaseFirestore.instance.collection('CashIn').doc(id).get();
//   CashinModel newMod = CashinModel.deserialize(query);
//   CashoutModel neww = CashoutModel.deserialize(query);
//   neww.totalexpense = neww.eatingout +
//       neww.education +
//       neww.health +
//       neww.bills +
//       neww.communication +
//       neww.groceries +
//       neww.travel +
//       neww.sports +
//       neww.entertainment +
//       neww.household +
//       neww.gifts +
//       neww.others;

//   newMod.totalincome = newMod.salary +
//       newMod.profit +
//       newMod.investment +
//       newMod.property +
//       newMod.sale +
//       newMod.others;

//   //available = newMod.totalincome - neww.totalexpense;
//   String top = newMod.totalincome.toString();
// }
