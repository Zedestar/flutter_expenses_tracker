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
          Spacer(),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(
                    _titleController.text,
                  );
                  print(
                    _amountController.text,
                  );
                },
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
