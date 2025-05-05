import 'package:expenses_tracker/components/expenses_list_builder.dart';
import 'package:expenses_tracker/data/expenses_data.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpensesList(
        expenses: expensesData,
      ),
    );
  }
}
