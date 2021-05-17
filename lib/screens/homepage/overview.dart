import 'package:expense_tracker/screens/homepage/home.dart';
import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

class OverviewPage extends StatefulWidget {
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    OverviewPage(),
    //HistoryPage(),
    //  ProfilePage(),
  ];
  void initState() {
    super.initState();
  }

  changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0, //removes dropshadow
        title: Text('Overview',
            style: TextStyle(
              fontSize: 27.0,
            )),
      ),

      //alignment:
    );
  }
}
