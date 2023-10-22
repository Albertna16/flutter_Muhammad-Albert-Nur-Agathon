import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ContactModels {
  final String name;
  final String number;
  final Color color;
  final DateTime date;
  final PlatformFile file;

  ContactModels({
    required this.name,
    required this.number,
    required this.color,
    required this.date,
    required this.file,
  });
}

var contactList = [];