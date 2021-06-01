import 'package:flutter/material.dart';

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
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3282B8),
        elevation: 0.0, //removes dropshadow
        title: Text('Overview',
            style: TextStyle(
              fontSize: 27.0,
            )),
      ),
      body: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red[500],
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Text('hsdgsfgsdgsdfgsdi'),
      ),

      //alignment:
    );
  }
}
