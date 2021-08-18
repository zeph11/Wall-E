import 'package:cloud_firestore/cloud_firestore.dart';

//cashin garda ko model with deserialize
class DebtModel {
  final String name;
  final int amount;

  DebtModel({
    this.name,
    this.amount,
  });

  factory DebtModel.deserialize(DocumentSnapshot doc) {
    if (doc == null) {
      return null;
    }
    final String name = doc['name'];
    final int amount = doc['amount'];
    return DebtModel(
      name: name,
      amount: amount,
    );
  }
  toJson() {
    return {
      'name': name,
      'amount': amount,
    };
  }
}
