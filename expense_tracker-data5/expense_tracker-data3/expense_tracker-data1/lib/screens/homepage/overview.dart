import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/Authentication/Authentication.dart';
import 'package:expense_tracker/Models/cashinmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

//import 'package:charts_flutter/flutter.dart';
final cashinRef = FirebaseFirestore.instance.collection("CashIn");

class OverviewPage extends StatefulWidget {
  final AuthBase auth;
  final UserClass userover;

  const OverviewPage({@required this.auth, @required this.userover});

  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  int _touchedIndex;
  int finalSalary;
  double salary = 0.0;
  double profit = 0.0;
  double invest = 0.0;
  double property = 0.0;
  double sale = 0.0;
  double other = 0.0;

  void initState() {
    updateDBValues();

    super.initState();
  }

  Future<void> updateDBValues() async {
    print("Debung point 1");
    String id = FirebaseAuth.instance.currentUser.uid;
    print(id);
    DocumentSnapshot query =
        await FirebaseFirestore.instance.collection('CashIn').doc(id).get();
    CashinModel newMod = CashinModel.deserialize(query);
    int finalSalary = newMod.salary;
    int finalProfit = newMod.profit;
    int finalInvestment = newMod.investment;
    int finalProperty = newMod.property;
    int finalSale = newMod.sale;
    int finalOthers = newMod.others;
    assign(finalSalary, finalProfit, finalInvestment, finalProperty, finalSale,
        finalOthers);
  }

