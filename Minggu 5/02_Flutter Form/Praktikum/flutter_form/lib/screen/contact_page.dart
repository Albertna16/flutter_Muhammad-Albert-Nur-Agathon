import 'package:flutter/material.dart';
import 'package:flutter_form/models/contact_models.dart';
import 'package:flutter_form/themes/theme_color.dart';
import 'package:flutter_form/themes/theme_text_style.dart';
import 'package:flutter_form/widgets/list_contact_widget.dart';
import 'package:flutter_form/widgets/submit_button_widget.dart';
import 'package:flutter_form/widgets/text_description.dart';
import 'package:flutter_form/widgets/text_field_widgets.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  int indexContact = -1;

  void _showCustomDialog({
    required String title,
    required String content,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ThemeColor().m3SysLightOnPrimary,
          title: Text(
            title,
            style: ThemeTextStyle().m3HeadLineSmall,
          ),
          content: Text(
            content,
            style: ThemeTextStyle().m3BodyMedium,
            textAlign: TextAlign.justify,
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ThemeColor().m3SysLightPrimary,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Ok",
                style: ThemeTextStyle().m3LabelLarge,
              ),
            ),
          ],
        );
      },
    );
  }

  void _addContact() {
    final name = nameController.text;
    final number = numberController.text;

    if (_nameValidate(name) && _numberValidate(number)) {
      setState(() {
        contactList.add(ContactModels(name: name, number: number));
        _showCustomDialog(
          title: "Success!!!",
          content:
              "Kontak yang anda tambahkan telah berhasil dimasukkan ke dalam daftar kontak anda",
        );
        print("name: $name, number: $number");
        nameController.clear();
        numberController.clear();
      });
    }
  }

  bool _nameValidate(String name) {
    final namePattern = RegExp(r"[A-Z][a-zA-Z]+$");
    if (!namePattern.hasMatch(name)) {
      _showCustomDialog(
        title: "Invalid Nama Kontak",
        content:
            "Nama harus terdiri dari minimal 2 kata, setiap kata harus dimulai dengan huruf kapital, dan tidak boleh mengandung angka atau karakter khusus.",
      );
      return false;
    }
    return true;
  }

  bool _numberValidate(String number) {
    final phonePattern = RegExp(r"^[0-9]{8,15}$");
    if (!phonePattern.hasMatch(number)) {
      _showCustomDialog(
        title: "Invalid Nomor Telepon",
        content:
            "Nomor telepon harus terdiri dari angka saja, panjang minimal 8 digit, dan dimulai dengan angka 0.",
      );
      return false;
    } else if (!number.startsWith('0')) {
      _showCustomDialog(
        title: "Invalid Nomor Telepon",
        content:
            "Nomor telepon harus terdiri dari angka saja, panjang minimal 8 digit, dan dimulai dengan angka 0.",
      );
      return false;
    } else {
      return true;
    }
  }

  void _updateContact() {
    final name = nameController.text;
    final number = numberController.text;
    if (name.isNotEmpty &&
        number.isNotEmpty &&
        indexContact != -1 &&
        _nameValidate(name) &&
        _numberValidate(number)) {
      setState(() {
        contactList[indexContact] = ContactModels(name: name, number: number);
      });
      _showCustomDialog(
        title: "Success!!!",
        content: "Data kontak berhasil diubah!!",
      );
      nameController.clear();
      numberController.clear();
      indexContact = -1;
    }
  }

  void _deleteContact(int index) {
    setState(() {
      contactList.removeAt(index);
    });
    _showCustomDialog(
      title: "Success!!!",
      content: "Kontak berhasil dihapus dari daftar kontak anda!!",
    );
  }

  void _editContact(int index) {
    final contact = contactList[index];
    setState(() {
      nameController.text = contact.name;
      numberController.text = contact.number;
      indexContact = index;
    });
  }

  void _clearContact() {
    setState(() {
      nameController.clear();
      numberController.clear();
      indexContact = -1;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contacts",
          style: ThemeTextStyle().m3HeadLineSmall,
        ),
        backgroundColor: const Color(0xFFE7E0EC),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const TextDescription(),
          TextFieldWidget(
            label: "Name",
            hintText: "Insert Your Name",
            controller: nameController,
          ),
          TextFieldWidget(
            label: "Nomor",
            hintText: "+62...",
            controller: numberController,
          ),
          SubmitButtonWidget(
            indexContact: indexContact,
            onAddContact: _addContact,
            onUpdateContact: _updateContact,
            onClearContact: _clearContact,
          ),
          ListContactWidget(
            onEditPressed: _editContact,
            onDeletePressed: _deleteContact,
          ),
        ],
      ),
    );
  }
}
