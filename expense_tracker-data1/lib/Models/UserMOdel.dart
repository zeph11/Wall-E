import 'package:cloud_firestore/cloud_firestore.dart';

// initial user ko model to deserialize
class UserModel {
  final String dexpense;
  final String email;
  final String esavings;
  final String name;
  final String password;
  final String mexpense;

  UserModel(
      {this.dexpense,
      this.email,
      this.esavings,
      this.name,
      this.password,
      this.mexpense});

  factory UserModel.deserialize(DocumentSnapshot doc) {
    return UserModel(
        dexpense: doc['dexpense'],
        email: doc['email'],
        esavings: doc['esavings'],
        name: doc['name'],
        mexpense: doc['mexpense']);
  }
}
