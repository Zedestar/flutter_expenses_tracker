import 'package:expenses_tracker/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

PreferredSizeWidget buildResponsiveAppBar(
    {required BuildContext context, required String appBarTitle}) {
  double screenWidth = MediaQuery.of(context).size.width;
  final isDark =
      Provider.of<AppThemeProvider>(context, listen: false).isItDarkOrLight;

  ;

  return AppBar(
    title: Text(
      appBarTitle,
      style: TextStyle(
        fontSize: screenWidth < 350 ? 16 : 20,
      ),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {
          Provider.of<AppThemeProvider>(context, listen: false).tooglingTheme();
        },
        icon: Icon(
          isDark ? Icons.light_mode : Icons.dark_mode,
          size: screenWidth < 350 ? 20 : 24,
        ),
      ),
    ],
  );
}
