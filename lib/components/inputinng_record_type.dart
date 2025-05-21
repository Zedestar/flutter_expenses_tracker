import 'package:expenses_tracker/components/banner_for_displaying_message.dart';
import 'package:expenses_tracker/provider/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:expenses_tracker/components/customized_text_input_field.dart';
import 'package:expenses_tracker/data/local/db/app_db.dart';
import 'package:provider/provider.dart';

class AddingRecordType extends StatefulWidget {
  const AddingRecordType({super.key});

  @override
  State<AddingRecordType> createState() => _AddingRecordTypeState();
}

class _AddingRecordTypeState extends State<AddingRecordType> {
  final _recordTypeName = TextEditingController();
  final _recordTypeDescription = TextEditingController();
  final _formKeyForRecordTYpe = GlobalKey<FormState>();
  void _validateAndSave() {
    if (!_formKeyForRecordTYpe.currentState!.validate()) {
      return;
    }
    final recordTypeEntity = RecordTypeCompanion(
      recordName: drift.Value(_recordTypeName.text.trim()),
      recordDescription: drift.Value(_recordTypeDescription.text.trim()),
      recordTimeCreated: drift.Value(DateTime.now()),
    );

    Provider.of<AppDatabaseProvider>(context, listen: false)
        .db
        .insertingNewRecordType(recordTypeEntity);

    customMaterialBanner(
      context: context,
      actionText: "OK",
      message: "Record type added successfully",
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _recordTypeDescription.dispose();
    _recordTypeName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 8),
      child: Column(
        children: [
          Text(
            "Enter the record type",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20),
          Form(
            key: _formKeyForRecordTYpe,
            child: Column(
              children: [
                CustomedTextInputField(
                  descriptionController: _recordTypeName,
                  textLabel: Text("Record Name"),
                  textHint: "Enter the record name",
                  maxlength: 100,
                  textInputType: TextInputType.text,
                ),
                CustomedTextInputField(
                  descriptionController: _recordTypeDescription,
                  textLabel: Text("Record Description"),
                  textHint: "Enter the record descripiton",
                  maxlength: 200,
                  textInputType: TextInputType.text,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: _validateAndSave,
                  child: Text("Add Record"),
                ),
                Spacer(),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
