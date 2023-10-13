import 'package:flutter/material.dart';
import 'package:flutter_task_storage/models/contact_models.dart';
import 'package:flutter_task_storage/models/db_contact_manager.dart';
import 'package:flutter_task_storage/themes/theme_color.dart';
import 'package:flutter_task_storage/themes/theme_text_style.dart';
import 'package:flutter_task_storage/widgets/dialog_widgets.dart';
import 'package:flutter_task_storage/widgets/text_field_widgets.dart';
import 'package:provider/provider.dart';

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
          child: Consumer<DbContactManager>(
            builder: (context, dbContactManager, child) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: dbContactManager.contactModels.length,
                itemBuilder: (context, int index) {
                  final contactList = dbContactManager.contactModels[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: ThemeColor().m3SysLightPrimaryContainer,
                      child: Text(
                        contactList.name[0],
                        style: ThemeTextStyle().m3TitleMedium,
                      ),
                    ),
                    title: Text(
                      contactList.name,
                      style: ThemeTextStyle().m3BodyLarge,
                    ),
                    subtitle: Text(
                      contactList.number,
                      style: ThemeTextStyle().m3BodyMedium,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            dbContactManager.nameController.text =
                                contactList.name;
                            dbContactManager.numberController.text =
                                contactList.number;
                            DialogWidgets.showCustomDialog(
                              context,
                              title: 'Form Update Data',
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFieldWidget(
                                    label: 'Name',
                                    hintText: 'Input yout name',
                                    controller: dbContactManager.nameController,
                                    keyboardType: TextInputType.name,
                                  ),
                                  TextFieldWidget(
                                    label: 'Number',
                                    hintText: 'Input yout number',
                                    controller:
                                        dbContactManager.numberController,
                                    keyboardType: TextInputType.phone,
                                  ),
                                ],
                              ),
                              button: ElevatedButton(
                                onPressed: () {
                                  if (dbContactManager
                                          .nameController.text.isNotEmpty &&
                                      dbContactManager
                                          .numberController.text.isNotEmpty &&
                                      dbContactManager.nameValidate(
                                          dbContactManager
                                              .nameController.text) &&
                                      dbContactManager.numberValidate(
                                          dbContactManager
                                              .numberController.text)) {
                                    dbContactManager.updateContact(
                                      ContactModels(
                                        id: contactList.id,
                                        name: dbContactManager
                                            .nameController.text,
                                        number: dbContactManager
                                            .numberController.text,
                                      ),
                                    );
                                    Navigator.pop(context);
                                    DialogWidgets.showCustomDialog(
                                      context,
                                      title: 'Data berhasil diubah',
                                      content: Text(
                                        'Data kontak telah berhasil diubah dari daftar kontak anda!!',
                                        style: ThemeTextStyle().m3BodyMedium,
                                        textAlign: TextAlign.justify,
                                      ),
                                    );
                                  } else if (!dbContactManager.nameValidate(
                                      dbContactManager.nameController.text)) {
                                    DialogWidgets.showCustomDialog(
                                      context,
                                      title: 'Invalid nama kontak',
                                      content: Text(
                                        'Nama harus terdiri dari minimal 2 kata, setiap kata harus dimulai dengan huruf kapital dan berisi minimal 2 huruf pada tiap katanya, dan tidak boleh mengandung angka dan karakter khusus!!',
                                        style: ThemeTextStyle().m3BodyMedium,
                                        textAlign: TextAlign.justify,
                                      ),
                                    );
                                  } else if (!dbContactManager.numberValidate(
                                      dbContactManager.numberController.text)) {
                                    DialogWidgets.showCustomDialog(
                                      context,
                                      title: 'Invalid nomor kontak',
                                      content: Text(
                                        'Nomor telepon harus terdiri dari angka saja, tidak boleh kosong, panjang minimal 8 digit, dan dimulai dengan angka 0!!',
                                        style: ThemeTextStyle().m3BodyMedium,
                                        textAlign: TextAlign.justify,
                                      ),
                                    );
                                  } else {}
                                },
                                child: Text(
                                  'Update',
                                  style: ThemeTextStyle().m3LabelLarge,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit),
                          iconSize: 24,
                          color: ThemeColor().m3RefNeutral,
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {
                            dbContactManager
                                .deleteContact(contactList.id ?? -1);
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
            },
          ),
        ),
      ],
    );
  }
}
