// import 'package:expenses_tracker/provider/expenses_list_provider.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:provider/provider.dart';

// class ChartBar extends StatefulWidget {
//   const ChartBar({super.key});

//   @override
//   State<ChartBar> createState() => _ChartBarState();
// }

// class _ChartBarState extends State<ChartBar> {
//   @override
//   Widget build(BuildContext context) {
//     final expensesProviderConnector = Provider.of<ExpensesListProvider>(
//       context,
//       listen: true,
//     );
//     return SizedBox(
//       height: 250,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: BarChart(
//           BarChartData(
//             alignment: BarChartAlignment.spaceAround,
//             maxY: 10,
//             barTouchData: BarTouchData(enabled: true),
//             titlesData: FlTitlesData(
//               bottomTitles: AxisTitles(
//                 sideTitles: SideTitles(
//                   showTitles: true,
//                   getTitlesWidget: (value, meta) {
//                     const labels = Category.values
//                     return Text(
//                       labels[value.toInt()]
//                           .toString()
//                           .split('.')
//                           .last
//                           .toUpperCase(),
//                     );
//                   },
//                   reservedSize: 42,
//                 ),
//               ),
//               leftTitles: AxisTitles(
//                 sideTitles: SideTitles(showTitles: true),
//               ),
//               rightTitles: AxisTitles(
//                 sideTitles: SideTitles(showTitles: false),
//               ),
//               topTitles: AxisTitles(
//                 sideTitles: SideTitles(showTitles: false),
//               ),
//             ),
//             // borderData: FlBorderData(show: false),
//             barGroups: [
//               BarChartGroupData(x: 0, barRods: [
//                 BarChartRodData(
//                   toY: (expensesProviderConnector.expensesAmount[1] /
//                           expensesProviderConnector.expensesAmount[0]) *
//                       10,
//                   color: Colors.green,
//                   width: 40,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(6),
//                     topRight: Radius.circular(6),
//                   ),
//                 )
//               ]),
//               BarChartGroupData(x: 1, barRods: [
//                 BarChartRodData(
//                   toY: (expensesProviderConnector.expensesAmount[2] /
//                           expensesProviderConnector.expensesAmount[0]) *
//                       10,
//                   color: Colors.greenAccent,
//                   width: 40,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(6),
//                     topRight: Radius.circular(6),
//                   ),
//                 ),
//               ]),
//               BarChartGroupData(x: 2, barRods: [
//                 BarChartRodData(
//                   toY: (expensesProviderConnector.expensesAmount[3] /
//                           expensesProviderConnector.expensesAmount[0]) *
//                       10,
//                   color: Colors.lightGreen,
//                   width: 40,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(6),
//                     topRight: Radius.circular(6),
//                   ),
//                 ),
//               ]),
//               BarChartGroupData(x: 3, barRods: [
//                 BarChartRodData(
//                   toY: (expensesProviderConnector.expensesAmount[4] /
//                           expensesProviderConnector.expensesAmount[0]) *
//                       10,
//                   color: Colors.lightGreenAccent,
//                   width: 40,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(6),
//                     topRight: Radius.circular(6),
//                   ),
//                 )
//               ]),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
