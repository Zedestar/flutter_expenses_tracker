import 'package:expenses_tracker/components/expense_item.dart';
import 'package:expenses_tracker/model/expense.dart';
import 'package:expenses_tracker/provider/expenses_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    // required this.expenses,
  });

  // final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    final expensesProviderConnector = Provider.of<ExpensesListProvider>(
      context,
      listen: false,
    );
    return Column(
      children: [
        // Text("List expenses"),
        Expanded(
          child: Consumer<ExpensesListProvider>(
            builder: (context, expensesItem, child) {
              return ListView.builder(
                itemCount: expensesItem.getExpensesList.length,
                itemBuilder: (context, index) => Dismissible(
                  key: ValueKey(expensesItem.getExpensesList[index].id),
                  onDismissed: (direction) {
                    final Expense theItemToBeRemoved =
                        expensesItem.getExpensesList[index];
                    final int theRemovedIndex = index;
                    expensesProviderConnector.removeExpensesInExpensesList(
                        // expensesItem.getExpensesList[index],
                        theItemToBeRemoved);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Item deleted',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.redAccent,
                        behavior: SnackBarBehavior.floating,
                        elevation: 6.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        duration: Duration(seconds: 3),
                        margin: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10.0),
                        action: SnackBarAction(
                          label: 'UNDO',
                          textColor: Colors.white,
                          onPressed: () {
                            // final Expense expense =
                            //     expensesItem.getExpensesList[index];
                            // final int theItemIndex =
                            //     expensesItem.getExpensesList.indexOf(expense);
                            expensesProviderConnector.insertTheDeletedItem(
                                index: theRemovedIndex,
                                expense: theItemToBeRemoved);
                          },
                        ),
                      ),
                    );
                  },
                  child: ExpenseItem(
                    expense: expensesItem.getExpensesList[index],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
