import 'package:expenses_tracker/pages/analysis_page.dart';
import 'package:expenses_tracker/pages/expenses_page.dart';
import 'package:expenses_tracker/pages/home_page.dart';
import 'package:expenses_tracker/pages/income_page.dart';
import 'package:expenses_tracker/pages/view_expenses_page.dart';
import 'package:expenses_tracker/pages/view_income_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/expenses-page':
        return MaterialPageRoute(builder: (_) => const ExpensesPage());
      case '/view-expenses':
        if (args is int) {
          return MaterialPageRoute(builder: (_) => ViewExpenses(id: args));
        } else {
          return _errorRoute();
        }
      case '/view-income':
        if (args is int) {
          return MaterialPageRoute(builder: (_) => ViewIncome(id: args));
        } else {
          return _errorRoute();
        }
      case '/income-page':
        return MaterialPageRoute(builder: (_) => const IncomePage());
      case '/analysis-page':
        return MaterialPageRoute(builder: (_) => const AnalysisPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Error"),
          ),
          body: const Center(
            child: Text("Sorry no route was found!!!!"),
          ),
        );
      },
    );
  }
}
