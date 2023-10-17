import 'package:flutter/material.dart';
import 'package:flutter_api_mvvm/models/contact_models.dart';
import 'package:flutter_api_mvvm/screen/contact/contact_view_model.dart';
import 'package:provider/provider.dart';

class ButtonComponent extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  const ButtonComponent(
      {super.key, required this.nameController, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactViewModel>(builder: (context, value, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              final name = nameController.text;
              final phone = phoneController.text;
              final newContact = ContactModels(id: 0, name: name, phone: phone);

              Provider.of<ContactViewModel>(context, listen: false)
                  .postContact(newContact);

              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Data from POST Request"),
                    content: Text("Name: $name\nPhone: $phone"),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Close"),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text("Post Data"),
          ),
          ElevatedButton(
            onPressed: value.contactList!.isEmpty
                ? null
                : () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Data from GET Request"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Name',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              Text(value.contactList![0].name.toString()),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Phone',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              Text(value.contactList![0].phone.toString()),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Close"),
                            ),
                          ],
                        );
                      },
                    );
                  },
            child: const Text("Get Data"),
          ),
          ElevatedButton(
            onPressed: () {
              nameController.clear();
              phoneController.clear();
            },
            child: const Text("Clear Data"),
          ),
        ],
      );
    });
  }
}
