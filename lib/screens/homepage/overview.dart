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
        title: Text('Overview'),
      ),
      bottomNavigationBar: BubbleBottomBar(
        opacity: 0.2,
        backgroundColor: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        currentIndex: _currentIndex,
        hasInk: true,
        inkColor: Colors.black12,
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        onTap: changePage,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(Icons.dashboard, color: Colors.black),
              activeIcon: Icon(Icons.dashboard, color: Colors.blue)),
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(Icons.access_time, color: Colors.black),
              activeIcon: Icon(Icons.access_time, color: Colors.blue)),
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(Icons.history, color: Colors.black),
              activeIcon: Icon(Icons.history, color: Colors.blue)),
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(Icons.person, color: Colors.black),
              activeIcon: Icon(Icons.person, color: Colors.blue)),
        ],
      ),
      body: (_currentIndex == 0)
          ? Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashBoard()),
            )
          : (_currentIndex == 1)
              ? Icon(
                  Icons.dashboard,
                  //size=150.0,
                )
              : (_currentIndex == 2)
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashBoard()),
                    )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashBoard()),
                    )
      //alignment:
      ,
    );
  }
}
