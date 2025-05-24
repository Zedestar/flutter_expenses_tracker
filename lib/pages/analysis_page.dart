import 'package:expenses_tracker/components/appBar_widget.dart';
import 'package:expenses_tracker/provider/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({super.key});

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final radiusSize =
        (size.height >= size.width ? size.width : size.height) * 0.4;

    return Scaffold(
      appBar: buildResponsiveAppBar(
        context: context,
        appBarTitle: "Analysis Page",
      ),
      body: StreamBuilder<List<double>>(
        stream: Provider.of<AppDatabaseProvider>(context).combinedTotalsStream,
        builder: (context, snapshot) {
          final recordTypeId =
              Provider.of<AppDatabaseProvider>(context).recordTypeId;

          if (recordTypeId == null) {
            return const Center(child: Text("No record selected."));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text("No data found"));
          }

          final totalExpenses = snapshot.data![0];
          final totalIncome = snapshot.data![1];

          return SingleChildScrollView(
            child: Container(
              height: size.height,
              padding: const EdgeInsets.all(16.0),
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: totalExpenses,
                      color: const Color.fromARGB(103, 212, 48, 48),
                      title: "Expenses",
                      radius: radiusSize,
                      titleStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    PieChartSectionData(
                      value: totalIncome,
                      color: const Color.fromARGB(120, 46, 224, 52),
                      title: "Income",
                      radius: radiusSize,
                      titleStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                  sectionsSpace: 1,
                  centerSpaceRadius: 10,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
