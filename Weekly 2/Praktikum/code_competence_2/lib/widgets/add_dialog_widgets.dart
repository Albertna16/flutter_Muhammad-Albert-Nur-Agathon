import 'package:flutter/material.dart';

class AddDialogWidgets extends StatelessWidget {
  final String textLabel;
  final String textValue;
  const AddDialogWidgets({super.key, required this.textLabel, required this.textValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textLabel,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(textValue),
        const SizedBox(
          height: 6,
        ),
      ],
    );
  }
}
