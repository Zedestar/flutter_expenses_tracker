import 'package:expenses_tracker/pages/expenses.dart';
import 'package:expenses_tracker/provider/expenses_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ExpensesListProvider(),
        ),
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
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Expenses(),
    );
  }
}
