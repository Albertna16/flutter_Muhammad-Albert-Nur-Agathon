import 'package:flutter/material.dart';
import 'package:flutter_advance_form/themes/theme_text_style.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:file_picker/file_picker.dart';

class SoalPrioritas1 extends StatefulWidget {
  const SoalPrioritas1({super.key});

  @override
  State<SoalPrioritas1> createState() => _HomePageState();
}

class _HomePageState extends State<SoalPrioritas1> {
  // Date Picker
  DateTime _dueDate = DateTime.now();
  var currentDate = DateTime.now();

  // Color Picker
  Color _currentColor = Colors.orange;

  // File Picker
  PlatformFile? _selectedFile;

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return;
    }

    // mendapatkan file dari object result
    final file = result.files.first;
    setState(() {
      _selectedFile = file;
      print(_selectedFile);
    });
  }

  void _openFiels(PlatformFile file) {
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interactive Widgets"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // build date picker
            buildDatePicker(context),
            const SizedBox(
              height: 20,
            ),

            // build color picker
            buildColorPicker(context),
            const SizedBox(
              height: 20,
            ),

            // build file picker
            buildFilePicker(),
          ],
        ),
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Date",
              style: ThemeTextStyle().m3TitleMedium,
            ),
            TextButton(
              onPressed: () async {
                final selectDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(currentDate.year + 5),
                );
                setState(() {
                  if (selectDate != null) {
                    _dueDate = selectDate;
                    currentDate = selectDate;
                  }
                });
              },
              child: Text("Select", style: ThemeTextStyle().m3BodyMedium),
            ),
          ],
        ),
        Text(
          DateFormat('EEEE, dd-MM-yyyy').format(_dueDate),
          style: ThemeTextStyle().m3BodyMedium,
        ),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: ThemeTextStyle().m3TitleMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: _currentColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_currentColor),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Pick your Color",
                      style: ThemeTextStyle().m3BodyMedium),
                  content: BlockPicker(
                    pickerColor: _currentColor,
                    onColorChanged: (color) {
                      setState(() {
                        _currentColor = color;
                      });
                    },
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Save"),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text("Pick Color"),
        )
      ],
    );
  }

  Widget buildFilePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pick Files",
          style: ThemeTextStyle().m3TitleMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                _pickFile();
              },
              child: const Text("Pick Files"),
            ),
            const SizedBox(
              width: 16,
            ),
            ElevatedButton(
              onPressed: _selectedFile != null ? () {
                _openFiels(_selectedFile!);
              } : null,
              child: const Text("Open Files"),
            ),
          ],
        ),
      ],
    );
  }
}
