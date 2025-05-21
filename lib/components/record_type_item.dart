import 'package:expenses_tracker/data/local/db/app_db.dart';
import 'package:expenses_tracker/provider/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecordTypeItem extends StatefulWidget {
  const RecordTypeItem({super.key, required this.recordType});

  final RecordTypeData? recordType;

  @override
  State<RecordTypeItem> createState() => _RecordTypeItemState();
}

class _RecordTypeItemState extends State<RecordTypeItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(
          "Tapped on ${widget.recordType!.recordName} and of ID ${widget.recordType!.id}",
        );
        Provider.of<AppDatabaseProvider>(context, listen: false)
            .setRecordTypeId(widget.recordType!.id);
        Navigator.pushNamed(context, "/expenses-page");
      },
      child: Card(
        child: Column(
          children: [
            Text(widget.recordType!.recordName.toString()),
            Text(widget.recordType!.recordDescription.toString()),
          ],
        ),
      ),
    );
  }
}
