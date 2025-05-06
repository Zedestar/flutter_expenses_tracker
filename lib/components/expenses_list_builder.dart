import 'package:expenses_tracker/components/expense_item.dart';
import 'package:expenses_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text("List expenses"),
        Expanded(
          child: ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (context, index) => ExpenseItem(
              expense: expenses[index],
            ),
          ),
        ),
      ],
    );
  }
}
