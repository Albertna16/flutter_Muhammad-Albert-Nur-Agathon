import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assets_dialog_and_navigation/models/contact_models.dart';
import 'package:flutter_assets_dialog_and_navigation/themes/theme_color.dart';
import 'package:flutter_assets_dialog_and_navigation/themes/theme_text_style.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as path;

class ListContactWidget extends StatelessWidget {
  final Function(int) onEditPressed;
  final Function(int) onDeletePressed;
  final Color selectedColor;
  final DateTime selectedDate;
  final PlatformFile selectedFile;
  const ListContactWidget({
    super.key,
    required this.onEditPressed,
    required this.onDeletePressed,
    required this.selectedColor,
    required this.selectedDate,
    required this.selectedFile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "List of Contacts",
            style: ThemeTextStyle().m3HeadLineSmall,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: contactList.length,
            itemBuilder: (context, int index) {
              final ContactModels contact = contactList[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: ThemeColor().m3SysLightPrimaryContainer,
                  child: Text(
                    contact.name[0],
                    style: ThemeTextStyle().m3TitleMedium,
                  ),
                ),
                title: Text(
                  contact.name,
                  style: ThemeTextStyle().m3BodyLarge,
                ),
                subtitle: Text(
                  contact.number,
                  style: ThemeTextStyle().m3BodyMedium,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        _showContactDetail(context, contact);
                      },
                      icon: const Icon(Icons.info),
                      iconSize: 24,
                      color: ThemeColor().m3RefNeutral,
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {
                        onEditPressed(index);
                      },
                      icon: const Icon(Icons.edit),
                      iconSize: 24,
                      color: ThemeColor().m3RefNeutral,
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {
                        onDeletePressed(index);
                      },
                      icon: const Icon(Icons.delete),
                      iconSize: 24,
                      color: ThemeColor().m3RefNeutral,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

void _showContactDetail(BuildContext context, ContactModels contact) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          "Data Lengkap Kontak",
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Nama: ${contact.name}",
              style: ThemeTextStyle().m3BodyMedium,
            ),
            Text(
              "Nomor: ${contact.number}",
              style: ThemeTextStyle().m3BodyMedium,
            ),
            Text(
              "Tanggal: ${DateFormat('EEEE, dd-MM-yyyy').format(contact.date)}",
              style: ThemeTextStyle().m3BodyMedium,
            ),
            Row(
              children: [
                Text(
                  "Warna: ",
                  style: ThemeTextStyle().m3BodyMedium,
                ),
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: contact.color,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            Text(
              "File: ${path.basename(contact.file.path.toString())}",
              style: ThemeTextStyle().m3BodyMedium,
            ),
          ],
        ),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ThemeColor().m3SysLightPrimary,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Kembali",
              style: ThemeTextStyle().m3LabelLarge,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ThemeColor().m3SysLightPrimary,
            ),
            onPressed: () {
              OpenFile.open(contact.file.path);
            },
            child: Text(
              "Buka File",
              style: ThemeTextStyle().m3LabelLarge,
            ),
          ),
        ],
      );
    },
  );
}
