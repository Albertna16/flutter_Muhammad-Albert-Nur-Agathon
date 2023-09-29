import 'package:code_competence_1/models/contact_models.dart';
import 'package:code_competence_1/widgets/info_contact_widgets.dart';
import 'package:flutter/material.dart';

class ListViewWidgets extends StatelessWidget {
  final List<Contact> contactList;
  final Function(int) onEditPressed;
  final Function(int) onDeletePressed;
  const ListViewWidgets({super.key, required this.contactList, required this.onEditPressed, required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: contactList.length,
      itemBuilder: (context, int index) {
        final Contact contact = contactList[index];
        return Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white70,
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white70,
              child: Text(contact.firstName[0]),
            ),
            title: Text('${contact.firstName} ${contact.lastName}'),
            subtitle: Text(contact.email),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    InfoContactWidgets(context, contact);
                  },
                  icon: const Icon(Icons.info),
                  iconSize: 24,
                ),
                IconButton(
                  onPressed: () {
                    onEditPressed(index);
                  },
                  icon: const Icon(Icons.edit),
                  iconSize: 24,
                ),
                IconButton(
                  onPressed: () {
                    onDeletePressed(index);
                  },
                  icon: const Icon(Icons.delete),
                  iconSize: 24,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
