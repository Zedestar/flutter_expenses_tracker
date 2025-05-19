import 'package:expenses_tracker/components/categories_list.dart';
import 'package:expenses_tracker/data/local/db/app_db.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StreamedBarChart extends StatefulWidget {
  const StreamedBarChart({super.key, required this.expensesStream});

  final Stream<List<double>>? expensesStream;
// here what will be passed is from the database provider class is the method the returns the totals of each category

  @override
  State<StreamedBarChart> createState() => _StreamedBarChartState();
}

class _StreamedBarChartState extends State<StreamedBarChart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<List<double>>(
          stream: widget.expensesStream,
          //  db.expensesAmountStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading...");
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (!snapshot.hasData) {
              return Text("No data");
            } else {
              final totals = snapshot.data!;
              return BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 10,
                  barTouchData: BarTouchData(enabled: true),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          var labels = categories;
                          return Text(
                            labels[value.toInt()]
                                .toString()
                                .split('.')
                                .last
                                .toUpperCase(),
                          );
                        },
                        reservedSize: 42,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  // borderData: FlBorderData(show: false),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(
                        toY: (totals[1] / totals[0]) * 10,
                        color: Colors.green,
                        width: 40,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        ),
                      )
                    ]),
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(
                        toY: (totals[2] / totals[0]) * 10,
                        color: Colors.greenAccent,
                        width: 40,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        ),
                      ),
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(
                        toY: (totals[3] / totals[0]) * 10,
                        color: Colors.lightGreen,
                        width: 40,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        ),
                      ),
                    ]),
                    BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(
                          toY: (totals[4] / totals[0]) * 10,
                          color: Colors.lightGreenAccent,
                          width: 40,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
