import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance_form/themes/theme_color.dart';
import 'package:flutter_advance_form/themes/theme_text_style.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as path;

class BuildFilePicker extends StatefulWidget {
  final ValueChanged<PlatformFile?>? onFilePicked;
  const BuildFilePicker({super.key, this.onFilePicked});

  @override
  State<BuildFilePicker> createState() => _BuildFilePickerState();
}

class _BuildFilePickerState extends State<BuildFilePicker> {
  PlatformFile? _selectedFile;

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return;
    }

    final file = result.files.first;
    setState(() {
      _selectedFile = file;
      widget.onFilePicked!(_selectedFile);
    });
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  void _clearFile() {
    setState(() {
      _selectedFile = null;
    });
    widget.onFilePicked!(_selectedFile);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Files",
                style: ThemeTextStyle().m3TitleMedium,
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColor().m3SysLightPrimary,
                    ),
                    onPressed: () {
                      _pickFile();
                    },
                    child: const Text("Pick"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColor().m3SysLightPrimary,
                    ),
                    onPressed: _selectedFile != null
                        ? () {
                            _openFile(_selectedFile!);
                          }
                        : null,
                    child: const Text("Open"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColor().m3SysLightPrimary,
                    ),
                    onPressed: _selectedFile != null
                        ? () {
                            _clearFile();
                          }
                        : null,
                    child: const Text("Clear"),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Nama file: ${_selectedFile != null ? path.basename(_selectedFile!.path.toString()) : "Tidak terdapat file"}",
            style: ThemeTextStyle().m3BodyMedium,
          ),
        ],
      ),
    );
  }
}
