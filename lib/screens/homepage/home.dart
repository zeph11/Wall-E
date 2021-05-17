import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

import 'package:expense_tracker/screens/homepage/dashboard.dart';

import 'package:expense_tracker/screens/homepage/overview.dart';
import 'package:expense_tracker/screens/homepage/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

//import 'cuppertin'

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  PageController pageController;

  int _currentIndex = 0;
  final List<Widget> _children = [
    DashBoardPage(),
    OverviewPage(),
    ProfilePage(),
  ];
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int pageIndex) {
    setState(() {
      this._currentIndex = pageIndex;
    });
  }

  changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void onTap(int pageIndex) {
    setState(() {});
    pageController.jumpToPage(pageIndex);
  }

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          DashBoardPage(),
          OverviewPage(),
          ProfilePage(),
        ],

        // controller: controller,
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          onTap(value);
        },
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
    );
  }
}
      

      /*bottomNavigationBar: SafeArea(
           
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: GNav(
              rippleColor: Colors.grey[300],
              hoverColor: Colors.grey[100],
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100],
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.timesCircle,
                  text: 'Overview',
                ),
                GButton(
                  icon: LineIcons.accessibleIcon,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _currentIndex,
              onTabChange: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },*/