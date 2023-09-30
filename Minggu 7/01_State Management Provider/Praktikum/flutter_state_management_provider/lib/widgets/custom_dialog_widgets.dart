import 'package:flutter/material.dart';
import 'package:flutter_state_management_provider/themes/theme_color.dart';
import 'package:flutter_state_management_provider/themes/theme_text_style.dart';

class DialogUtils {
  static void showCustomDialog(BuildContext context, {
    required String title,
    required String content,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ThemeColor().m3SysLightOnPrimary,
          title: Text(
            title,
            style: ThemeTextStyle().m3HeadLineSmall,
          ),
          content: Text(
            content,
            style: ThemeTextStyle().m3BodyMedium,
            textAlign: TextAlign.justify,
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ThemeColor().m3SysLightPrimary,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Ok",
                style: ThemeTextStyle().m3LabelLarge,
              ),
            ),
          ],
        );
      },
    );
  }
}
