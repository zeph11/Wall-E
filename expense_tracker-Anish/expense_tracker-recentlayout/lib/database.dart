import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final homeRef = FirebaseFirestore.instance.collection("user");

  String uid = '';

  DatabaseService({this.uid});

  //User user;
  //creating databae
  trialDatabase(String email, String name, String password) async {
    return await homeRef
        .doc(uid)
        .set({"EmailId": email, "FullName": name, "Password": password});
  }

  updateDatabse(String dexpense, String mexpense, String esavings) async {
    return await homeRef.doc(uid).update(
        {"dexpense": dexpense, "mexpense": mexpense, "esavings": esavings});
  }

  readDatabase() async {
    QuerySnapshot query = await homeRef.get();

    query.docs.forEach((value) {
      print(value.data());
    });
  }
}
