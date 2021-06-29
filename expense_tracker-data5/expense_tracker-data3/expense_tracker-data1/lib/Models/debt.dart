import 'package:cloud_firestore/cloud_firestore.dart';

//cashin garda ko model with deserialize
class debtModel {
  final String name;
  final String amount;

  debtModel({
    this.name,
    this.amount,
  });

  factory debtModel.deserialize(DocumentSnapshot doc) {
    return debtModel(
      name: doc['name'],
      amount: doc['amount'],
    );
  }
}
