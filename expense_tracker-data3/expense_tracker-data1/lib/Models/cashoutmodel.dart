import 'package:cloud_firestore/cloud_firestore.dart';

//cashin garda ko model with deserialize
class CashoutModel {
  final int eatingout;
  final int education;
  final int health;
  final int bills;
  final int communication;
  final int groceries;
  final int travel;
  final int sports;
  final int entertainment;
  final int household;
  final int gifts;
  final int others;

  CashoutModel({
    this.eatingout,
    this.education,
    this.health,
    this.bills,
    this.communication,
    this.groceries,
    this.travel,
    this.sports,
    this.entertainment,
    this.household,
    this.gifts,
    this.others,
  });

  factory CashoutModel.deserialize(DocumentSnapshot doc) {
    return CashoutModel(
      eatingout: doc['eatingout'],
      education: doc['education'],
      health: doc['health'],
      bills: doc['bills'],
      communication: doc['communication'],
      groceries: doc['groceries'],
      travel: doc['travel'],
      sports: doc['sports'],
      entertainment: doc['entertainment'],
      household: doc['household'],
      gifts: doc['gifts'],
      others: doc['others'],
    );
  }
}
