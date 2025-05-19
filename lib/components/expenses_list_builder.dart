import 'package:expenses_tracker/components/customized_column_showing_itemsList.dart';
import 'package:expenses_tracker/components/expense_item.dart';
import 'package:expenses_tracker/data/local/db/app_db.dart';
import 'package:expenses_tracker/model/expense.dart';
import 'package:expenses_tracker/provider/database_provider.dart';
import 'package:expenses_tracker/provider/expenses_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'customized_charts_streamed_widget.dart';

class ExpensesList extends StatefulWidget {
  const ExpensesList({
    super.key,
  });

  @override
  State<ExpensesList> createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabaseProvider>(context, listen: false);

    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Expenses Chart"),
          StreamedBarChart(
            expensesStream: db.expensesAmountStream,
          ),
          StreamedColumnForItems(
            expensesList: db.db.getAllExpenses(),
          ),
        ],
      ),
    );
  }
}




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