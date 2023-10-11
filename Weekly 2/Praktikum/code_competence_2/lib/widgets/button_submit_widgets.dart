import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonSubmitWidget extends StatelessWidget {
  final VoidCallback onSubmit;
  const ButtonSubmitWidget({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: onSubmit,
          child: Text(
            'Send Contact',
            style:
                GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
