import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateOptionButton extends StatefulWidget {
  const DateOptionButton(
      {super.key,
      required this.showTheDatePicker,
      required this.theDatePicked});

  final DateTime? theDatePicked;
  final VoidCallback showTheDatePicker;

  @override
  State<DateOptionButton> createState() => _DateOptionButtonState();
}

class _DateOptionButtonState extends State<DateOptionButton> {
  final formatter = DateFormat.yMd();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.theDatePicked == null
              ? "No date selected"
              : formatter.format(widget.theDatePicked!),
        ),
        IconButton(
          onPressed: widget.showTheDatePicker,
          icon: Icon(
            Icons.calendar_month,
          ),
        ),
      ],
    );
  }
}
