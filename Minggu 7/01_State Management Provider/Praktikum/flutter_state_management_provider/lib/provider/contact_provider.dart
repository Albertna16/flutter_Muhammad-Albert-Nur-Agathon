import 'package:flutter/material.dart';
import 'package:flutter_state_management_provider/models/contact_models.dart';

class ContactProvider with ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  int _indexContact = -1;

  TextEditingController get nameController => _nameController;
  TextEditingController get numberController => _numberController;
  int get indexContact => _indexContact;

  void addContact() {
    final name = nameController.text;
    final number = numberController.text;

    if (nameValidate(name) && numberValidate(number)) {
      contactList.add(ContactModels(name: name, number: number));
      print("name: $name, number: $number");
      _nameController.clear();
      _numberController.clear();
    }
    notifyListeners();
  }

  bool nameValidate(String name) {
    final namePattern = RegExp(r"[A-Z][a-zA-Z]+$");
    if (!namePattern.hasMatch(name)) {
      return false;
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

  void updateContact() {
    final name = nameController.text;
    final number = numberController.text;
    if (name.isNotEmpty &&
        number.isNotEmpty &&
        indexContact != -1 &&
        nameValidate(name) &&
        numberValidate(number)) {
      contactList[indexContact] = ContactModels(name: name, number: number);
      _nameController.clear();
      _numberController.clear();
      _indexContact = -1;
    }
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
    _indexContact = index;
    notifyListeners();
  }

  void clearContact() {
    nameController.clear();
    numberController.clear();
    _indexContact = -1;
    notifyListeners();
  }
}
