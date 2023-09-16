import 'package:flutter/material.dart';
import 'package:flutter_form/models/contact_models.dart';
import 'package:flutter_form/themes/theme_color.dart';
import 'package:flutter_form/themes/theme_text_style.dart';

class ListContactWidget extends StatelessWidget {
  final Function(int) onEditPressed;
  final Function(int) onDeletePressed;
  const ListContactWidget({super.key, required this.onEditPressed, required this.onDeletePressed});

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
                        onEditPressed(index);
                      },
                      icon: Icon(Icons.edit),
                      iconSize: 24,
                      color: ThemeColor().m3RefNeutral,
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () {
                        onDeletePressed(index);
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
