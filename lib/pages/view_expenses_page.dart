import 'package:expenses_tracker/components/themed_contaier.dart';
import 'package:expenses_tracker/data/local/db/app_db.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViewExpenses extends StatefulWidget {
  const ViewExpenses({super.key, required this.id});
  final int id;

  @override
  State<ViewExpenses> createState() => _ViewExpensesState();
}

class _ViewExpensesState extends State<ViewExpenses> {
  late final AppDb _db;

  Widget _buildStyledRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.label_important,
            color: Colors.blueAccent,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: "$label: ",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                children: [
                  TextSpan(
                    text: value,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _db = AppDb();
  }

  @override
  void dispose() {
    super.dispose();
    _db.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The expenses"),
      ),
      body: Center(
        child: FutureBuilder<ExpensesTableData>(
          future: _db.getExpenseById(widget.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text("Error loading data #{snapshopt.error}");
            } else if (snapshot.hasData) {
              final expense = snapshot.data!;
              return ThemedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStyledRow("Expense Name", expense.expensesName),
                    _buildStyledRow(
                        "Expense Amount", expense.expensesAmount.toString()),
                    _buildStyledRow(
                        "Expense Category", expense.expensesCategory),
                    _buildStyledRow("Expense Descript",
                        expense.expensesDescription.toString()),
                    _buildStyledRow(
                        "Date", expense.expensesDate.toIso8601String()),
                  ],
                ),
              );
            } else {
              return Center(
                child: const Text("No data found"),
              );
            }
          },
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: null, child: Text("Edit")),
    );
  }
}
