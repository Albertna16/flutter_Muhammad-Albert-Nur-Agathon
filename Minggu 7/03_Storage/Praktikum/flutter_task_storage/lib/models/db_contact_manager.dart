import 'package:flutter/material.dart';
import 'package:flutter_task_storage/helper/database_helper.dart';
import 'package:flutter_task_storage/models/contact_models.dart';

class DbContactManager extends ChangeNotifier {
  List<ContactModels> _contactModels = [];
  List<ContactModels> get contactModels => _contactModels;

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;
  final TextEditingController _numberController = TextEditingController();
  TextEditingController get numberController => _numberController;

  late DatabaseHelper _dbHelper;
  DbContactManager() {
    _dbHelper = DatabaseHelper();
    _getAllContact();
  }

  void _getAllContact() async {
    _contactModels = await _dbHelper.getContact();
    notifyListeners();
  }

  Future<void> addContact(ContactModels contactModels) async {
    await _dbHelper.addContact(contactModels);
    _nameController.clear();
    _numberController.clear();
    _getAllContact();
  }

  void isEnabledButton(VoidCallback buttonState) {
    _nameController.addListener(buttonState);
    _numberController.addListener(buttonState);
  }

  Future<void> updateContact(ContactModels contactModels) async {
    await _dbHelper.updateContact(contactModels);
    _nameController.clear();
    _numberController.clear();
    _getAllContact();
  }

  Future<void> deleteContact(int id) async {
    await _dbHelper.deleteContact(id);
    _getAllContact();
  }

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
}
