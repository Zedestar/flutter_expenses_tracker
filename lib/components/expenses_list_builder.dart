import 'package:expenses_tracker/components/expense_item.dart';
import 'package:expenses_tracker/model/expense.dart';
import 'package:expenses_tracker/provider/expenses_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    // required this.expenses,
  });

  // final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    // final expensesProviderConnector = Provider.of<ExpensesListProvider>(
    //   context,
    //   listen: false,
    // );
    return Column(
      children: [
        // Text("List expenses"),
        Expanded(
          child: Consumer<ExpensesListProvider>(
            builder: (context, expensesItem, child) {
              return ListView.builder(
                itemCount: expensesItem.getExpensesList.length,
                itemBuilder: (context, index) => ExpenseItem(
                  expense: expensesItem.getExpensesList[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
