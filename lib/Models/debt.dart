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
    if (doc == null) {
      return null;
    }
    final String name = doc['name'];
    final String amount = doc['amount'];
    return debtModel(
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
