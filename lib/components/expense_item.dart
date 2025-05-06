import 'package:expenses_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    super.key,
    required this.expense,
  });

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  expense.title,
                ),
                Spacer(),
                Text(
                  expense.amount.toString(),
                ),
              ],
            ),
            // Spacer(),
            Row(
              children: [
                Text(
                  expense.category.toString(),
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(categoricalItem[expense.category]),
                    Text(
                      expense.formattedFDate,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
