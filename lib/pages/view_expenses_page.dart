import 'package:drift/drift.dart' as drift;
import 'package:expenses_tracker/components/appBar_widget.dart';
import 'package:expenses_tracker/components/categories_list.dart';
import 'package:expenses_tracker/components/themed_contaier.dart';
import 'package:expenses_tracker/data/local/db/app_db.dart';
import 'package:expenses_tracker/functions/customized_styled_row_for_showing_item.dart';
import 'package:expenses_tracker/provider/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../components/dropdown_category.dart';
import 'package:expenses_tracker/components/customized_text_input_field.dart';

class ViewExpenses extends StatefulWidget {
  const ViewExpenses({super.key, required this.id});
  final int id;

  @override
  State<ViewExpenses> createState() => _ViewExpensesState();
}

class _ViewExpensesState extends State<ViewExpenses> {
  // late final AppDb _db;
  final formatter = DateFormat.yMd();
  bool edit = false;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? theDatePicked;
  String? _categorySelected;

  void _setControllersFromExpense(ExpensesTableData expense) {
    _titleController.text = expense.expensesName;
    _amountController.text = expense.expensesAmount.toString();
    _descriptionController.text = expense.expensesDescription ?? '';
    _categorySelected = expense.expensesCategory;
  }

  @override
  void initState() {
    super.initState();
    // _db = AppDb();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
    ;
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabaseProvider>(context, listen: false).db;
    return Scaffold(
      appBar: buildResponsiveAppBar(
          context: context,
          appBarTitle: "The expense ${_titleController.text}"),
      body: edit
          ? Center(
              child: ThemedContainer(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text("Edit the expenses"),
                      CustomedTextInputField(
                        descriptionController: _titleController,
                        textLabel: const Text("Edit expense name"),
                        textHint: "Enter the name of the expense",
                        maxlength: 50,
                        textInputType: TextInputType.text,
                      ),
                      CustomedTextInputField(
                        descriptionController: _descriptionController,
                        textLabel: const Text("Edit expense description"),
                        textHint: "Edit expenses description",
                        maxlength: 100,
                        textInputType: TextInputType.text,
                      ),
                      CustomedTextInputField(
                        descriptionController: _amountController,
                        textLabel: const Text("Edit expense amount"),
                        textHint: "Edit expenses amount",
                        maxlength: 10,
                        textInputType: TextInputType.number,
                      ),
                      TheDropdownCategory(
                        theFunctionToSetCategory: (value) {
                          setState(() {
                            _categorySelected = value;
                          });
                        },
                        categorySelected: _categorySelected,
                        categories: expensesCategories,
                      ),
                      TextButton(
                        onPressed: () async {
                          await db.updatingTheExpenses(
                            ExpensesTableCompanion(
                              id: drift.Value(widget.id),
                              expensesName: drift.Value(_titleController.text),
                              expensesAmount: drift.Value(
                                  double.parse(_amountController.text)),
                              expensesCategory: drift.Value(_categorySelected!),
                              expensesDescription:
                                  drift.Value(_descriptionController.text),
                              expensesDate:
                                  drift.Value(theDatePicked ?? DateTime.now()),
                            ),
                          );
                          setState(() {
                            edit = false;
                          });
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Expense updated successfully"),
                              ),
                            );
                          }
                        },
                        child: const Text("Update the expense"),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Center(
              child: FutureBuilder<ExpensesTableData>(
                future: db.getExpenseById(widget.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return const Text("Error loading data #{snapshopt.error}");
                  } else if (snapshot.hasData) {
                    final expense = snapshot.data!;
                    _setControllersFromExpense(expense);
                    // _titleController =
                    //     TextEditingController(text: expense.expensesName);
                    return ThemedContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildStyledRow("Expense Name", expense.expensesName),
                          buildStyledRow("Expense Amount",
                              expense.expensesAmount.toString()),
                          buildStyledRow(
                              "Expense Category", expense.expensesCategory),
                          buildStyledRow("Expense Descript",
                              expense.expensesDescription.toString()),
                          buildStyledRow(
                              "Date", formatter.format(expense.expensesDate)),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: const Text("No data found"),
                    );
                  }
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            edit = !edit;
            // _setControllersFromExpense(expense);
          });
        },
        child: Text(edit ? "cancel" : "Edit"),
        backgroundColor: edit
            ? const Color.fromARGB(189, 77, 112, 11)
            : const Color.fromARGB(190, 28, 126, 11),
      ),
    );
  }
}
