import 'package:expenses_tracker/pages/expenses.dart';
import 'package:expenses_tracker/provider/expenses_list_provider.dart';
import 'package:expenses_tracker/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expenses_tracker/theme/light_theme.dart';

main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ExpensesListProvider()),
        ChangeNotifierProvider(create: (context) => AppThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<AppThemeProvider>(context).gettingTheAppTheme,
      home: Expenses(),
    );
  }
}
