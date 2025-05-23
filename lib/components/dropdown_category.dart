import 'package:expenses_tracker/components/categories_list.dart';
import 'package:expenses_tracker/functions/function_taking_one_parameter.dart';
import 'package:flutter/material.dart';

class TheDropdownCategory extends StatefulWidget {
  const TheDropdownCategory({
    super.key,
    required this.theFunctionToSetCategory,
    required this.categorySelected,
    required this.categories,
  });

  final FunctionWithOneParameter theFunctionToSetCategory;
  final String? categorySelected;
  final List<String> categories;

  @override
  State<TheDropdownCategory> createState() => _TheDropdownCategoryState();
}

class _TheDropdownCategoryState extends State<TheDropdownCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: DropdownButton(
        icon: const Icon(
          Icons.arrow_drop_down,
        ),
        isExpanded: true,
        borderRadius: BorderRadius.circular(10),
        hint: Text(
          widget.categorySelected == null
              ? "Choose category"
              : widget.categorySelected!.toUpperCase(),
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
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
          widget.theFunctionToSetCategory(element!);
        },
      ),
    );
  }
}
