import 'package:flutter/material.dart';
import 'package:flutter_api_mvvm/models/api/dicebear_api.dart';

class DicebearViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final TextEditingController _textController = TextEditingController();
  TextEditingController get textController => _textController;

  String _image = "";
  String get image => _image;

  void getDiceBear() async {
    _isLoading = true;
    notifyListeners();

    _image = await DicebearApi().getDiceBear(
      nameImage: _textController.text,
    );
    _isLoading = false;
    notifyListeners();
  }
}