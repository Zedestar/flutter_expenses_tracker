import 'package:expenses_tracker/data/local/db/app_db.dart';
import 'package:flutter/material.dart';

class AppDatabaseProvider with ChangeNotifier {
  AppDatabaseProvider() {
    _db = AppDb();
  }
  late final AppDb _db;
  int? _recordTypeId;

  // the getters
  AppDb get db => _db;
  int? get recordTypeId => _recordTypeId;

  // the setters
  void setRecordTypeId(int id) {
    _recordTypeId = id;
    notifyListeners();
  }

  Stream<List<double>> get expensesAmountStream {
    return _db.getAllExpenses(_recordTypeId!).map((expenses) {
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
