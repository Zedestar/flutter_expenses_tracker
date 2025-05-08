import 'package:flutter/material.dart';

void theSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Item deleted',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating,
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      duration: Duration(seconds: 3),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      action: SnackBarAction(
        label: 'UNDO',
        textColor: Colors.white,
        onPressed: () {
          // Undo logic
        },
      ),
    ),
  );
}
