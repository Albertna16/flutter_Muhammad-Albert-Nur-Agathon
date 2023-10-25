import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  const TextFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: controller,
        validator: (String? value) {
          bool isInvalid =
              value == null || value.isEmpty || int.tryParse(value) == null;

          if (isInvalid) {
            return 'silakan masukkan nomor yang valid';
          }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[300],
          label: Text(label),
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
