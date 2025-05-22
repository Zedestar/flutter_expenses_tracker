import 'package:expenses_tracker/components/income_item.dart';
import 'package:expenses_tracker/data/local/db/app_db.dart';
import 'package:expenses_tracker/provider/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamedColumnForIncomeItem extends StatefulWidget {
  const StreamedColumnForIncomeItem({super.key, required this.incomeList});

  final Stream<List<IncomeTableData>> incomeList;

  @override
  State<StreamedColumnForIncomeItem> createState() =>
      _StreamedColumnForIncomeItemState();
}

class _StreamedColumnForIncomeItemState
    extends State<StreamedColumnForIncomeItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650,
      child: StreamBuilder(
        stream: widget.incomeList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List<IncomeTableData> incomeList = snapshot.data!;
            return ListView.builder(
                itemCount: incomeList.length,
                itemBuilder: (context, index) {
                  // The incomeItem will be replaced   IncomeItem
                  return IncomeItem(
                    income: incomeList[index],
                  );
                });
          } else {
            return Center(
              child: Text(
                  "No data found ${Provider.of<AppDatabaseProvider>(context).recordTypeId}"),
            );
          }
        },
      ),
    );
  }
}

// class _StreamedColumnForExpenseItemsState
//     extends State<StreamedColumnForExpenseItems> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 650,
//       child: StreamBuilder<List<ExpensesTableData>>(
//         stream: widget.expensesList,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text("Error: ${snapshot.error}"),
//             );
//           } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
//             List<ExpensesTableData> expensesList = snapshot.data!;
//             return ListView.builder(
//                 itemCount: expensesList.length,
//                 itemBuilder: (context, index) {
//                   return ExpenseItem(
//                     expense: expensesList[index],
//                   );
//                 });
//           } else {
//             return Center(
//               child: Text(
//                   "No data found ${Provider.of<AppDatabaseProvider>(context).recordTypeId}"),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
