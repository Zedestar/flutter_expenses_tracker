import 'package:expenses_tracker/components/appBar_widget.dart';
import 'package:expenses_tracker/components/income_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          buildResponsiveAppBar(context: context, appBarTitle: "Incomes page"),
      body: IncomeList(),
      floatingActionButton: SpeedDial(
        icon: Icons.menu,
        activeIcon: Icons.close,
        children: [
          SpeedDialChild(
            child: Icon(Icons.money_off),
            label: "Expense Page",
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.analytics_sharp),
            label: "Analyize",
            onTap: () {
              Navigator.of(context).pushNamed('/analysis-page');
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.add),
            label: "Add Income",
            onTap: () {},
          )
        ],
      ),
    );
  }
}
