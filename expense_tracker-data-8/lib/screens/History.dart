import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class history extends StatelessWidget {
  final String category;
  final String date;
  String iconname;
  final textcolor = '';

  final String amount;

  history({this.category, this.date, this.amount});

  factory history.CustomModel(DocumentSnapshot doc) {
    return history(
        category: doc['category'], date: doc['date'], amount: doc['amount']);
  }

  _geticons(String category) {
    if (category == 'Salary' ||
        category == 'Profit' ||
        category == 'Family' ||
        category == 'Sale' ||
        category == 'Investment' ||
        category == 'Others') {}
    if (category == 'Salary' || category == 'salary') {
      return Container(
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.orange[300],
          child: Icon(
            Icons.local_atm,
            size: 17.0,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
        ),
      );
    } else if (category == 'Investment' || category == 'investment') {
      return Container(
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.red[300],
          child: Icon(
            Icons.bar_chart,
            color: Colors.white,
            size: 20.0,
          ),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
        ),
      );
    } else if (category == 'Family' || category == 'family') {
      return Container(
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.indigo[300],
          child: Icon(
            Icons.domain,
            size: 20.0,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
        ),
      );
    } else if (category == 'Sale' || category == 'sale') {
      return Container(
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.cyan[200],
          child: Icon(
            Icons.local_offer,
            color: Colors.white,
            size: 20.0,
          ),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
        ),
      );
    } else if (category == 'Profit' || category == 'profit') {
      return Container(
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.green[300],
          child: Icon(
            Icons.trending_up,
            size: 20.0,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
        ),
      );
    } else if (category == 'Income Others') {
      return Container(
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.blueGrey[300],
          child: Icon(
            Icons.more_horiz,
            color: Colors.white,
            size: 20.0,
          ),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
        ),
      );
    } else if (category == 'Expense Others') {
      return Container(
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.blueGrey[300],
          child: Icon(
            Icons.more_horiz,
            size: 20.0,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
        ),
      );
    } else if (category == 'Eating Out' || category == 'eating out') {
      return Container(
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.orange[300],
          child: Icon(
            Icons.restaurant,
            color: Colors.white,
            size: 20.0,
          ),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
        ),
      );
    } else if (category == 'Education' || category == 'education') {
      return Container(
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.green[300],
          child: Icon(
            Icons.book,
            size: 20.0,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
        ),
      );
    } else if (category == 'Health' || category == 'health') {
      return Container(
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.red[300],
          child: Icon(
            Icons.healing,
            size: 20.0,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
        ),
      );
    } else if (category == 'Bills&Rent' || category == 'bills') {
      return Container(
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.indigo[200],
          child: Icon(
            Icons.receipt,
            size: 20.0,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
        ),
      );
    } else if (category == 'Groceries' || category == 'groceries') {
      return Container(
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.blueGrey[300],
          child: Icon(
            Icons.shopping_basket,
            color: Colors.white,
            size: 20.0,
          ),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
        ),
      );
    } else if (category == 'Travel' || category == 'travel') {
      return Container(
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.teal[200],
          child: Icon(
            Icons.directions_bus,
            color: Colors.white,
            size: 20.0,
          ),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
        ),
      );
    } else if (category == 'Entertainment' || category == 'entertainment') {
      return Container(
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.deepPurple[300],
          child: Icon(
            Icons.devices,
            color: Colors.white,
            size: 20.0,
          ),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
        ),
      );
    } else if (category == 'Laundry' || category == 'others') {
      return Container(
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.amberAccent,
          child: Icon(
            Icons.home,
            color: Colors.white,
            size: 20.0,
          ),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
        ),
      );
    } else if (category == 'Gifts' || category == 'gifts') {
      return Container(
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.pink[200],
          child: Icon(
            Icons.card_giftcard,
            size: 20.0,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
        ),
      );
    } else if (category == 'Communication' || category == 'communication') {
      return Container(
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 1.0,
          fillColor: Colors.cyan[200],
          child: Icon(
            Icons.call,
            color: Colors.white,
            size: 20.0,
          ),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
        ),
      );
    } else if (category == 'Sports' || category == 'sports') {
      return Container(
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.yellow[900],
          child: Icon(
            Icons.directions_run,
            size: 20.0,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
        ),
      );
    } else {
      return Container(
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.brown[300],
          child: Icon(
            Icons.person_rounded,
            color: Colors.white,
            size: 20.0,
          ),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
        ),
      );
    }
  }

  _getamount(String amount, String cat) {
    if (cat == "Salary" ||
        cat == "Sale" ||
        cat == 'Profit' ||
        cat == 'Family' ||
        cat == 'Investment' ||
        cat == 'Income Others') {
      return Container(
        child: Text("+Rs. " + amount.toString(),
            style: TextStyle(
              color: Colors.green[800],
              fontSize: 19.0,
            )),
      );
    } else if (cat == "Eating Out" ||
        cat == "Education" ||
        cat == 'Health' ||
        cat == 'Bills&Rent' ||
        cat == 'Communication' ||
        cat == "Groceries" ||
        cat == 'Travel' ||
        cat == 'Sports' ||
        cat == 'Entertainment' ||
        cat == "Laundry" ||
        cat == 'Gifts' ||
        cat == 'Expense Others') {
      return Container(
        child: Text("-Rs. " + amount.toString(),
            style: TextStyle(
              color: Colors.red[800],
              fontSize: 19.0,
            )),
      );
    } else {
      if (int.parse(amount) < 0) {
        int a = -int.parse(amount);
        return Container(
          child: Text("-Rs. " + (a.toString()),
              style: TextStyle(
                color: Colors.red[800],
                fontSize: 19.0,
              )),
        );
      } else if (int.parse(amount) > 0) {
        return Container(
          child: Text("Rs. " + amount.toString(),
              style: TextStyle(
                color: Colors.green[800],
                fontSize: 19.0,
              )),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 0.7, bottom: 0.7),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 17, vertical: 3),
          padding: EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 10.0,
          ),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.all(
              const Radius.circular(20),
            ),
          ),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 60,
                child: _geticons(category),
              ),
              Container(
                width: 220,
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(category,
                          style: TextStyle(
                            fontSize: 18.0,
                          )),
                    ),
                    SizedBox(height: 5),
                    Container(
                        alignment: Alignment.centerLeft, child: Text(date))
                  ],
                ),
              ),
              Container(
                child: _getamount(amount, category),
              )
            ],
          ),
        ));
  }
}
