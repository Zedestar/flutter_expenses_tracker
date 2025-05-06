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

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
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
          TextField(
            keyboardType: TextInputType.number,
            controller: _amountController,
            decoration: InputDecoration(
              hintText: "Enter the amount",
              prefixText: "\$",
              label: Text("Amount"),
            ),
          ),
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
        ],
      ),
    );
  }
}
