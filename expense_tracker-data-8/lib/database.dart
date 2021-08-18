import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  final homeRef = FirebaseFirestore.instance.collection("user");

  String uid = '';

  DatabaseService({this.uid});

  //User user;
  //creating databae
  // trialDatabase(String email, String name, String password) async {
  //   return await homeRef
  //       .doc(uid)
  //       .set({"EmailId": email, "FullName": name, "Password": password});
  // }

  // addtoDatabase(String dexpense, String mexpense, String esavings) async{
  //   return await homeRef.doc.add( {"dexpense": dexpense, "mexpense": mexpense, "esavings": esavings});
  // }

  updateDatabse(String email, String name, String password, String dexpense,
      String mexpense, String esavings) async {
    return await homeRef.doc(uid).set({
      'email': email,
      'name': name,
      'password': password,
      "dexpense": dexpense,
      "mexpense": mexpense,
      "esavings": esavings
    });
  }

  getname() async {
    QuerySnapshot query = await homeRef.get();
    query.docs.forEach((value) {
      return (Text(value['name']));
    });
  }

  readDatabase() async {
    QuerySnapshot query = await homeRef.get();

    query.docs.forEach((value) {
      print(value.data());
    });
  }
}
