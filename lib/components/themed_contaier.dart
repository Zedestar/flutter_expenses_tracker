import 'package:flutter/material.dart';

class ThemedContainer extends StatelessWidget {
  ThemedContainer({super.key, required this.child});

  final Widget child;
  final colorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(190, 28, 126, 11),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
