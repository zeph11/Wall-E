import 'package:cloud_firestore/cloud_firestore.dart';

//cashin garda ko model with deserialize
class PercentModel {
  final int amount;
  final String date;

  PercentModel({
    this.amount,
    this.date,
  });

  factory PercentModel.deserialize(DocumentSnapshot doc) {
    return PercentModel(
      amount: doc['amount'],
      date: doc['date'],
    );
  }
}
