import 'package:expenses_tracker/pages/expenses.dart';
import 'package:expenses_tracker/pages/income_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    ExpensesPage(),
    IncomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.money_off_csred),
            label: "Expenses",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: "Incomes",
          ),
        ],
      ),
    );
  }
}
