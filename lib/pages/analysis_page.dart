import 'package:expenses_tracker/components/appBar_widget.dart';
import 'package:flutter/material.dart';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({super.key});

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildResponsiveAppBar(
        context: context,
        appBarTitle: "Analysis Page",
      ),
      body: Center(
        child: Text(
            "THe is page will be showing the analysis of expenses vs income"),
      ),
    );
  }
}
