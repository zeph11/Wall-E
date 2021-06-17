import 'package:expense_tracker/Models/cashinmodel.dart';
import 'package:expense_tracker/screens/homepage/dashboard.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PirChartDataView extends StatelessWidget {
  int _touchedIndex;
  int finalSalary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Overview"),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height / 0.8,
          child: Column(
            children: [
              Flexible(
                child: _buildStream(context),
              ),
              _buildData(context),
            ],
          )),
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

  _buildData(BuildContext context) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.brightness_1,
                          color: Colors.pink,
                        ),
                        IndicatorWidget(
                          title: 'Salary',
                          subtitle: pieModel.salary.toString(),
                        )
                      ],
                    ),
                    IndicatorWidget(
                      title: 'Profit',
                      subtitle: pieModel.profit.toString(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IndicatorWidget(
                      title: 'Property',
                      subtitle: pieModel.property.toString(),
                    ),
                    IndicatorWidget(
                      title: 'Sale',
                      subtitle: pieModel.sale.toString(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IndicatorWidget(
                      title: 'Investment',
                      subtitle: pieModel.investment.toString(),
                    ),
                    IndicatorWidget(
                      title: 'OtherS',
                      subtitle: pieModel.others.toString(),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  _buildStream(BuildContext context) {
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
            centerSpaceRadius: 100.0,
            sectionsSpace: 0.0,
            startDegreeOffset: 39,
            // actual curves and data come from this function result.
            sections: _buildPieChartCurves(
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

  _buildPieChartCurves(
      {@required double salesVal,
      @required double otherVal,
      @required double salaryVal,
      @required double profitVal,
      @required double investVal,
      @required double propertyVal}) {
    return List.generate(6, (i) {
      final isTouched = i == _touchedIndex;
      // Increase the radius of section when touched.
      final double radius = isTouched ? 40 : 30;

      // Ideally this data come from API and then returned, or you can modify it any way as per the data arranged in your app :slight_smile:
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.pink,
            value: salaryVal,
            title: '', // this cannot be left blank
            radius: radius,
          );
        case 1:
          return PieChartSectionData(
            color: Colors.grey,
            value: profitVal,
            title: '',
            radius: radius,
          );
        case 2:
          return PieChartSectionData(
            color: Colors.brown,
            value: investVal,
            title: '',
            radius: radius,
          );
        case 3:
          return PieChartSectionData(
            color: Colors.pink,
            value: propertyVal,
            title: '',
            radius: radius,
          );
        case 4:
          return PieChartSectionData(
            color: Colors.blue,
            value: salesVal,
            title: '',
            radius: radius,
          );
        case 5:
          return PieChartSectionData(
            color: Colors.red,
            value: otherVal.toDouble(),
            title: '',
            radius: radius,
          );
        default:
          return null;
      }
    });
  }
}
