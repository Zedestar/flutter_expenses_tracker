import 'package:expenses_tracker/data/local/db/app_db.dart';
import 'package:expenses_tracker/model/expense.dart';
import 'package:expenses_tracker/provider/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RecordTypeItem extends StatefulWidget {
  RecordTypeItem({super.key, required this.recordType});

  final RecordTypeData? recordType;
  final formatter = DateFormat.yMd();

  @override
  State<RecordTypeItem> createState() => _RecordTypeItemState();
}

class _RecordTypeItemState extends State<RecordTypeItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<AppDatabaseProvider>(context, listen: false)
            .setRecordTypeId(widget.recordType!.id);
        Navigator.pushNamed(context, "/expenses-page");
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.recordType!.recordName.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.recordType!.recordDescription.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                formatter.format(widget.recordType!.recordTimeCreated),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.blueGrey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
