import 'package:expenses_tracker/components/categories_list.dart';
import 'package:expenses_tracker/components/customized_column_showing_expense_itemsList.dart';
import 'package:expenses_tracker/provider/database_provider.dart';
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
            categoires: expensesCategories,
          ),
          StreamedColumnForExpenseItems(
            expensesList: db.db.getAllExpenses(db.recordTypeId!),
          ),
        ],
      ),
    );
  }
}
