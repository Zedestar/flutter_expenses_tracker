import 'package:expenses_tracker/components/categories_list.dart';
import 'package:expenses_tracker/components/customized_charts_streamed_widget.dart';
// import 'package:expenses_tracker/components/customized_column_showing_expense_itemsList.dart';
import 'package:expenses_tracker/components/customized_column_showing_income_itemsList.dart';
import 'package:expenses_tracker/provider/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncomeList extends StatefulWidget {
  const IncomeList({super.key});

  @override
  State<IncomeList> createState() => _IncomeListState();
}

class _IncomeListState extends State<IncomeList> {
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabaseProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Expenses Chart"),
          StreamedBarChart(
            expensesStream: db.expensesAmountStream,
            categoires: InputCategories,
          ),
          StreamedColumnForIncomeItem(
            incomeList: db.db.getAllIncome(db.recordTypeId!),
          ),
        ],
      ),
    );
  }
}

// StreamedColumnForIncomeItem