  assign(int fsalary, int fprofit, int finvest, int fproperty, int fsale,
      int fother) {
    salary = fsalary.toDouble();
    profit = fprofit.toDouble();

    invest = finvest.toDouble();
    property = fproperty.toDouble();
    sale = fsale.toDouble();
    other = fother.toDouble();
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
      body: SingleChildScrollView(
        child: Container(
          height: 700,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            color: Colors.green[200],
          ),
          margin: EdgeInsets.all(10.0),
          // padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 100),
              //   // height: 700,
              //   child: Column(
              //     //mainAxisSize: MainAxisSize.max,
              //     //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           IndicatorWidget(
              //             title: 'RUNNING',
              //             subtitle: salary.toString(),
              //           ),
              //           IndicatorWidget(
              //             title: 'profit',
              //             subtitle: profit.toString(),
              //           ),
              //           IndicatorWidget(
              //             title: 'invest',
              //             subtitle: invest.toString(),
              //           ),
              //         ],
              //       ),
              //       SizedBox(
              //         height: 20,
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           IndicatorWidget(
              //             title: 'property',
              //             subtitle: property.toString(),
              //           ),
              //           IndicatorWidget(
              //             title: 'sale',
              //             subtitle: sale.toString(),
              //           ),
              //           IndicatorWidget(
              //             title: 'other',
              //             subtitle: other.toString(),
              //           )
              //         ],
              //       )
              //     ],
              //   ),
              // ),
              Container(
                width: 350,
                // Pie Chart is available in fl_chart package
                child: PieChart(
                  PieChartData(
                    borderData: FlBorderData(show: false),
                    centerSpaceRadius: 50.0,
                    sectionsSpace: 0.0,
                    startDegreeOffset: 30,
                    // actual curves and data come from this function result.
                    sections: _buildPieChartCurves(),
                    // This is to make chart interactive when someone touch
                    // pieTouchData: PieTouchData(
                    //   touchCallback: (pieTouchResponse) {
                    //     setState(() {
                    //       if (pieTouchResponse.touchInput is FlLongPressEnd ||
                    //           pieTouchResponse.touchInput is FlPanEnd) {
                    //         _touchedIndex = -1;
                    //       } else {
                    //         _touchedIndex = pieTouchResponse.touchedSectionIndex;
                    //       }
                    //     });
                    //   },
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    //alignment:
  }

  List<PieChartSectionData> _buildPieChartCurves() {
    return List.generate(6, (i) {
      final isTouched = i == _touchedIndex;
      // Increase the radius of section when touched.
      final double radius = isTouched ? 50 : 50;

      // Ideally this data come from API and then returned, or you can modify it any way as per the data arranged in your app :slight_smile:
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color(0xffF3BBEC),
            value: 100,
            title: 'Salary', // this cannot be left blank
            radius: radius,
          );
        case 1:
          return PieChartSectionData(
            color: Color(0xff39439f),
            value: 200,
            title: 'profit', // this cannot be left blank
            radius: radius,
          );
        case 2:
          return PieChartSectionData(
            color: Color(0xff0eaeb4),
            value: 300,
            title: 'invest', // this cannot be left blank
            radius: radius,
          );
        case 3:
          return PieChartSectionData(
            color: Colors.pink,
            value: 400,
            title: 'property', // this cannot be left blank
            radius: radius,
          );
        case 4:
          return PieChartSectionData(
            color: Colors.blue,
            value: 500,
            title: 'sales', // this cannot be left blank
            radius: radius,
          );
        case 5:
          return PieChartSectionData(
            color: Colors.red,
            value: 600,
            title: 'others', // this cannot be left blank
            radius: radius,
          );
        default:
          return null;
      }
    });
  }

  IndicatorWidget({String title, String subtitle}) {
    return Container(
        child: Column(
      children: [
        Text(title),
        Text(subtitle),
      ],
    ));
  }

  // _buildUserData() {
  //   return StreamBuilder(
  //       stream: cashinRef.doc(widget.userover.id).snapshots(),
  //       builder: (context, snapshot) {
  //         if (!snapshot.hasData) {
  //           return Center(child: CircularProgressIndicator());
  //         }
  //         CashinModel userInfo = CashinModel.deserialize(snapshot.data);
  //         return Container(
  //           height: 400,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(18.0),
  //             color: Colors.green[200],
  //           ),
  //           margin: EdgeInsets.all(10.0),
  //           padding: const EdgeInsets.all(16),
  //           child: Row(
  //             children: [
  //               Container(
  //                 width: 250,
  //                 // Pie Chart is available in fl_chart package
  //                 child: PieChart(
  //                   PieChartData(
  //                     borderData: FlBorderData(show: false),
  //                     centerSpaceRadius: 50.0,
  //                     sectionsSpace: 0.0,
  //                     startDegreeOffset: 30,
  //                     // actual curves and data come from this function result.
  //                     sections: _buildPieChartCurves(),
  //                     // This is to make chart interactive when someone touch
  //                     // pieTouchData: PieTouchData(
  //                     //   touchCallback: (pieTouchResponse) {
  //                     //     setState(() {
  //                     //       if (pieTouchResponse.touchInput is FlLongPressEnd ||
  //                     //           pieTouchResponse.touchInput is FlPanEnd) {
  //                     //         _touchedIndex = -1;
  //                     //       } else {
  //                     //         _touchedIndex = pieTouchResponse.touchedSectionIndex;
  //                     //       }
  //                     //     });
  //                     //   },
  //                     // ),
  //                   ),
  //                 ),
  //               ),
  //               // Expanded(
  //               //   child: Container(
  //               //     margin: EdgeInsets.symmetric(vertical: 100),
  //               //     child: Column(
  //               //       mainAxisSize: MainAxisSize.max,
  //               //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               //       children: [
  //               //         IndicatorWidget(
  //               //           title: 'RUNNING',
  //               //           subtitle: '10 KM',
  //               //         ),
  //               //         IndicatorWidget(
  //               //           title: 'CYCLING',
  //               //           subtitle: '10 KM',
  //               //         ),
  //               //         IndicatorWidget(
  //               //           title: 'SWIMMING',
  //               //           subtitle: '10 KM',
  //               //         )
  //               //       ],
  //               //     ),
  //               //   ),
  //               // )
  //             ],
  //           ),
  //         );
  //       });

}













































// class OverviewPage extends StatefulWidget {
//   @override
//   _OverviewPageState createState() => _OverviewPageState();
// }

// class _OverviewPageState extends State<OverviewPage> {
//   int _currentIndex = 0;
//   final List<Widget> _children = [
//     OverviewPage(),
//     //HistoryPage(),
//     //  ProfilePage(),
//   ];
//   void initState() {
//     super.initState();
//   }

//   changePage(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,

//         backgroundColor: Color(0xff3282B8),
//         elevation: 0.0, //removes dropshadow
//         title: Text('Overview',
//             style: TextStyle(
//               fontSize: 27.0,
//             )),
//       ),

//       //alignment:
//     );
//   }
// }
