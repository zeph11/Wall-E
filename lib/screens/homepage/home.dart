import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:expense_tracker/InandOut/Cashin.dart';
import 'package:expense_tracker/InandOut/Cashout.dart';
import 'package:expense_tracker/screens/homepage/dashboard.dart';
import 'package:expense_tracker/screens/homepage/history.dart';
import 'package:expense_tracker/screens/homepage/overview.dart';
import 'package:expense_tracker/screens/homepage/profile.dart';
import 'package:flutter/material.dart';
//import 'cuppertin'

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    DashBoardPage(),
    OverviewPage(),
    ProfilePage(),
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
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue[400],
          elevation: 0.0, //removes dropshadow
          title: Text('Dashboard',
              style: TextStyle(
                fontSize: 27.0,
              )),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          // onTap: changePage,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.dashboard),
              // ignore: deprecated_member_use
              title: new Text('Dashboard'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.access_time),
              // ignore: deprecated_member_use
              title: new Text('Overview'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              // ignore: deprecated_member_use
              title: new Text('Profile'),
            )
          ],
        ),
/*
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          null;
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
      ),*/
        body: (_currentIndex == 0)
            ? DashBoardPage()
            /*
          : (_currentIndex == 1)
              ? Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OverviewPage()),
                )*/
            : (_currentIndex == 1)
                ? Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OverviewPage()),
                  )
                : Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  ));
  }
}
