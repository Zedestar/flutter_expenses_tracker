import 'package:expenses_tracker/data/local/db/app_db.dart';
import 'package:flutter/material.dart';

class AppDatabaseProvider with ChangeNotifier {
  AppDatabaseProvider() {
    _db = AppDb();
  }
  late final AppDb _db;

  AppDb get db => _db;

  Stream<List<double>> get expensesAmountStream {
    return _db.getAllExpenses().map((expenses) {
      double totalAmount = 0;
      double totalFood = 0;
      double totalTravel = 0;
      double totalLeisure = 0;
      double totalWork = 0;

      for (var expense in expenses) {
        switch (expense.expensesCategory) {
          case "food":
            totalFood += expense.expensesAmount;
            break;
          case "travel":
            totalTravel += expense.expensesAmount;
            break;
          case "leisure":
            totalLeisure += expense.expensesAmount;
            break;
          case "work":
            totalWork += expense.expensesAmount;
            break;
        }
        totalAmount += expense.expensesAmount;
      }

      return [totalAmount, totalFood, totalTravel, totalLeisure, totalWork];
    });
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }
}
