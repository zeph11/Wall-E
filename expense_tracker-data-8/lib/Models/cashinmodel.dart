import 'package:cloud_firestore/cloud_firestore.dart';

//cashin garda ko model with deserialize
class CashinModel {
  final int salary;
  final int profit;
  final int investment;
  final int property;
  final int sale;
  final int others;
  int totalincome;
  int available;

  CashinModel({
    this.salary,
    this.profit,
    this.investment,
    this.property,
    this.sale,
    this.others,
    this.totalincome,
    this.available,
  });

  factory CashinModel.deserialize(DocumentSnapshot doc) {
    return CashinModel(
      salary: doc['salary'],
      profit: doc['profit'],
      investment: doc['investment'],
      property: doc['property'],
      sale: doc['sale'],
      others: doc['others'],
      totalincome: doc['totalincome'],
      available: doc['available'],
    );
  }
}
