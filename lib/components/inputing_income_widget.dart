import 'package:expenses_tracker/components/alert_dialogy.dart';
import 'package:expenses_tracker/components/banner_for_displaying_message.dart';
import 'package:expenses_tracker/components/categories_list.dart';
import 'package:expenses_tracker/components/customize_date_widget.dart';
import 'package:expenses_tracker/data/local/db/app_db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as drift;
import '../provider/database_provider.dart';
import 'customized_text_input_field.dart';
import 'dropdown_category.dart';

class AddingIncome extends StatefulWidget {
  const AddingIncome({super.key});
  @override
  State<AddingIncome> createState() {
    return _AddingIncomeState();
  }
}

class _AddingIncomeState extends State<AddingIncome> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? theDatePicked;
  String? _categorySelected;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _showDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(
      now.year - 1,
      now.month,
      now.day,
    );

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: theDatePicked ?? now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      theDatePicked = pickedDate;
    });
  }

  void _validateFormAnsSaveData() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final theAmount = double.tryParse(_amountController.text);
    if (theDatePicked == null || _categorySelected == null) {
      showInvalidInputDialog(context);
      return;
    }

    final newIncome = IncomeTableCompanion(
      incomeName: drift.Value(_titleController.text.trim()),
      incomeCategory: drift.Value(_categorySelected!),
      incomeAmount: drift.Value(theAmount!),
      incomeDate: drift.Value(theDatePicked!),
      incomeDescription: drift.Value(_descriptionController.text.trim()),
      ofRecordTypeId: drift.Value(
        Provider.of<AppDatabaseProvider>(context, listen: false).recordTypeId,
      ),
    );
    Provider.of<AppDatabaseProvider>(context, listen: false)
        .db
        .insertingNewIncome(newIncome);
    customMaterialBanner(
        context: context,
        message: "${newIncome.incomeName} successful added",
        actionText: "Close");

    Navigator.pop(context);
  }

  void _setCategory(String categoryName) {
    setState(() {
      _categorySelected = categoryName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        16,
      ),
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomedTextInputField(
                descriptionController: _titleController,
                textLabel: Text("Income Name"),
                textHint: "Enter the name of the Income",
                textInputType: TextInputType.text,
                maxlength: 100,
              ),
              CustomedTextInputField(
                descriptionController: _descriptionController,
                textLabel: Text("Description"),
                textHint: "Enter the income description",
                textInputType: TextInputType.text,
                maxlength: 100,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomedTextInputField(
                        textInputType: TextInputType.number,
                        descriptionController: _amountController,
                        textLabel: Text("Amount"),
                        textHint: "Enter the amount",
                        maxlength: 10),
                  ),
                  Expanded(
                    child: DateOptionButton(
                      showTheDatePicker: _showDatePicker,
                      theDatePicked: theDatePicked,
                    ),
                  ),
                ],
              ),
              TheDropdownCategory(
                theFunctionToSetCategory: _setCategory,
                categorySelected: _categorySelected,
                categories: InputCategories,
              ),
              Spacer(),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _validateFormAnsSaveData,
                    child: Text(
                      "Add Income",
                    ),
                  ),
                  Spacer(),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
