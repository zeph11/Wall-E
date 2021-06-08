//import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/Authentication/Authentication.dart';
import 'package:expense_tracker/Models/UserMOdel.dart';
import 'package:expense_tracker/Models/cashinmodel.dart';
import 'package:expense_tracker/Models/cashoutmodel.dart';
import 'package:expense_tracker/screens/Authenticate/info.dart';
import 'package:expense_tracker/screens/homepage/dashboard.dart';
import 'package:expense_tracker/screens/homepage/overview.dart';
import 'package:expense_tracker/screens/homepage/profile.dart';
import 'package:flutter/material.dart';

// CashinModel currentUser;
// UserModel currentUser;
final cashinRef = FirebaseFirestore.instance.collection("CashIn");
final cashoutRef = FirebaseFirestore.instance.collection("CashOut");

//import 'package:google_nav_bar/google_nav_bar.dart';
//import 'package:line_icons/line_icons.dart';

//import 'cuppertin'

class DashBoard extends StatefulWidget {
  final AuthBase auth;
  final UserClass initialUser;

  const DashBoard({@required this.auth, @required this.initialUser});
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool isDataAvailable = false;
  PageController pageController;

  int _currentIndex = 0;

  void initState() {
    checkFirebaseUser();

    super.initState();
    pageController = PageController(initialPage: 0);
  }

  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  checkFirebaseUser() async {
    print("DEBUG PART 1");
    if (widget.initialUser.id != null) {
      await createUserInFirebase();
      setState(() {
        isDataAvailable = true;
      });
    } else {
      isDataAvailable = false;
    }
  }

  createUserInFirebase() async {
    print("DEBUG PART 2");
    DocumentSnapshot doc = await mainRef.doc(widget.initialUser.id).get();
    print("DEBUG PART 3");

    if (!doc.exists) {
      final data = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CollectInfo(
                    intialData: widget.initialUser,
                  )));

      mainRef.doc(widget.initialUser.id).set({
        "dexpense": data[2],
        "email": data[0],
        "esavings": data[4],
        "name": data[1],
        "mexpense": data[3],
      });
      print("DEBUG PART 4");

      doc = await mainRef.doc(widget.initialUser.id).get();
      createUserinfirebaseForCashIn();
      createUserinfirebaseForCashOut();
      // int totalexpense = 0;
      // int totalincome = 0;
      // int available = 0;
    }
    currentUser = UserModel.deserialize(doc);
  }

  createUserinfirebaseForCashIn() async {
    DocumentSnapshot doc = await cashinRef.doc(widget.initialUser.id).get();
    await cashinRef.doc(widget.initialUser.id).set({
      "salary": 0,
      "profit": 0,
      "investment": 0,
      "property": 0,
      "sale": 0,
      "others": 0,
      "totalincome": 0,
      "available": 0,
    });
    currentUser1 = CashinModel.deserialize(doc);
  }

  createUserinfirebaseForCashOut() async {
    DocumentSnapshot doc = await cashoutRef.doc(widget.initialUser.id).get();

    await cashoutRef.doc(widget.initialUser.id).set({
      "eatingout": 0,
      "education": 0,
      "health": 0,
      "bills": 0,
      "communication": 0,
      "groceries": 0,
      "travel": 0,
      "sports": 0,
      "entertainment": 0,
      "household": 0,
      "gifts": 0,
      "others": 0,
      "totalexpense": 0,
    });
    currentUser2 = CashoutModel.deserialize(doc);
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
            DashBoardPage(
              auth: widget.auth,
              dashuserInformation: widget.initialUser,
            ),
            OverviewPage(),
            ProfilePage(
              auth: widget.auth,
              userInformation: widget.initialUser,
            ),
          ],

          // controller: controller,
          controller: pageController,
          onPageChanged: onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff3282B8),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.45),
          currentIndex: _currentIndex,
          onTap: (value) {
            onTap(value);
          },
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.dashboard),

              // ignore: deprecated_member_use
              title: new Text(
                'Dashboard',
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.bar_chart_sharp,
              ),
              // ignore: deprecated_member_use
              title: new Text(
                'Overview',
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.person,
              ),
              // ignore: deprecated_member_use
              title: new Text(
                'Profile',
                style: TextStyle(),
              ),
            )
          ],
        ));
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
