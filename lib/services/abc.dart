// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:expense_tracker/Models/historymodel.dart';

// final HistoryRef = FirebaseFirestore.instance.collection("History").doc();


// class DatabaseService {

//   static Future<List<HistoryModel>> getNeeds() async {
//     Query needsSnapshot = await HistoryRef.instance
//       .reference()
//       .child("needs-posts")
//       .orderByKey();

//     print(needsSnapshot); // to debug and see if data is returned

//     List<HistoryModel> Histories;

//     Map<dynamic, dynamic> values = needsSnapshot.data.value;
//     values.forEach((key, values) {
//       Histories.add(values);
//     });

//     return Histories;
//   }
// }