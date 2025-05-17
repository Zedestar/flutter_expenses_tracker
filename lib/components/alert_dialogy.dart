import 'package:flutter/material.dart';

void showInvalidInputDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.orange),
            SizedBox(width: 8),
            Text("Invalid Input"),
          ],
        ),
        content: SizedBox(
          height: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("• Enter an amount greater than 0."),
              SizedBox(height: 6),
              Text("• Provide a valid title."),
              SizedBox(height: 6),
              Text("• Select a date."),
              SizedBox(height: 6),
              Text("• Choose a category."),
              SizedBox(height: 6),
              Text("• Provide the description."),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
            },
            child: Text(
              "Okay",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      );
    },
  );
}
