import 'package:flutter/material.dart';

class CustomedTextInputField extends StatelessWidget {
  const CustomedTextInputField(
      {super.key,
      required TextEditingController descriptionController,
      required this.textLabel,
      required this.textHint,
      required this.maxlength,
      required this.textInputType})
      : _descriptionController = descriptionController;

  final TextEditingController _descriptionController;
  final String textHint;
  final Text textLabel;
  final TextInputType textInputType;
  final int maxlength;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxlength,
      controller: _descriptionController,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: textHint,
        label: textLabel,
      ),
    );
  }
}
