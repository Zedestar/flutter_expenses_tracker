import 'package:flutter/material.dart';

showTheModalSheet(
    {required BuildContext context, required Widget theIputtingPage}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (ctx) {
      return theIputtingPage;
    },
  );
}
