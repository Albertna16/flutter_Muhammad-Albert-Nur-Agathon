import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/models/contact_models.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as path;

class ContactProvider with ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  Color _currentColor = Colors.green;
  DateTime _currentDate = DateTime.now();
  PlatformFile _selectedFile = PlatformFile(name: '', path: '', size: 0);
  int _indexContact = -1;

  TextEditingController get nameController => _nameController;
  TextEditingController get numberController => _numberController;
  Color get currentColor => _currentColor;
  DateTime get currentDate => _currentDate;
  PlatformFile get selectedFile => _selectedFile;
  int get indexContact => _indexContact;

  void addContact() {
    final name = nameController.text;
    final number = numberController.text;

    contactList.add(
      ContactModels(
        name: name,
        number: number,
        color: currentColor,
        date: currentDate,
        file: selectedFile,
      ),
    );
    print(
        "Name: $name, Number: $number, Color: $currentColor, Date: ${DateFormat('EEEE, dd-MM-yyyy').format(currentDate)}, File: ${path.basename((selectedFile.path).toString())}");
    clearContact();
    notifyListeners();
  }

  void updateContact() {
    final name = nameController.text;
    final number = numberController.text;
    contactList[indexContact] = ContactModels(
      name: name,
      number: number,
      color: currentColor,
      date: currentDate,
      file: selectedFile,
    );
    print(
        "Name: $name, Number: $number, Color: $currentColor, Date: ${DateFormat('EEEE, dd-MM-yyyy').format(currentDate)}, File: ${path.basename((selectedFile.path).toString())}");
    clearContact();
    notifyListeners();
  }

  void deleteContact(int index) {
    contactList.removeAt(index);
    notifyListeners();
  }

  void editContact(int index) {
    final contact = contactList[index];
    _nameController.text = contact.name;
    _numberController.text = contact.number;
    _currentColor = contact.color;
    _currentDate = contact.date;
    _selectedFile = contact.file;
    _indexContact = index;
    notifyListeners();
  }

  void clearContact() {
    _nameController.clear();
    _numberController.clear();
    _currentColor = Colors.green;
    _currentDate = DateTime.now();
    _selectedFile = PlatformFile(name: '', path: '', size: 0);
    _indexContact = -1;
    notifyListeners();
  }

  set currentDate(DateTime date) {
    _currentDate = date;
    notifyListeners();
  }

  set currentColor(Color color) {
    _currentColor = color;
    notifyListeners();
  }

  set selectedFile(PlatformFile file) {
    _selectedFile = file;
    notifyListeners();
  }

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return;
    }

    final file = result.files.first;
    selectedFile = file;
  }

  void openFile() {
    OpenFile.open(selectedFile.path);
  }

  void clearFile() {
    selectedFile = PlatformFile(name: '', path: '', size: 0);
  }
}
