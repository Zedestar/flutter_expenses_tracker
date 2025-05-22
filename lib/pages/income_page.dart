import 'package:expenses_tracker/components/appBar_widget.dart';
import 'package:flutter/material.dart';

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
      body: Center(
        child: Text('Income Page'),
      ),
    );
  }
}
