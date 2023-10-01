import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/contact_provider.dart';
import 'package:flutter_provider/themes/theme_color.dart';
import 'package:flutter_provider/themes/theme_text_style.dart';
import 'package:flutter_provider/widgets/dialog_widgets.dart';
import 'package:provider/provider.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);

    bool nameValidate(String name) {
      final namePattern = name.split(" ");
      if (namePattern.length < 2) {
        return false;
      }

      for (var word in namePattern) {
        if (!word.startsWith(RegExp(r'[A-Z]'))) {
          return false;
        }
      }
      return true;
    }

    bool numberValidate(String number) {
      final phonePattern = RegExp(r"^[0-9]{8,15}$");
      if (!phonePattern.hasMatch(number)) {
        return false;
      } else if (!number.startsWith('0')) {
        return false;
      } else {
        return true;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
        top: 7,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeColor().m3SysLightPrimary,
                ),
                onPressed: () {
                  if (contactProvider.indexContact == -1) {
                    if (nameValidate(contactProvider.nameController.text) &&
                        numberValidate(contactProvider.numberController.text)) {
                      contactProvider.addContact();
                      DialogWidgets.showCustomDialog(
                        context,
                        title: 'Data ditambahkan',
                        content: Text(
                          'Data kontak telah berhasil ditambahkan ke dalam daftar kontak anda!!',
                          style: ThemeTextStyle().m3BodyMedium,
                          textAlign: TextAlign.justify,
                        ),
                      );
                    } else if (!nameValidate(contactProvider.nameController.text)) {
                      DialogWidgets.showCustomDialog(
                        context,
                        title: 'Invalid nama kontak',
                        content: Text(
                          'Nama harus terdiri dari minimal 2 kata, setiap kata harus dimulai dengan huruf kapital dan berisi minimal 2 huruf pada tiap katanya, dan tidak boleh mengandung andka dan karakter khusus!!',
                          style: ThemeTextStyle().m3BodyMedium,
                          textAlign: TextAlign.justify,
                        ),
                      );
                    } else if (!numberValidate(contactProvider.numberController.text)) {
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
                  } else {
                    if (contactProvider.nameController.text.isNotEmpty &&
                        contactProvider.numberController.text.isNotEmpty &&
                        contactProvider.indexContact != -1 &&
                        nameValidate(contactProvider.nameController.text) &&
                        numberValidate(contactProvider.numberController.text)) {
                      contactProvider.updateContact();
                      DialogWidgets.showCustomDialog(
                        context,
                        title: 'Data berhasil diubah',
                        content: Text(
                          'Data kontak telah berhasil diubah dari daftar kontak anda!!',
                          style: ThemeTextStyle().m3BodyMedium,
                          textAlign: TextAlign.justify,
                        ),
                      );
                    } else if (!nameValidate(contactProvider.nameController.text)) {
                      DialogWidgets.showCustomDialog(
                        context,
                        title: 'Invalid nama kontak',
                        content: Text(
                          'Nama harus terdiri dari minimal 2 kata, setiap kata harus dimulai dengan huruf kapital dan berisi minimal 2 huruf pada tiap katanya, dan tidak boleh mengandung angka dan karakter khusus!!',
                          style: ThemeTextStyle().m3BodyMedium,
                          textAlign: TextAlign.justify,
                        ),
                      );
                    } else if (!numberValidate(contactProvider.numberController.text)) {
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
                  }
                },
                child: Text(
                  contactProvider.indexContact == -1
                      ? "Submit Contact"
                      : "Update Contact",
                  style: ThemeTextStyle().m3LabelLarge,
                ),
              ),
              Visibility(
                visible: contactProvider.indexContact != -1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          contactProvider.clearContact();
                          DialogWidgets.showCustomDialog(
                            context,
                            title: 'Data berhasil direset',
                            content: Text(
                              'Data telah direset ulang dan anda dapat menambah kontak baru!!',
                              style: ThemeTextStyle().m3BodyMedium,
                              textAlign: TextAlign.justify,
                            ),
                          );
                        },
                        child: Text(
                          "Clear Contact",
                          style: ThemeTextStyle().m3LabelLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
