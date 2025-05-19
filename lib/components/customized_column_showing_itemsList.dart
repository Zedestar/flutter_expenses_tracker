import 'package:expenses_tracker/components/expense_item.dart';
import 'package:expenses_tracker/data/local/db/app_db.dart';
import 'package:flutter/material.dart';

class StreamedColumnForItems extends StatefulWidget {
  const StreamedColumnForItems({super.key, required this.expensesList});
  // here will be used to pass the stream of the expenses list
  final Stream<List<ExpensesTableData>> expensesList;

  @override
  State<StreamedColumnForItems> createState() => _StreamedColumnForItemsState();
}

class _StreamedColumnForItemsState extends State<StreamedColumnForItems> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650,
      child: StreamBuilder<List<ExpensesTableData>>(
        stream: widget.expensesList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<ExpensesTableData> expensesList = snapshot.data!;
            return ListView.builder(
                itemCount: expensesList.length,
                itemBuilder: (context, index) {
                  return ExpenseItem(
                    expense: expensesList[index],
                  );
                });
          } else {
            return Center(
              child: Text("No data found"),
            );
          }
        },
      ),
    );
  }
}
