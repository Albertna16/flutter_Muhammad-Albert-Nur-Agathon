import 'package:flutter/material.dart';
import 'package:flutter_api_mvvm/models/api/user_api.dart';
import 'package:flutter_api_mvvm/models/user_models.dart';

class UserViewModel with ChangeNotifier {
  final TextEditingController _titleController = TextEditingController();
  TextEditingController get titleController => _titleController;
  final TextEditingController _bodyController = TextEditingController();
  TextEditingController get bodyController => _bodyController;

  final UserApi _userApi = UserApi();

  Future<void> updateUser({required UserModels userModels}) async {
    try {
      final updatedUser = await _userApi.updateuser(userModels: userModels);
      print("Data berhasil diperbarui: $updatedUser");
      notifyListeners();
    } catch (e) {
      print("Terjadi kesalahan saat memperbarui data: $e");
    }
  }
}
