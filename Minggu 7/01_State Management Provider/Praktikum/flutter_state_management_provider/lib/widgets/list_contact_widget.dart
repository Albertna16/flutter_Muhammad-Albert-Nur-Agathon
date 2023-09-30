import 'package:flutter/material.dart';
import 'package:flutter_state_management_provider/models/contact_models.dart';
import 'package:flutter_state_management_provider/provider/contact_provider.dart';
import 'package:flutter_state_management_provider/themes/theme_color.dart';
import 'package:flutter_state_management_provider/themes/theme_text_style.dart';
import 'package:provider/provider.dart';

class ListContactWidget extends StatelessWidget {
  const ListContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);
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
                        contactProvider.editContact(index);
                      },
                      icon: Icon(Icons.edit),
                      iconSize: 24,
                      color: ThemeColor().m3RefNeutral,
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () {
                        contactProvider.deleteContact(index);
                      },
                      icon: Icon(Icons.delete),
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
