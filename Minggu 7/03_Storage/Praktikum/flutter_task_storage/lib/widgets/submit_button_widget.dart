import 'package:flutter/material.dart';
import 'package:flutter_task_storage/models/contact_models.dart';
import 'package:flutter_task_storage/models/db_contact_manager.dart';
import 'package:flutter_task_storage/themes/theme_color.dart';
import 'package:flutter_task_storage/themes/theme_text_style.dart';
import 'package:flutter_task_storage/widgets/dialog_widgets.dart';
import 'package:provider/provider.dart';

class SubmitButtonWidget extends StatefulWidget {
  const SubmitButtonWidget({super.key});

  @override
  State<SubmitButtonWidget> createState() => _SubmitButtonWidgetState();
}

class _SubmitButtonWidgetState extends State<SubmitButtonWidget> {
  bool _isButtonEnabled = false;

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled =
          context.read<DbContactManager>().nameController.text.isNotEmpty &&
              context.read<DbContactManager>().numberController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<DbContactManager>().isEnabledButton(() {
      _updateButtonState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
        top: 7,
      ),
      child: Column(
        children: [
          Consumer<DbContactManager>(
            builder: (context, dbContactManager, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColor().m3SysLightPrimary,
                    ),
                    onPressed: () {
                      if (dbContactManager.nameValidate(
                              dbContactManager.nameController.text) &&
                          dbContactManager.numberValidate(
                              dbContactManager.numberController.text)) {
                        Provider.of<DbContactManager>(context, listen: false)
                            .addContact(
                          ContactModels(
                              name: dbContactManager.nameController.text,
                              number: dbContactManager.numberController.text),
                        );
                        DialogWidgets.showCustomDialog(
                          context,
                          title: 'Data ditambahkan',
                          content: Text(
                            'Data kontak telah berhasil ditambahkan ke dalam daftar kontak anda!!',
                            style: ThemeTextStyle().m3BodyMedium,
                            textAlign: TextAlign.justify,
                          ),
                        );
                      } else if (!dbContactManager
                          .nameValidate(dbContactManager.nameController.text)) {
                        DialogWidgets.showCustomDialog(
                          context,
                          title: 'Invalid nama kontak',
                          content: Text(
                            'Nama harus terdiri dari minimal 2 kata, setiap kata harus dimulai dengan huruf kapital dan berisi minimal 2 huruf pada tiap katanya, dan tidak boleh mengandung andka dan karakter khusus!!',
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
                            'Nomor telepon harus terdiri dari angka saja, panjang minimal 8 digit, dan dimulai dengan angka 0!!',
                            style: ThemeTextStyle().m3BodyMedium,
                            textAlign: TextAlign.justify,
                          ),
                        );
                      } else {}
                    },
                    child: Text(
                      "Submit Contact",
                      style: ThemeTextStyle().m3LabelLarge,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: _isButtonEnabled
                        ? () {
                            dbContactManager.nameController.clear();
                            dbContactManager.numberController.clear();
                          }
                        : null,
                    child: Text(
                      "Clear Contact",
                      style: ThemeTextStyle().m3LabelLarge,
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
