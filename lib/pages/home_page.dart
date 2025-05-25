import 'package:expenses_tracker/components/appBar_widget.dart';
import 'package:expenses_tracker/components/customized_column_for_recordType_listing.dart';
import 'package:expenses_tracker/provider/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/inputinng_record_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showTheModalSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return AddingRecordType();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabaseProvider>(context, listen: false);
    return Scaffold(
      appBar: buildResponsiveAppBar(
        context: context,
        appBarTitle: 'Home Page',
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                child: SizedBox(
              height: 300, // Control height here
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  "assets/images/expense.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            )),
            ListTile(
              leading: Icon(Icons.developer_mode),
              title: Text('Developer Info'),
              onTap: () {
                Navigator.pushNamed(context, '/developer-page');
              },
            ),
            ListTile(
              leading: Icon(Icons.help_center),
              title: Text('Help and support'),
              onTap: () {
                Navigator.pushNamed(context, '/help-page');
              },
            ),
            // Add more list tiles as needed
          ],
        ),
      ),
      body: StreamedColumnForRecordTypeItems(
        recordTypeList: db.db.getAllRecordTypes(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showTheModalSheet,
        child: Icon(Icons.add),
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