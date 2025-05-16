import 'package:expenses_tracker/data/local/db/app_db.dart';
import 'package:expenses_tracker/data/local/entity/expenses_entity.dart';
import 'package:expenses_tracker/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    );
  }
}
