import 'package:expenses_tracker/components/expenses_list_builder.dart';
import 'package:expenses_tracker/components/inputing_expense_widget.dart';
import 'package:expenses_tracker/data/expenses_data.dart';
import 'package:expenses_tracker/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    // final themeConnector =
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
          IconButton(
            onPressed: () {
              Provider.of<AppThemeProvider>(context, listen: false)
                  .tooglingTheme();
            },
            icon: Icon(
              Provider.of<AppThemeProvider>(context, listen: false)
                      .isItDarkOrLight
                  ? Icons.light_mode
                  : Icons.dark_mode,
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
