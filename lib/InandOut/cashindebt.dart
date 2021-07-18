import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/Models/debt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final historyRef = FirebaseFirestore.instance.collection("history");

class InDebt extends StatefulWidget {
  final String name;
  final int amount;

  InDebt({this.name, this.amount});

  factory InDebt.CustomModel(DocumentSnapshot doc) {
    return InDebt(name: doc['name'], amount: doc['amount']);
  }

  @override
  _InDebtState createState() => _InDebtState();
}

class _InDebtState extends State<InDebt> {
  String amt = '';
  int amount;
  String finalDate = '';
  double height = 0;

  updateHistory(String name) async {
    String id = FirebaseAuth.instance.currentUser.uid;

    await historyRef
        .doc(id)
        .collection('historyid')
        .doc(DateTime.now().microsecond.toString())
        .set({
      "amount": amt,
      "category": name,
      "date": finalDate,
      "timestamp": DateTime.now(),
    });
  }

  String iconname;

  Future<void> updateDBValues(int amt, String name) async {
    print(amt);
    String id = FirebaseAuth.instance.currentUser.uid;
    print(id);
    DocumentSnapshot<Map<String, dynamic>> query =
        await FirebaseFirestore.instance
            .collection('debt')
            .doc(id)
            .collection('debtid')
            .doc(name)
            // .collection('historyid')
            // .orderBy('timestamp', descending: true)
            .get();
    DebtModel newMod = DebtModel.deserialize(query);
    int finalamount = newMod.amount + amt;

    updateSalary(id, name, finalamount);
  }

  Future<void> updateSalary(String uid, String name, int newamount) async {
    FirebaseFirestore.instance
        .collection('debt')
        .doc(uid)
        .collection('debtid')
        .doc(name)
        .update({
      "amount": newamount,
    });
  }

  bool i1 = false;

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
    return Container(
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RawMaterialButton(
                  onPressed: () {
                    print(amt);
                    amount = int.parse(amt);
                    print(amount);
                    setState(() {
                      i1 = !i1;
                    });
                  },
                  elevation: 2.0,
                  fillColor: Colors.blueGrey[300],
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(
                    side: BorderSide(
                        color: i1 ? Colors.blue : Colors.transparent,
                        width: 2.2),
                  ),
                ),
                Text(widget.name),
                Container(
                  alignment: Alignment.bottomRight,
                  child: RawMaterialButton(
                    onPressed: () {
                      updateDBValues(amount, widget.name);
                      updateHistory(widget.name);

                      if (true) {
                        Fluttertoast.showToast(
                          msg: "Transaction recorded",
                          gravity: ToastGravity.BOTTOM,
                          toastLength: Toast.LENGTH_SHORT,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                        );
                      }
                    },
                    elevation: 2.0,
                    fillColor: Colors.green[800],
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 18.0,
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                )
              ],
            ),
            Container(
                child: Form(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text('Amount', style: TextStyle(color: Colors.black)),
                    Container(
                      width: 350, height: 40,

                      //alignment: ,
                      child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 17),
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
                        onChanged: (val) {
                          setState(() => amt = val);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
