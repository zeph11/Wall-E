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
    print(doc['category']);
    if (doc == null) {
      return null;
    }
    final String cate = doc['category'];
    final int amount = doc['amount'];

    return HistoryModel(cate: cate, amount: amount);
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
