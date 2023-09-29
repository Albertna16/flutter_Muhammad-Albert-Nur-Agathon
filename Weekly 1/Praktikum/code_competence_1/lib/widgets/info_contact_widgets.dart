import 'package:code_competence_1/models/contact_models.dart';
import 'package:code_competence_1/widgets/add_dialog_widgets.dart';
import 'package:flutter/material.dart';

void InfoContactWidgets(BuildContext context, Contact contact) {
  showDialog(
      context: context,
      builder: (contaxt) {
        return AlertDialog(
          title: const Text('Data Lengkap Kontak'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AddDialogWidgets(
                  textLabel: 'First Name', textValue: contact.firstName),
              AddDialogWidgets(
                  textLabel: 'Last Name', textValue: contact.lastName),
              AddDialogWidgets(textLabel: 'Email', textValue: contact.email),
              AddDialogWidgets(
                  textLabel: 'Message', textValue: contact.message),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            )
          ],
        );
      });
}
