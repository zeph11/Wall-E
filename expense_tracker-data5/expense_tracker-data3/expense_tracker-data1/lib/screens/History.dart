import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class history extends StatelessWidget {
  final String category;
  final String date;

  final String amount;

  history({this.category, this.date, this.amount});

  factory history.CustomModel(DocumentSnapshot doc) {
    return history(
        category: doc['category'], date: doc['date'], amount: doc['amount']);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 2, bottom: 10),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          padding: EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 20.0,
          ),
          decoration: BoxDecoration(
            color: Colors.blueGrey[100],
            borderRadius: BorderRadius.all(
              const Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(category,
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                  SizedBox(height: 5),
                  Text(date)
                ],
              ),
              Text(amount.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                  )),
            ],
          ),
        ));
  }
}
