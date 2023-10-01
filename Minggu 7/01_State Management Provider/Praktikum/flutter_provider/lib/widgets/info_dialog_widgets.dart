import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InforDialogWidgets extends StatelessWidget {
  final String textLabel;
  final Widget textValue;
  const InforDialogWidgets({
    super.key,
    required this.textLabel,
    required this.textValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textLabel,
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
        ),
        textValue,
        const SizedBox(
          height: 12,
        )
      ],
    );
  }
}
