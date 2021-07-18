import 'package:expense_tracker/Models/cashinmodel.dart';
import 'package:expense_tracker/Models/cashoutmodel.dart';
import 'package:expense_tracker/screens/homepage/dashboard.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PirChartDataView extends StatelessWidget {
  int _touchedIndexI;
  int _touchedIndexE;
  int finalSalary;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff3282B8),
            bottom: TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withOpacity(0.4),
              tabs: [
                Tab(
                  text: "Income",
                ),
                Tab(
                  text: "Expense",
                ),
              ],
            ),
            title: Text(
              "Overview",
              style: TextStyle(fontSize: 27),
            ),
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height / 0.8,
                child: Column(
                  children: [
                    SizedBox(
                      height: 400,
                      child: _buildStreamIncome(context),
                    ),
                    _buildDataIncome(context),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height / 0.8,
                child: Column(
                  children: [
                    SizedBox(
                      height: 320,
                      child: _buildStreamExpense(context),
                    ),
                    _buildDataExpense(context),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
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

  _buildDataIncome(BuildContext context) {
    return StreamBuilder(
        stream: cashInRerf.doc(auth.currentUser.uid).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          CashinModel pieModel = CashinModel.deserialize(snapshot.data);
          return Container(
            margin: EdgeInsets.symmetric(vertical: 100),
            // height: 700,
            child: Column(
              //mainAxisSize: MainAxisSize.max,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                  child: Table(
                      border: TableBorder
                          .symmetric(), // Allows to add a border decoration around your table
                      children: [
                        TableRow(children: [
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 1),
                            child: Text(''),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 15),
                            child: Text(
                              'Category',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Amount',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            alignment: Alignment.topCenter,
                            child: Icon(
                              Icons.brightness_1,
                              color: Colors.orange[300],
                            ),
                          ),
                          Container(
                              alignment: Alignment.bottomLeft,
                              child: Text('Salary',
                                  style: TextStyle(fontSize: 16))),
                          Container(
                            padding: EdgeInsets.only(
                                left: 20, right: 10, bottom: 15),
                            child: Text(pieModel.salary.toString(),
                                style: TextStyle(fontSize: 16)),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            alignment: Alignment.topCenter,
                            child: Icon(
                              Icons.brightness_1,
                              color: Colors.green[300],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child:
                                Text('Profit', style: TextStyle(fontSize: 16)),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 20, right: 10, bottom: 15),
                            child: Text(pieModel.profit.toString(),
                                style: TextStyle(fontSize: 16)),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            child: Icon(
                              Icons.brightness_1,
                              color: Colors.red[300],
                            ),
                          ),
                          Text('Investment', style: TextStyle(fontSize: 16)),
                          Container(
                            padding: EdgeInsets.only(
                                left: 20, right: 10, bottom: 15),
                            child: Text(pieModel.investment.toString(),
                                style: TextStyle(fontSize: 16)),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            child: Icon(
                              Icons.brightness_1,
                              color: Colors.indigo[200],
                            ),
                          ),
                          Text('Family', style: TextStyle(fontSize: 16)),
                          Container(
                            padding: EdgeInsets.only(
                                left: 20, right: 10, bottom: 15),
                            child: Text(pieModel.property.toString(),
                                style: TextStyle(fontSize: 16)),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            child: Icon(
                              Icons.brightness_1,
                              color: Colors.cyan[200],
                            ),
                          ),
                          Text('Sale', style: TextStyle(fontSize: 16)),
                          Container(
                            padding: EdgeInsets.only(
                                left: 20, right: 10, bottom: 15),
                            child: Text(pieModel.sale.toString(),
                                style: TextStyle(fontSize: 16)),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            child: Icon(
                              Icons.brightness_1,
                              color: Colors.blueGrey[300],
                            ),
                          ),
                          Text('Others', style: TextStyle(fontSize: 16)),
                          Container(
                            padding: EdgeInsets.only(
                                left: 20, right: 10, bottom: 15),
                            child: Text(pieModel.others.toString(),
                                style: TextStyle(fontSize: 16)),
                          ),
                        ]),
                      ]),
                ),
              ],
            ),
          );
        });
  }

  _buildDataExpense(BuildContext context) {
    return StreamBuilder(
        stream: cashOutRef.doc(auth.currentUser.uid).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          CashoutModel pieModel = CashoutModel.deserialize(snapshot.data);
          return Container(
            margin: EdgeInsets.symmetric(vertical: 100),
            // height: 700,
            child: Column(
              //mainAxisSize: MainAxisSize.max,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                  child: Table(
                      border: TableBorder
                          .symmetric(), // Allows to add a border decoration around your table
                      children: [
                        TableRow(children: [
                          Text(''),
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 15),
                            child: Text(
                              'Category',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 10, bottom: 15, left: 10),
                            child: Text(
                              'Amount',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            child: Icon(
                              Icons.brightness_1,
                              color: Colors.orange[300],
                            ),
                          ),
                          Text('Eating out'),
                          Container(
                            padding: EdgeInsets.only(left: 35, right: 10),
                            child: Text(pieModel.eatingout.toString()),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            child: Icon(
                              Icons.brightness_1,
                              color: Colors.green[300],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text('Education'),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 35, right: 10),
                            child: Text(pieModel.education.toString()),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            child: Icon(
                              Icons.brightness_1,
                              color: Colors.red[300],
                            ),
                          ),
                          Text('Health'),
                          Container(
                            padding: EdgeInsets.only(left: 35, right: 10),
                            child: Text(pieModel.health.toString()),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            child: Icon(
                              Icons.brightness_1,
                              color: Colors.indigo[200],
                            ),
                          ),
                          Text('Bills'),
                          Container(
                            padding: EdgeInsets.only(left: 35, right: 10),
                            child: Text(pieModel.bills.toString()),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            child: Icon(
                              Icons.brightness_1,
                              color: Colors.cyan[200],
                            ),
                          ),
                          Text('Communication'),
                          Container(
                            padding: EdgeInsets.only(left: 35, right: 10),
                            child: Text(pieModel.communication.toString()),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            child: Icon(
                              Icons.brightness_1,
                              color: Colors.blueGrey[300],
                            ),
                          ),
                          Text('Groceries'),
                          Container(
                            padding: EdgeInsets.only(left: 35, right: 10),
                            child: Text(pieModel.groceries.toString()),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            child: Icon(
                              Icons.brightness_1,
                              color: Colors.teal[500],
                            ),
                          ),
                          Text('Travel '),
                          Container(
                            padding: EdgeInsets.only(left: 35, right: 10),
                            child: Text(pieModel.travel.toString()),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            child: Icon(
                              Icons.brightness_1,
                              color: Colors.yellow[900],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text('Sports'),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 35, right: 10),
                            child: Text(pieModel.sports.toString()),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            child: Icon(
                              Icons.brightness_1,
                              color: Colors.deepPurple[300],
                            ),
                          ),
                          Text('Entertainment'),
                          Container(
                            padding: EdgeInsets.only(left: 35, right: 10),
                            child: Text(pieModel.entertainment.toString()),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            child: Icon(
                              Icons.brightness_1,
                              color: Colors.amberAccent,
                            ),
                          ),
                          Text('Household'),
                          Container(
                            padding: EdgeInsets.only(left: 35, right: 10),
                            child: Text(pieModel.household.toString()),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            child: Icon(
                              Icons.brightness_1,
                              color: Colors.pink[200],
                            ),
                          ),
                          Text('Gifts'),
                          Container(
                            padding: EdgeInsets.only(left: 35, right: 10),
                            child: Text(pieModel.gifts.toString()),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            child: Icon(
                              Icons.brightness_1,
                              color: Colors.blue[200],
                            ),
                          ),
                          Text('Others'),
                          Container(
                            padding: EdgeInsets.only(left: 35, right: 10),
                            child: Text(pieModel.others.toString()),
                          ),
                        ]),
                      ]),
                ),
              ],
            ),
          );
        });
  }

  _buildStreamIncome(BuildContext context) {
    return StreamBuilder(
        stream: cashInRerf.doc(auth.currentUser.uid).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          CashinModel pieModel = CashinModel.deserialize(snapshot.data);

          return PieChart(PieChartData(
            borderData: FlBorderData(show: false),
            centerSpaceRadius: 130.0,
            sectionsSpace: 0.0,
            startDegreeOffset: 30,
            // actual curves and data come from this function result.
            sections: _buildPieChartCurvesIncome(
                salaryVal: pieModel.salary.toDouble(),
                salesVal: pieModel.sale.toDouble(),
                otherVal: pieModel.others.toDouble(),
                investVal: pieModel.investment.toDouble(),
                profitVal: pieModel.profit.toDouble(),
                propertyVal: pieModel.property.toDouble()),
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
          ));
        });
  }

  _buildStreamExpense(BuildContext context) {
    return StreamBuilder(
        stream: cashOutRef.doc(auth.currentUser.uid).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          CashoutModel pieModel = CashoutModel.deserialize(snapshot.data);

          return PieChart(PieChartData(
            borderData: FlBorderData(show: false),
            centerSpaceRadius: 130.0,
            sectionsSpace: 0.0,
            startDegreeOffset: 39,
            // actual curves and data come from this function result.
            sections: _buildPieChartCurveExpense(
              eatingoutVal: pieModel.eatingout.toDouble(),
              educationVal: pieModel.education.toDouble(),
              healthVal: pieModel.health.toDouble(),
              billsVal: pieModel.bills.toDouble(),
              communicationVal: pieModel.communication.toDouble(),
              groceriesVal: pieModel.groceries.toDouble(),
              travelVal: pieModel.travel.toDouble(),
              sportsyVal: pieModel.sports.toDouble(),
              entertainmentVal: pieModel.entertainment.toDouble(),
              householdVal: pieModel.household.toDouble(),
              giftsVal: pieModel.gifts.toDouble(),
              othersVal: pieModel.others.toDouble(),
            ),
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
          ));
        });
  }

  _buildPieChartCurvesIncome(
      {@required double salesVal,
      @required double otherVal,
      @required double salaryVal,
      @required double profitVal,
      @required double investVal,
      @required double propertyVal}) {
    return List.generate(6, (i) {
      final isTouched = i == _touchedIndexI;
      // Increase the radius of section when touched.
      final double radius = isTouched ? 40 : 30;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.orange[300],
            value: salaryVal,
            title: '', // this cannot be left blank
            radius: radius,
          );
        case 1:
          return PieChartSectionData(
            color: Colors.green[300],
            value: profitVal,
            title: '',
            radius: radius,
          );
        case 2:
          return PieChartSectionData(
            color: Colors.red[300],
            value: investVal,
            title: '',
            radius: radius,
          );
        case 3:
          return PieChartSectionData(
            color: Colors.indigo[200],
            value: propertyVal,
            title: '',
            radius: radius,
          );
        case 4:
          return PieChartSectionData(
            color: Colors.cyan[200],
            value: salesVal,
            title: '',
            radius: radius,
          );
        case 5:
          return PieChartSectionData(
            color: Colors.blueGrey[200],
            value: otherVal.toDouble(),
            title: '',
            radius: radius,
          );
        default:
          return null;
      }
    });
  }

  _buildPieChartCurveExpense({
    @required double eatingoutVal,
    @required double educationVal,
    @required double healthVal,
    @required double billsVal,
    @required double communicationVal,
    @required double groceriesVal,
    @required double travelVal,
    @required double sportsyVal,
    @required double entertainmentVal,
    @required double householdVal,
    @required double giftsVal,
    @required double othersVal,
  }) {
    return List.generate(12, (i) {
      final isTouched = i == _touchedIndexE;
      // Increase the radius of section when touched.
      final double radius = isTouched ? 40 : 30;

      // Ideally this data come from API and then returned, or you can modify it any way as per the data arranged in your app :slight_smile:
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.orange[300],
            value: eatingoutVal,
            title: '', // this cannot be left blank
            radius: radius,
          );
        case 1:
          return PieChartSectionData(
            color: Colors.green[300],
            value: educationVal,
            title: '',
            radius: radius,
          );
        case 2:
          return PieChartSectionData(
            color: Colors.red[300],
            value: healthVal,
            title: '',
            radius: radius,
          );
        case 3:
          return PieChartSectionData(
            color: Colors.indigo[200],
            value: billsVal,
            title: '',
            radius: radius,
          );
        case 4:
          return PieChartSectionData(
            color: Colors.cyan[200],
            value: communicationVal,
            title: '',
            radius: radius,
          );
        case 5:
          return PieChartSectionData(
            color: Colors.blueGrey[300],
            value: groceriesVal.toDouble(),
            title: '',
            radius: radius,
          );
        case 6:
          return PieChartSectionData(
            color: Colors.teal[500],
            value: travelVal,
            title: '', // this cannot be left blank
            radius: radius,
          );
        case 7:
          return PieChartSectionData(
            color: Colors.yellow[900],
            value: sportsyVal,
            title: '',
            radius: radius,
          );
        case 8:
          return PieChartSectionData(
            color: Colors.deepPurple[300],
            value: entertainmentVal,
            title: '',
            radius: radius,
          );

        case 9:
          return PieChartSectionData(
            color: Colors.amberAccent,
            value: householdVal,
            title: '',
            radius: radius,
          );
        case 10:
          return PieChartSectionData(
            color: Colors.pink[200],
            value: giftsVal.toDouble(),
            title: '',
            radius: radius,
          );
        case 11:
          return PieChartSectionData(
            color: Colors.blue[200],
            value: othersVal.toDouble(),
            title: '',
            radius: radius,
          );
        default:
          return null;
      }
    });
  }
}
// Row(
  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //   children: [
  //     Row(
  //       children: [
  //         Icon(
  //           Icons.brightness_1,
  //           color: Colors.pink,
  //         ),
  //         IndicatorWidget(
  //           title: 'Salary',
  //           subtitle: pieModel.salary.toString(),
  //         )
  //       ],
  //     ),
  //     IndicatorWidget(
  //       title: 'Profit',
  //       subtitle: pieModel.profit.toString(),
  //     ),
  //   ],
  // ),
  // SizedBox(
  //   height: 20,
  // ),
  // Row(
  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //   children: [
  //     IndicatorWidget(
  //       title: 'Property',
  //       subtitle: pieModel.property.toString(),
  //     ),
  //     IndicatorWidget(
  //       title: 'Sale',
  //       subtitle: pieModel.sale.toString(),
  //     ),
  //   ],
  // ),
  // SizedBox(
  //   height: 20,
  // ),
  // Row(
  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //   children: [
  //     IndicatorWidget(
  //       title: 'Investment',
  //       subtitle: pieModel.investment.toString(),
  //     ),
  //     IndicatorWidget(
  //       title: 'OtherS',
  //       subtitle: pieModel.others.toString(),
  //     )
  //   ],
  // ),

