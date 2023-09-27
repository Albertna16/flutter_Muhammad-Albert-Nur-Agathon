import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final int? maxLines;
  final ValueNotifier<int>? messageLength;
  const TextFieldWidget({
    super.key,
    required this.labelText,
    required this.controller,
    this.maxLines,
    required this.hintText,
    this.messageLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white70,
            hintText: hintText,
            suffix: messageLength != null
                ? ValueListenableBuilder<int>(
                    valueListenable: messageLength!,
                    builder: (context, length, child) {
                      return Text(
                        '${70 - length}',
                        style: TextStyle(
                          color: length <= 70 ? Colors.green : Colors.red,
                          fontSize: 12.0,
                        ),
                      );
                    },
                  )
                : null,
          ),
          maxLines: maxLines,
        ),
      ],
    );
  }
}
