import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryModel {
  final String cate;
  // final String icon;
  final String date;
  final int amount;

  HistoryModel({
    this.cate,
//    this.icon,
    this.date,
    this.amount,
  });

  factory HistoryModel.deserialize(DocumentSnapshot doc) {
    return HistoryModel(
      //id = snapshot.key,
      cate: doc['cate'],
      // icon = snapshot.value["imageUrl"],
      date: doc["date"],
      amount: doc["amount"],
    );
  }

  // HistoryModel.fromSnapshot(snapshot)
  //     :
  //       //id = snapshot.key,
  //       cate = snapshot.value['cate'],
  //       // icon = snapshot.value["imageUrl"],
  //       date = snapshot.value["date"],
  //       amount = snapshot.value["amount"];

  toJson() {
    return {
      "cate": cate,
      "date": date,
      "amount": amount,
    };
  }
}
