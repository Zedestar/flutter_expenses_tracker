import 'package:flutter/material.dart';

void customMaterialBanner(
    {required BuildContext context,
    required String message,
    required String actionText}) {
  final messenger = ScaffoldMessenger.of(context);
  messenger.showMaterialBanner(
    MaterialBanner(
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            messenger.hideCurrentMaterialBanner();
          },
          child: Text(actionText),
        ),
      ],
    ),
  );
}
