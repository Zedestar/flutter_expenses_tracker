import 'package:expenses_tracker/components/alert_dialogy.dart';
import 'package:expenses_tracker/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddingExpenses extends StatefulWidget {
  const AddingExpenses({super.key});
  @override
  State<AddingExpenses> createState() {
    return _AddingExpensesState();
  }
}

class _AddingExpensesState extends State<AddingExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? theDatePicked;
  Category? _cagorySelected;

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
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      theDatePicked = pickedDate;
    });
  }

  void _validateForm() {
    final theAmount = double.tryParse(_amountController.text);
    final invalidAmount = theAmount == null || theAmount < 0;
    if (invalidAmount ||
        _titleController.text.trim().isEmpty ||
        theDatePicked == null ||
        _cagorySelected == null) {
      showInvalidInputDialog(context);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        16,
      ),
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
              _cagorySelected == null
                  ? "Choose category"
                  : _cagorySelected.toString().toUpperCase(),
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
                _cagorySelected = element;
              });
            },
          ),
          Spacer(),
          Row(
            children: [
              ElevatedButton(
                onPressed: _validateForm,
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
    );
  }
}
