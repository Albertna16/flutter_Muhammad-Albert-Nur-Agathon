import 'package:flutter/material.dart';
import 'package:flutter_api_mvvm/models/api/contact_api.dart';
import 'package:flutter_api_mvvm/models/contact_models.dart';

class ContactViewModel with ChangeNotifier {
  List<ContactModels>? _contactList = [];
  List<ContactModels>? get contactList => _contactList;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  TextEditingController get nameController => _nameController;
  TextEditingController get phoneController => _phoneController;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void getAllContacts() async {
    _isLoading = true;
    try {
      final data = await ContactApi.getContact();
      _contactList = data;
      print('Proses Berhasil');
    } catch (e) {
      print('Proses Catch $e');
      _contactList = null;
    } finally {
      print('Proses Final');

      _isLoading = false;
    }
    notifyListeners();
  }

  Future<void> postContact(ContactModels newContact) async {
    _isLoading = true;
    try {
      final createdContact = await ContactApi.postContact(newContact);
      if (_contactList != null) {
        _contactList!.add(createdContact);
      }
      print(
          'Kontak baru berhasil dibuat=> Id: ${createdContact.id}, Name: ${createdContact.name}, Phone: ${createdContact.phone}');
    } catch (e) {
      print('Gagal membuat kontak: $e');
    } finally {
      _isLoading = false;
    }
    notifyListeners();
  }
}
