import 'package:expenses_tracker/components/expenses_list_builder.dart';
import 'package:expenses_tracker/components/inputing_expense_widget.dart';
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
  void _showTheModalSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return AddingExpenses();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expeses Tracker",
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _showTheModalSheet();
            },
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: ExpensesList(
          // expenses: expensesData,
          ),
    );
  }
}
