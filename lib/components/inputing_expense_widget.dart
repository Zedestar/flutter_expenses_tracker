import 'package:expenses_tracker/components/alert_dialogy.dart';
import 'package:expenses_tracker/data/local/db/app_db.dart';
import 'package:expenses_tracker/model/expense.dart';
import 'package:expenses_tracker/provider/expenses_list_provider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as drift;

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
  DateTime? theDatePicked;
  Category? _categorySelected;

  @override
  void initState() {
    super.initState();
    _db = AppDb();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
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
        _categorySelected == null) {
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
      // id: drift.Value(uuid.v4()),
      expensesName: drift.Value(_titleController.text.trim()),
      expensesCategory: drift.Value(_categorySelected!.name),
      expensesAmount: drift.Value(theAmount),
      expensesDate: drift.Value(theDatePicked!),
      expensesDescription: drift.Value(
          "This is just as description as for now ther is now its textfield"),
    );

    // Adding the new expense to the database
    _db.insertingNewExpense(newExpense).then(
          (value) => ScaffoldMessenger.of(context).showMaterialBanner(
            MaterialBanner(
              content: Text("The new expenses is added $value}"),
              actions: [
                TextButton(
                  onPressed: () =>
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                  child: Text("Close"),
                ),
              ],
            ),
          ),
        );
    expensesProviderConnector.addExpensesInExpensesList(
      title: _titleController.text.trim(),
      amount: theAmount,
      date: theDatePicked!,
      category: _categorySelected!,
    );
    Navigator.pop(context);
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
            TextField(
              maxLength: 50,
              controller: _titleController,
              decoration: InputDecoration(
                hintText: "Enter the kind of expenses",
                label: Text("Expenses"),
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _amountController,
                    decoration: InputDecoration(
                      hintText: "Enter the amount",
                      prefixText: "\$",
                      label: Text("Amount"),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        theDatePicked == null
                            ? "No date selected"
                            : formatter.format(theDatePicked!),
                      ),
                      IconButton(
                        onPressed: _showDatePicker,
                        icon: Icon(
                          Icons.calendar_month,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            DropdownButton(
              hint: Text(
                _categorySelected == null
                    ? "Choose category"
                    : _categorySelected.toString().toUpperCase(),
              ),
              items: Category.values
                  .map(
                    (element) => DropdownMenuItem(
                      value: element,
                      child: Text(
                        element.name.toUpperCase(),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (element) {
                setState(() {
                  _categorySelected = element;
                });
              },
            ),
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
