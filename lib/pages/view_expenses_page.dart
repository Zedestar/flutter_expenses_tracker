import 'package:expenses_tracker/data/local/db/app_db.dart';
import 'package:flutter/material.dart';

class ViewExpenses extends StatefulWidget {
  const ViewExpenses({super.key, required this.id});
  final int id;

  @override
  State<ViewExpenses> createState() => _ViewExpensesState();
}

class _ViewExpensesState extends State<ViewExpenses> {
  late final AppDb _db;

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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Expense ID: ${expense.id}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Amount: ${expense.expensesAmount}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Category: ${expense.expensesCategory}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Category: ${expense.expensesDescription}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Date: ${expense.expensesDate}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              );
            } else {
              return Center(
                child: const Text("No data found"),
              );
            }
          },
        ),
      ),
    );
  }
}
