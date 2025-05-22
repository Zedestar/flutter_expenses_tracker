import 'package:expenses_tracker/components/appBar_widget.dart';
import 'package:expenses_tracker/components/expenses_list_builder.dart';
import 'package:expenses_tracker/components/inputing_expense_widget.dart';
import 'package:expenses_tracker/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
    return Scaffold(
      appBar: buildResponsiveAppBar(
        context: context,
        appBarTitle: 'Expenses Page',
      ),
      body: ExpensesList(),
      floatingActionButton: SpeedDial(
        icon: Icons.menu,
        activeIcon: Icons.close,
        children: [
          SpeedDialChild(
            child: Icon(Icons.home),
            label: 'Home page',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.attach_money),
            label: 'Income Page',
            onTap: () {
              Navigator.of(context).pushNamed('/income-page');
            },
          ),
          SpeedDialChild(
              child: Icon(Icons.add),
              label: 'Add Expense',
              onTap: _showTheModalSheet),
        ],
      ),
    );
  }
}
