import 'package:flutter/material.dart';
import 'package:flutter_task_storage/models/db_contact_manager.dart';
import 'package:flutter_task_storage/themes/theme_color.dart';
import 'package:flutter_task_storage/themes/theme_text_style.dart';
import 'package:provider/provider.dart';

class DialogWidgets {
  static void showCustomDialog(
    BuildContext context, {
    required String title,
    required Widget content,
    Widget? button,
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
          content: content,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Provider.of<DbContactManager>(context, listen: false).nameController.clear();
                Provider.of<DbContactManager>(context, listen: false).numberController.clear();
              },
              child: Text(
                'Kembali',
                style: ThemeTextStyle().m3LabelLarge,
              ),
            ),
            button ?? const SizedBox(),
          ],
        );
      },
    );
  }
}
