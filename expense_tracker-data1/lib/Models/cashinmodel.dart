import 'package:cloud_firestore/cloud_firestore.dart';

//cashin garda ko model with deserialize
class CashinModel {
  final String salary;
  final String profit;
  final String investment;
  final String property;
  final String sale;
  final String others;

  CashinModel(
      {this.salary,
      this.profit,
      this.investment,
      this.property,
      this.sale,
      this.others});

  factory CashinModel.deserialize(DocumentSnapshot doc) {
    return CashinModel(
      salary: doc['salary'],
      profit: doc['profit'],
      investment: doc['investment'],
      property: doc['property'],
      sale: doc['sale'],
      others: doc['others'],
    );
  }
}
