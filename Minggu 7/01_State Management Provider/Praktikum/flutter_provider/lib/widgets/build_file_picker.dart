import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/contact_provider.dart';
import 'package:flutter_provider/themes/theme_color.dart';
import 'package:flutter_provider/themes/theme_text_style.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';

class BuildFilePicker extends StatelessWidget {
  const BuildFilePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);
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
                      contactProvider.pickFile();
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
                    onPressed: contactProvider.selectedFile != PlatformFile(name: '', path: '', size: 0)
                        ? () {
                            contactProvider.openFile();
                          }
                        : null,
                    child: const Text("Open"),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Nama file: ${contactProvider.selectedFile != PlatformFile(name: '', path: '', size: 0) ? path.basename(contactProvider.selectedFile.path.toString()) : "Tidak terdapat file"}",
            style: ThemeTextStyle().m3BodyMedium,
          ),
        ],
      ),
    );
  }
}
