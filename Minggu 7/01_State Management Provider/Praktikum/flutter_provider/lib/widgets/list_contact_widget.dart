import 'package:flutter/material.dart';
import 'package:flutter_provider/models/contact_models.dart';
import 'package:flutter_provider/provider/contact_provider.dart';
import 'package:flutter_provider/themes/theme_color.dart';
import 'package:flutter_provider/themes/theme_text_style.dart';
import 'package:flutter_provider/widgets/dialog_widgets.dart';
import 'package:flutter_provider/widgets/info_dialog_widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;

class ListContactWidget extends StatelessWidget {
  const ListContactWidget({super.key});

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
            child: Consumer(
                builder: (context, ContactProvider contactProvider, child) {
              return ListView.builder(
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
                            DialogWidgets.showCustomDialog(
                              context,
                              title: 'Data lengkap kontak',
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InforDialogWidgets(
                                    textLabel: 'Name:',
                                    textValue: Text(
                                      contact.name,
                                    ),
                                  ),
                                  InforDialogWidgets(
                                    textLabel: 'Number:',
                                    textValue: Text(
                                      contact.number,
                                    ),
                                  ),
                                  InforDialogWidgets(
                                    textLabel: 'Date:',
                                    textValue: Text(
                                      DateFormat('EEEE, dd-MM-yyyy')
                                          .format(contact.date),
                                    ),
                                  ),
                                  InforDialogWidgets(
                                    textLabel: 'Color:',
                                    textValue: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        color: contact.color,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  InforDialogWidgets(
                                    textLabel: 'File:',
                                    textValue: Text(
                                      path.basename(
                                          contact.file.path.toString()),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: const Icon(Icons.info),
                          iconSize: 24,
                          color: ThemeColor().m3RefNeutral,
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {
                            contactProvider.editContact(index);
                          },
                          icon: const Icon(Icons.edit),
                          iconSize: 24,
                          color: ThemeColor().m3RefNeutral,
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {
                            contactProvider.deleteContact(index);
                            DialogWidgets.showCustomDialog(
                              context,
                              title: 'Data berhasil dihapus',
                              content: Text(
                                'Data kontak telah berhasil dihapus dari daftar kontak anda!!',
                                style: ThemeTextStyle().m3BodyMedium,
                              ),
                            );
                          },
                          icon: const Icon(Icons.delete),
                          iconSize: 24,
                          color: ThemeColor().m3RefNeutral,
                        ),
                      ],
                    ),
                  );
                },
              );
            })),
      ],
    );
  }
}
