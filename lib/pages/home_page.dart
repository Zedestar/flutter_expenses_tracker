import 'package:expenses_tracker/components/customized_column_for_recordType_listing.dart';
import 'package:expenses_tracker/provider/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabaseProvider>(context, listen: false);
    return Scaffold(
      body: StreamedColumnForRecordTypeItems(
        recordTypeList: db.db.getAllRecordTypes(),
      ),
    );
  }
}




































// ##########  THE PREVIOUS LOGIC CODE ##########


//  int _selectedIndex = 0;

//   final List<Widget> _screens = [
//     ExpensesPage(),
//     IncomePage(),
//   ];


// body: _screens[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.money_off_csred),
//             label: "Expenses",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.attach_money),
//             label: "Incomes",
//           ),
//         ],
//       ),