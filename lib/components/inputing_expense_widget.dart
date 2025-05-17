import 'package:expenses_tracker/components/alert_dialogy.dart';
import 'package:expenses_tracker/components/customize_date_widget.dart';
import 'package:expenses_tracker/data/local/db/app_db.dart';
import 'package:expenses_tracker/model/expense.dart';
import 'package:expenses_tracker/provider/expenses_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as drift;
import 'customized_text_input_field.dart';
import 'dropdown_category.dart';

class AddingExpenses extends StatefulWidget {
  const AddingExpenses({super.key});
  @override
  State<AddingExpenses> createState() {
    return _AddingExpensesState();
  }
}

class _AddingExpensesState extends State<AddingExpenses> {
  late AppDb _db;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? theDatePicked;
  String? _categorySelected;

  @override
  void initState() {
    super.initState();
    _db = AppDb();
  }

  @override
  void dispose() {
    _db.close();
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
    final theAmount = double.tryParse(_amountController.text);
    final invalidAmount = theAmount == null || theAmount < 0;
    if (invalidAmount ||
        _titleController.text.trim().isEmpty ||
        theDatePicked == null ||
        _categorySelected == null ||
        _descriptionController.text.trim().isEmpty) {
      showInvalidInputDialog(context);
      return;
    }
    // Calling the item to add the item
    final expensesProviderConnector = Provider.of<ExpensesListProvider>(
      context,
      listen: false,
    );

    // Creating the new expense
    final newExpense = ExpensesTableCompanion(
      expensesName: drift.Value(_titleController.text.trim()),
      expensesCategory: drift.Value(_categorySelected!),
      expensesAmount: drift.Value(theAmount),
      expensesDate: drift.Value(theDatePicked!),
      expensesDescription: drift.Value(
        _descriptionController.text.trim(),
      ),
    );

    // Adding the new expense to the database
    _db.insertingNewExpense(newExpense).then((value) {
      ScaffoldMessenger.of(context).showMaterialBanner(
        MaterialBanner(
          content: Text("The new expense is added: $value"),
          actions: [
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              },
              child: Text("Close"),
            ),
          ],
        ),
      );
    });

    // expensesProviderConnector.addExpensesInExpensesList(
    //   title: _titleController.text.trim(),
    //   amount: theAmount,
    //   date: theDatePicked!,
    //   category: _categorySelected!,
    // );
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
        child: Column(
          children: [
            CustomedTextInputField(
              descriptionController: _titleController,
              textLabel: Text("Expenses Name"),
              textHint: "Enter the name of the expenses",
              textInputType: TextInputType.text,
              maxlength: 100,
            ),
            CustomedTextInputField(
              descriptionController: _descriptionController,
              textLabel: Text("Description"),
              textHint: "Enter the expense description",
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
                categorySelected: _categorySelected),
            Spacer(),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _validateFormAnsSaveData,
                  child: Text(
                    "Add Expenses",
                  ),
                ),
                Spacer(),
                ElevatedButton(
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
    );
  }
}
