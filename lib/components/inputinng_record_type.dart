import 'package:expenses_tracker/components/customized_text_input_field.dart';
import 'package:flutter/material.dart';

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
    print("The record type is saved");
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
