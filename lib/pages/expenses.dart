import 'package:expenses_tracker/components/expenses_list_builder.dart';
import 'package:expenses_tracker/components/inputing_expense_widget.dart';
import 'package:expenses_tracker/data/expenses_data.dart';
import 'package:expenses_tracker/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});
  @override
  State<ExpensesPage> createState() {
    return _ExpensesPageState();
  }
}

class _ExpensesPageState extends State<ExpensesPage> {
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
