import 'package:expenses_tracker/components/inputinng_record_type.dart';
import 'package:expenses_tracker/components/record_type_item.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker/data/local/db/app_db.dart';

class StreamedColumnForRecordTypeItems extends StatefulWidget {
  const StreamedColumnForRecordTypeItems(
      {super.key, required this.recordTypeList});

  final Stream<List<RecordTypeData>> recordTypeList;

  @override
  State<StreamedColumnForRecordTypeItems> createState() =>
      _StreamedColumnForRecordTypeItemsState();
}

class _StreamedColumnForRecordTypeItemsState
    extends State<StreamedColumnForRecordTypeItems> {
  void _showTheModalSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return AddingRecordType();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650,
      child: StreamBuilder<List<RecordTypeData>>(
        stream: widget.recordTypeList,
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
            List<RecordTypeData> recordTypeList = snapshot.data!;
            return ListView.builder(
              itemCount: recordTypeList.length,
              itemBuilder: (context, index) {
                return RecordTypeItem(
                  recordType: recordTypeList[index],
                );
              },
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No data found",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                      onPressed: _showTheModalSheet,
                      child: Text("Start populating the records"))
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

// class StreamedColumnForRecordItems extends StatefulWidget {
//   const StreamedColumnForRecordItems({super.key, required this.expensesList});
//   // here will be used to pass the stream of the expenses list
//   final Stream<List<ExpensesTableData>> expensesList;

//   @override
//   State<StreamedColumnForRecordItems> createState() =>
//       _StreamedColumnForExpenseItemsState();
// }

// class _StreamedColumnForExpenseItemsState
//     extends State<StreamedColumnForRecordItems> {
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
//           } else if (snapshot.hasData) {
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
//               child: Text("No data found"),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
