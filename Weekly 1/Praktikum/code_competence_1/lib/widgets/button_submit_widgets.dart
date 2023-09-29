import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonSubmitWidget extends StatelessWidget {
  final bool isEditing;
  final VoidCallback onSubmit;
  final VoidCallback onClear;
  const ButtonSubmitWidget({super.key, required this.isEditing, required this.onSubmit, required this.onClear});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: onSubmit,
          child: Text(
            isEditing ? 'Update Contact' : 'Submit Contact',
            style:
                GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        Visibility(
          visible: isEditing,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: onClear,
                  child: Text(
                    "Clear Contact",
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
