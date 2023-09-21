import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance_form/models/contact_models.dart';
import 'package:flutter_advance_form/themes/theme_color.dart';
import 'package:flutter_advance_form/themes/theme_text_style.dart';
import 'package:flutter_advance_form/widgets/build_color_picker.dart';
import 'package:flutter_advance_form/widgets/build_date_picker.dart';
import 'package:flutter_advance_form/widgets/build_file_picker.dart';
import 'package:flutter_advance_form/widgets/list_contact_widget.dart';
import 'package:flutter_advance_form/widgets/submit_button_widget.dart';
import 'package:flutter_advance_form/widgets/text_description.dart';
import 'package:flutter_advance_form/widgets/text_field_widgets.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

class SoalPrioritas2 extends StatefulWidget {
  const SoalPrioritas2({super.key});

  @override
  State<SoalPrioritas2> createState() => _SoalPrioritas2();
}

class _SoalPrioritas2 extends State<SoalPrioritas2> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  Color currentColor = Colors.green;
  DateTime currentDate = DateTime.now();
  PlatformFile? selectedFile;
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
        contactList.add(
          ContactModels(
            name: name,
            number: number,
            color: currentColor,
            date: currentDate,
            file: selectedFile!,
          ),
        );
        _showCustomDialog(
          title: "Success!!!",
          content:
              "Kontak yang anda tambahkan telah berhasil dimasukkan ke dalam daftar kontak anda",
        );
        print(
            "Name: $name, Number: $number, Color: $currentColor, Date: ${DateFormat('EEEE, dd-MM-yyyy').format(currentDate)}, File: ${path.basename((selectedFile!.path).toString())}");
        _clearContact();
      });
    }
  }

  bool _nameValidate(String name) {
    final namePattern = name.split(" ");
    if (namePattern.length < 2) {
      _showCustomDialog(
        title: "Invalid Nama Kontak",
        content:
            "Nama harus terdiri dari minimal 2 kata, setiap kata harus dimulai dengan huruf kapital dan berisi minimal 2 huruf, dan tidak boleh mengandung angka atau karakter khusus.",
      );
      return false;
    }

    for (var word in namePattern) {
      if (!word.startsWith(RegExp(r'[A-Z]'))) {
        _showCustomDialog(
          title: "Invalid Nama Kontak",
          content:
              "Nama harus terdiri dari minimal 2 kata, setiap kata harus dimulai dengan huruf kapital dan berisi minimal 2 huruf, dan tidak boleh mengandung angka atau karakter khusus.",
        );
        return false;
      }
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
        contactList[indexContact] = ContactModels(
          name: name,
          number: number,
          color: currentColor,
          date: currentDate,
          file: selectedFile!,
        );
        _showCustomDialog(
          title: "Success!!!",
          content: "Data kontak berhasil diubah!!",
        );
        print(
            "Name: $name, Number: $number, Color: $currentColor, Date: ${DateFormat('EEEE, dd-MM-yyyy').format(currentDate)}, File: ${path.basename((selectedFile!.path).toString())}");
        _clearContact();
      });
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
      currentColor = contact.color;
      currentDate = contact.date;
      selectedFile = contact.file;
      indexContact = index;
    });
  }

  void _clearContact() {
    setState(() {
      nameController.clear();
      numberController.clear();
      currentColor = Colors.green;
      currentDate = DateTime.now();
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
          const SizedBox(
            height: 16,
          ),
          BuildDatePicker(
            currentDate: currentDate,
            onDateChanged: (date) {
              setState(() {
                currentDate = date;
              });
            },
          ),
          const SizedBox(
            height: 16,
          ),
          BuildColorPicker(
            currentColor: currentColor,
            onColorChanged: (color) {
              setState(() {
                currentColor = color;
              });
            },
          ),
          const SizedBox(
            height: 16,
          ),
          BuildFilePicker(
            onFilePicked: (file) {
              setState(() {
                selectedFile = file;
              });
            },
          ),
          const SizedBox(
            height: 16,
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
            selectedColor: currentColor,
            selectedDate: currentDate,
            selectedFile:
                selectedFile ?? PlatformFile(name: "", path: "", size: 0),
          ),
        ],
      ),
    );
  }
}
