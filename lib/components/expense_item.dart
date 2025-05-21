import 'package:expenses_tracker/data/local/db/app_db.dart';
import 'package:expenses_tracker/provider/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as drift;

class ExpenseItem extends StatelessWidget {
  ExpenseItem({
    super.key,
    required this.expense,
  });

  final ExpensesTableData expense;
  final formatter = DateFormat.yMd();
  final categoricalItem = {
    "food": Icons.food_bank,
    "travel": Icons.flight_takeoff,
    "leisure": Icons.movie,
    "work": Icons.work,
  };

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(expense.id),
      onDismissed: (direction) {
        Provider.of<AppDatabaseProvider>(context, listen: false)
            .db
            .deleteExpense(expense.id);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Deleted ${expense.expensesName}"),
            // action: SnackBarAction(
            //   label: "Undo",
            //   onPressed: () {
            //     Provider.of<AppDatabaseProvider>(context, listen: false)
            //         .db
            //         .insertingNewExpense(
            //           ExpensesTableCompanion(
            //             id: drift.Value(expense.id),
            //             expensesName: drift.Value(expense.expensesName),
            //             expensesAmount: drift.Value(expense.expensesAmount),
            //             expensesCategory: drift.Value(expense.expensesCategory),
            //             expensesDate: drift.Value(expense.expensesDate),
            //             ofRecordTypeId: drift.Value(1),
            //           ),
            //         );
            //   },
            // ),
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/view-expenses',
            arguments: expense.id,
          );
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 15,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      expense.expensesName.toString(),
                    ),
                    Spacer(),
                    Text(
                      expense.expensesAmount.toString(),
                    ),
                  ],
                ),
                // Spacer(),
                Row(
                  children: [
                    Text(
                      expense.expensesCategory.toString(),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(categoricalItem[expense.expensesCategory]),
                        Text(formatter.format(expense.expensesDate).toString()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
