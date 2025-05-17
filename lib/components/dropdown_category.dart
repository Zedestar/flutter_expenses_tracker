import 'package:expenses_tracker/functions/function_taking_one_parameter.dart';
import 'package:flutter/material.dart';

class TheDropdownCategory extends StatefulWidget {
  TheDropdownCategory(
      {super.key,
      required this.theFunctionToSetCategory,
      required this.categorySelected});

  final FunctionWithOneParameter theFunctionToSetCategory;
  final String? categorySelected;
  final List<String> categories = [
    "food",
    "travel",
    "leisure",
    "work",
  ];

  @override
  State<TheDropdownCategory> createState() => _TheDropdownCategoryState();
}

class _TheDropdownCategoryState extends State<TheDropdownCategory> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text(
        widget.categorySelected == null
            ? "Choose category"
            : widget.categorySelected!.toUpperCase(),
      ),
      items: widget.categories
          .map(
            (element) => DropdownMenuItem(
              value: element,
              child: Text(
                element.toUpperCase(),
              ),
            ),
          )
          .toList(),
      onChanged: (element) {
        print(element);
        widget.theFunctionToSetCategory(element!);
      },
    );
  }
}
