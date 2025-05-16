import 'package:expenses_tracker/components/expense_item.dart';
import 'package:expenses_tracker/data/local/db/app_db.dart';
import 'package:expenses_tracker/model/expense.dart';
import 'package:expenses_tracker/provider/expenses_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

class ExpensesList extends StatefulWidget {
  const ExpensesList({
    super.key,
  });

  @override
  State<ExpensesList> createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  late AppDb _db;

  @override
  void initState() {
    super.initState();
    _db = AppDb();
  }

  @override
  Widget build(BuildContext context) {
    final expensesProviderConnector = Provider.of<ExpensesListProvider>(
      context,
      listen: true,
    );
    return Column(
      children: [
        Text(
          "Expenses Chart",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 10,
                barTouchData: BarTouchData(enabled: true),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const labels = Category.values;
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
                      toY: (expensesProviderConnector.expensesAmount[1] /
                              expensesProviderConnector.expensesAmount[0]) *
                          10,
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
                      toY: (expensesProviderConnector.expensesAmount[2] /
                              expensesProviderConnector.expensesAmount[0]) *
                          10,
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
                      toY: (expensesProviderConnector.expensesAmount[3] /
                              expensesProviderConnector.expensesAmount[0]) *
                          10,
                      color: Colors.lightGreen,
                      width: 40,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                  ]),
                  BarChartGroupData(x: 3, barRods: [
                    BarChartRodData(
                      toY: (expensesProviderConnector.expensesAmount[4] /
                              expensesProviderConnector.expensesAmount[0]) *
                          10,
                      color: Colors.lightGreenAccent,
                      width: 40,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder<List<ExpensesTableData>>(
              future: _db.getAllExpenses(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  List<ExpensesTableData> expensesList = snapshot.data!;
                  return ListView.builder(
                      itemCount: expensesList.length,
                      itemBuilder: (context, index) {
                        return ExpenseItem(
                          expense: expensesList[index],
                        );
                      });
                } else {
                  return Center(
                    child: Text("No data found"),
                  );
                }
              }),
          // child: Consumer<ExpensesListProvider>(
          //   builder: (context, expensesItem, child) {
          //     return ListView.builder(
          //       itemCount: expensesItem.getExpensesList.length,
          //       itemBuilder: (context, index) => Dismissible(
          //         key: ValueKey(expensesItem.getExpensesList[index].id),
          //         onDismissed: (direction) {
          //           final Expense theItemToBeRemoved =
          //               expensesItem.getExpensesList[index];
          //           final int theRemovedIndex = index;
          //           expensesProviderConnector
          //               .removeExpensesInExpensesList(theItemToBeRemoved);
          //           ScaffoldMessenger.of(context).showSnackBar(
          //             SnackBar(
          //               content: Text(
          //                 'Item deleted',
          //                 style: TextStyle(color: Colors.white),
          //               ),
          //               backgroundColor: Colors.redAccent,
          //               behavior: SnackBarBehavior.floating,
          //               elevation: 6.0,
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(12.0),
          //               ),
          //               duration: Duration(seconds: 3),
          //               margin: EdgeInsets.symmetric(
          //                 horizontal: 16.0,
          //                 vertical: 10.0,
          //               ),
          //               action: SnackBarAction(
          //                 label: 'UNDO',
          //                 textColor: Colors.white,
          //                 onPressed: () {
          //                   expensesProviderConnector.insertTheDeletedItem(
          //                     index: theRemovedIndex,
          //                     expense: theItemToBeRemoved,
          //                   );
          //                 },
          //               ),
          //             ),
          //           );
          //         },
          //         child: ExpenseItem(
          //           expense: expensesItem.getExpensesList[index],
          //         ),
          //       ),
          //     );
          //   },
          // ),
        ),
      ],
    );
  }
}
