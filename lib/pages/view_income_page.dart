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

class ViewIncome extends StatefulWidget {
  const ViewIncome({super.key, required this.id});
  final int id;

  @override
  State<ViewIncome> createState() => _ViewIncomeState();
}

class _ViewIncomeState extends State<ViewIncome> {
  final formatter = DateFormat.yMd();
  bool edit = false;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? theDatePicked;
  String? _categorySelected;

  void _setControllersFromIncome(IncomeTableData income) {
    _titleController.text = income.incomeName;
    _amountController.text = income.incomeAmount.toString();
    _descriptionController.text = income.incomeDescription;
    _categorySelected = income.incomeCategory;
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
          context: context, appBarTitle: "The income ${_titleController.text}"),
      body: edit
          ? Center(
              child: ThemedContainer(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text("Edit the income"),
                      CustomedTextInputField(
                        descriptionController: _titleController,
                        textLabel: const Text("Edit Income name"),
                        textHint: "Enter the name of the income",
                        maxlength: 50,
                        textInputType: TextInputType.text,
                      ),
                      CustomedTextInputField(
                        descriptionController: _descriptionController,
                        textLabel: const Text("Edit income description"),
                        textHint: "Edit income description",
                        maxlength: 100,
                        textInputType: TextInputType.text,
                      ),
                      CustomedTextInputField(
                        descriptionController: _amountController,
                        textLabel: const Text("Edit income amount"),
                        textHint: "Edit income amount",
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
                        categories: InputCategories,
                      ),
                      TextButton(
                        onPressed: () async {
                          await db.updateIncomeItem(
                            IncomeTableCompanion(
                              id: drift.Value(widget.id),
                              incomeName: drift.Value(_titleController.text),
                              incomeAmount: drift.Value(
                                  double.parse(_amountController.text)),
                              incomeCategory: drift.Value(_categorySelected!),
                              incomeDescription:
                                  drift.Value(_descriptionController.text),
                              incomeDate:
                                  drift.Value(theDatePicked ?? DateTime.now()),
                            ),
                          );
                          setState(() {
                            edit = false;
                          });
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Income updated successfully"),
                              ),
                            );
                          }
                        },
                        child: const Text("Income the expense"),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Center(
              child: FutureBuilder<IncomeTableData>(
                future: db.getIcomeById(widget.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return const Text("Error loading data #{snapshopt.error}");
                  } else if (snapshot.hasData) {
                    final income = snapshot.data!;
                    _setControllersFromIncome(income);
                    // _titleController =
                    //     TextEditingController(text: expense.expensesName);
                    return ThemedContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildStyledRow("Expense Name", income.incomeName),
                          buildStyledRow(
                              "Expense Amount", income.incomeAmount.toString()),
                          buildStyledRow(
                              "Expense Category", income.incomeCategory),
                          buildStyledRow("Expense Descript",
                              income.incomeDescription.toString()),
                          buildStyledRow(
                              "Date", formatter.format(income.incomeDate)),
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
