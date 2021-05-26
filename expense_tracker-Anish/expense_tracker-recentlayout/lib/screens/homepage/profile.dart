import 'package:expense_tracker/screens/Authenticate/signin.dart';
import 'package:expense_tracker/screens/homepage/editdetails.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/services/auth.dart';
import 'package:expense_tracker/database.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthService _auth = AuthService();
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
              // icon: Icon(Icons.access_time, color: Colors.black),

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
                                    builder: (context) => DetailsPage()),
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
                        child: Form(
                          child: Column(children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Your name:',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                                Text('Luniva',
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
                                Text('Luniva@gmail.com',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Password:',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      //color: Colors.white,
                                    )),
                                Text('*****',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Expected daily expense:',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                                Text('200',
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
                                Text('15000',
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
                                Text('2000',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                              ],
                            ),
                          ]),
                        )),
                  ],
                ),
              ),
              //SizedBox(height: 20.0),

              //SizedBox(height: 24.0),
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

                      child: Form(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Investment',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                                Text('23400',
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
                                Text('23400',
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
                                Text('23400',
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
                                Text('23400',
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
                                Text('23400',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Others',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                                Text('23400',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
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

                      child: Form(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Eating Out',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                                Text('23400',
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
                                Text('23400',
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
                                Text('23400',
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
                                Text('23400',
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
                                Text('23400',
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
                                Text('23400',
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
                                Text('23400',
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
                                Text('23400',
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
                                Text('23400',
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
                                Text('23400',
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
                                Text('23400',
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
                                Text('23400',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Others',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                                Text('23400',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
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
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Details',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 25.0,
                          )),
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

                      child: Form(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Available Balance:',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                                Text('23400',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Income:',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                                Text('23400',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Expense:',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                                Text('23400',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
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
                onPressed: () async {
                  await _auth.signout();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
