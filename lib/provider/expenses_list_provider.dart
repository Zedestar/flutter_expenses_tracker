import 'package:expenses_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpensesListProvider with ChangeNotifier {
  final List<Expense> _expensesList = [
    Expense(
      title: "Mikumi National Park",
      amount: 17.98,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: "GYM",
      amount: 50.98,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  List<Expense> get getExpensesList {
    return _expensesList;
  }

  void addExpensesInExpensesList({
    required String title,
    required double amount,
    required DateTime date,
    required Category category,
  }) {
    Expense newExpense =
        Expense(title: title, amount: amount, date: date, category: category);
    _expensesList.add(newExpense);
    notifyListeners();
  }
}
