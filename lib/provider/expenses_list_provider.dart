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

  // Function to add the expenses item
  void addExpensesInExpensesList(
      {required String title,
      required double amount,
      required DateTime date,
      required Category category}) {
    Expense newExpense = Expense(
      title: title,
      amount: amount,
      date: date,
      category: category,
    );
    _expensesList.add(newExpense);
    notifyListeners();
  }

  // The logic to undo the deletion the expense
  void insertTheDeletedItem({required int index, required Expense expense}) {
    _expensesList.insert(index, expense);
    notifyListeners();
  }

  // The method to remove the expenses items
  void removeExpensesInExpensesList(Expense expense) {
    _expensesList.remove(expense);
    notifyListeners();
  }

  List<double> get expensesAmount {
    double totalAmount = 0;
    double totalFood = 0;
    double totalTravel = 0;
    double totalLeisure = 0;
    double totaltWork = 0;
    for (int i = 0; i < getExpensesList.length; i++) {
      if (getExpensesList[i].category == Category.food) {
        totalFood += getExpensesList[i].amount;
      } else if (getExpensesList[i].category == Category.travel) {
        totalTravel += getExpensesList[i].amount;
      } else if (getExpensesList[i].category == Category.leisure) {
        totalLeisure += getExpensesList[i].amount;
      } else if (getExpensesList[i].category == Category.work) {
        totaltWork += getExpensesList[i].amount;
      }
      totalAmount += getExpensesList[i].amount;
    }
    return [totalAmount, totalFood, totalTravel, totalLeisure, totaltWork];
  }

  // double get totalAmountOfFood {
  //   double totalFood = 0;
  //   for (int i = 0; i < getExpensesList.length; i++) {
  //     totalFood += getExpensesList[i].amount;
  //   }
  //   return totalFood;
  // }

  // double get totalAmountOfTravel {
  //   double totalTravel = 0;
  //   for (int i = 0; i < getExpensesList.length; i++) {
  //     totalTravel += getExpensesList[i].amount;
  //   }
  //   return totalTravel;
  // }

  // double get totalAmountOfLeisure {
  //   double totalLeisure = 0;
  //   for (int i = 0; i < getExpensesList.length; i++) {
  //     totalLeisure += getExpensesList[i].amount;
  //   }
  //   return totalLeisure;
  // }

  // double get totalAmountOfWork {
  //   double totaltWork = 0;
  //   for (int i = 0; i < getExpensesList.length; i++) {
  //     totaltWork += getExpensesList[i].amount;
  //   }
  //   return totaltWork;
  // }
}
