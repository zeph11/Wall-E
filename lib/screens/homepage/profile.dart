import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/Authentication/Authentication.dart';
import 'package:expense_tracker/Models/UserMOdel.dart';
import 'package:expense_tracker/Models/cashinmodel.dart';
import 'package:expense_tracker/Models/cashoutmodel.dart';
import 'package:expense_tracker/Models/debt.dart';
import 'package:expense_tracker/screens/Authenticate/signin.dart';
import 'package:expense_tracker/screens/homepage/addperson.dart';
import 'package:expense_tracker/screens/homepage/dashboard.dart';
import 'package:expense_tracker/screens/homepage/debtdisplay.dart';
import 'package:expense_tracker/screens/homepage/editdetails.dart';

import 'package:flutter/material.dart';

final cashinRef = FirebaseFirestore.instance.collection("CashIn");
final cashoutRef = FirebaseFirestore.instance.collection("CashOut");
final debtRef = FirebaseFirestore.instance.collection('debt');
debtModel currentUser3;

class ProfilePage extends StatefulWidget {
  final AuthBase auth;
  final UserClass userInformation;

  const ProfilePage({@required this.auth, @required this.userInformation});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Stream<List<debtModel>> getdebt() {
    final snapshots = debtRef
        .doc(auth.currentUser.uid)
        .collection('debtid')
        .orderBy('timestamp', descending: true)
        .snapshots();

    return snapshots.map((event) =>
        event.docs.map((snapshot) => debtModel.deserialize(snapshot)).toList());
  }

  Future<void> _logout() async {
    try {
      await widget.auth.signOut();
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => SignIn(auth: widget.auth)),
      // );
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3282B8),
        elevation: 0.0, //removes dropshadow
        title: Text('Profile',
            style: TextStyle(
              fontSize: 27.0,
            )),
      ),
      body: Container(
        //whole page ko container
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Color(0xff3282B8),
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 45.0,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
              ),
              Container(
                // this container for whole one details
                padding: EdgeInsets.symmetric(
                  vertical: 40.0,
                  horizontal: 30.0,
                ),
                child: Column(
                  //yo column heading ra bhitra ko batta ko lai
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('About you',
                            style: TextStyle(
                              fontSize: 25.0,
                            )),
                        InkWell(
                            child: Text('EDIT',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  decoration: TextDecoration.underline,
                                )),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                          auth: widget.auth,
                                          editdeatils: widget.userInformation,
                                        )),
                              );
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.brown[100],
                        borderRadius: BorderRadius.all(
                          const Radius.circular(20),
                        ),
                      ),
                      //first colored box

                      padding: EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ), //removes away from edges
                      child: _buildUserData(),
                    ),
                  ],
                ),
              ),
              //SizedBox(height: 20.0),

              Container(
                //third  detail ko container
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),

                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Income Sources',
                          style: TextStyle(
                            fontSize: 25.0,
                          )),
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.all(
                          const Radius.circular(20),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      //green income container
                      child: _cashinData(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              Container(
                //third  detail ko container
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Expense Sources',
                          style: TextStyle(
                            fontSize: 25.0,
                          )),
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.all(
                          const Radius.circular(20),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      //green income container

                      child: _cashoutData(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                //second detail ko container
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('Debt',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 25.0,
                              )),
                        ),
                        InkWell(
                            child: Text('Add Persons',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  decoration: TextDecoration.underline,
                                )),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddPerson()),
                              );
                            }),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.all(
                          const Radius.circular(20),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      //purple container

                      child: _builddebtUIFuture(),
                      // Form(
                      //   child: Column(
                      //     children: <Widget>[
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Text('Person 1',
                      //               style: TextStyle(
                      //                 fontSize: 20.0,
                      //               )),
                      //           Text('0',
                      //               style: TextStyle(
                      //                 fontSize: 20.0,
                      //               )),
                      //         ],
                      //       ),

                      //     ],
                      //   ),
                      // ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.0),
              // ignore: deprecated_member_use
              RaisedButton(
                  color: Colors.red[800],
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Text(
                    'LOG OUT',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: _logout),
              SizedBox(height: 20),
              // ignore: deprecated_member_use
            ],
          ),
        ),
        //]),
      ),
      // ),
    );
  }

  _builddebtUIFuture() {
    return FutureBuilder(
        future: getdebtFuture(),
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

  getdebtFuture() async {
    QuerySnapshot snapshot = await debtRef
        .doc(auth.currentUser.uid)
        .collection('debtid')
        .orderBy('timestamp', descending: true)
        .get();
    List<debt> debtItems = [];
    snapshot.docs.forEach((doc) {
      debtItems.add(debt.CustomModel(doc));
    });
    print(debtItems);

    return debtItems;
  }

  _buildUserData() {
    return StreamBuilder(
        stream: mainRef.doc(widget.userInformation.id).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          UserModel userInfo = UserModel.deserialize(snapshot.data);
          return Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Your name:',
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
                //caliing getname
                Text(userInfo.name,
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Email Address:',
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
                Text(userInfo.email,
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
              ],
            ),
            SizedBox(height: 5.0),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Expected daily expense:',
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
                Text(userInfo.dexpense,
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Expected monthly expense:',
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
                Text(userInfo.mexpense,
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Expected savings:',
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
                Text(userInfo.esavings,
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
              ],
            ),
          ]);
        });
  }

  _cashinData() {
    return StreamBuilder(
        stream: cashinRef.doc(widget.userInformation.id).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          CashinModel userInfo = CashinModel.deserialize(snapshot.data);
          return Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Investment',
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
                Text(userInfo.investment.toString(),
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Profit',
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
                Text((userInfo.profit.toString()),
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Property',
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
                Text(userInfo.property.toString(),
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Salary',
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
                Text(userInfo.salary.toString(),
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sale',
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
                Text(userInfo.sale.toString(),
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Income Others',
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
                Text(userInfo.others.toString(),
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
              ],
            ),
            // SizedBox(height: 5.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text('Total income',
            //         style: TextStyle(
            //           fontSize: 20.0,
            //         )),
            //     Text(userInfo.totalincome.toString(),
            //         style: TextStyle(
            //           fontSize: 20.0,
            //         )),
            //   ],
            // ),
          ]);
        });
  }

  _cashoutData() {
    return StreamBuilder(
        stream: cashoutRef.doc(widget.userInformation.id).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          CashoutModel userInfo = CashoutModel.deserialize(snapshot.data);
          return Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Eating Out',
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                  Text(userInfo.eatingout.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Education',
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                  Text(userInfo.education.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Health',
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                  Text(userInfo.health.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Bills',
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                  Text(userInfo.bills.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Communication',
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                  Text(userInfo.communication.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Groceries',
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                  Text(userInfo.groceries.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Travel',
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                  Text(userInfo.travel.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sports',
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                  Text(userInfo.sports.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Entertainment',
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                  Text(userInfo.entertainment.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Household',
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                  Text(userInfo.household.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Gifts',
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                  Text(userInfo.gifts.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Expense Others',
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                  Text(userInfo.others.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                ],
              ),

              // SizedBox(height: 5.0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text('Total expense',
              //         style: TextStyle(
              //           fontSize: 20.0,
              //         )),
              //     Text(userInfo.totalexpense.toString(),
              //         style: TextStyle(
              //           fontSize: 20.0,
              //         )),
              //   ],
              // ),
            ],
          );
        });
  }
}



//
