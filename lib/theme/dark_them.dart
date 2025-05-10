import 'package:flutter/material.dart';

ThemeData buildAppDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark, // Dark theme brightness
    primarySwatch: Colors.teal,
    scaffoldBackgroundColor:
        Colors.grey[900], // Dark background for the scaffold

    // Global text styles
    textTheme: TextTheme(
      headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white), // White text for headlines
      bodyMedium: TextStyle(
          fontSize: 16, color: Colors.white70), // Light grey text for body
    ),

    // AppBar styling
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.teal[800], // Dark teal background for AppBar
      foregroundColor: Colors.white, // White text and icons in AppBar
      elevation: 4,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    ),

    // Button styles
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal[700], // Dark teal button background
        foregroundColor: Colors.white, // White button text
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.teal, // Teal text for text buttons
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side:
            BorderSide(color: Colors.teal), // Teal border for outlined buttons
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),

    // TextField styling
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.teal),
      ),
      labelStyle: TextStyle(color: Colors.teal), // Teal label text
    ),

    // Card styling
    cardTheme: CardTheme(
      elevation: 4,
      color: Colors.grey[850], // Dark grey background for cards
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.all(12),
    ),

    // Floating action button
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.teal, // Teal background for the FAB
      foregroundColor: Colors.white, // White text and icons in FAB
    ),

    // Icon styling
    iconTheme: IconThemeData(color: Colors.teal, size: 28), // Teal icons

    // Bottom navigation bar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.teal, // Teal color for selected icons
      unselectedItemColor: Colors.grey, // Light grey color for unselected icons
      backgroundColor: Colors.black, // Dark background for the bottom nav bar
    ),
  );
}
