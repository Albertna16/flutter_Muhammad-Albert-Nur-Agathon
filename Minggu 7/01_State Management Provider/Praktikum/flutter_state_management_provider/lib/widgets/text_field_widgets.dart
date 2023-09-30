import 'package:flutter/material.dart';
import 'package:flutter_state_management_provider/themes/theme_color.dart';
import 'package:flutter_state_management_provider/themes/theme_text_style.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  const TextFieldWidget({super.key, required this.label, required this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 7,
        bottom: 7,
        left: 16,
        right: 16,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: ThemeColor().m3SysLightSurfaceVariant,
          label: Text(label),
          labelStyle: ThemeTextStyle().m3BodySmall,
          hintText: hintText,
          hintStyle: ThemeTextStyle().m3BodyLarge,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
