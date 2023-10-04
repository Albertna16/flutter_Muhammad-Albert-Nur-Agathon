import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_bloc/provider/contact_bloc/contact_bloc.dart';
import 'package:flutter_state_management_bloc/themes/theme_color.dart';
import 'package:flutter_state_management_bloc/themes/theme_text_style.dart';
import 'package:path/path.dart' as path;

class BuildFilePicker extends StatelessWidget {
  const BuildFilePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<ContactBloc, ContactState>(
            builder: (context, state) {
              return Row(
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
                          // contactProvider.pickFile();
                          context.read<ContactBloc>().add(PickFileEvent());
                          print(state.selectedFile);
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
                        onPressed: state.selectedFile !=
                                PlatformFile(name: '', path: '', size: 0)
                            ? () {
                                // contactProvider.openFile();
                                context.read<ContactBloc>().add(OpenFileEvent());
                              }
                            : null,
                        child: const Text("Open"),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<ContactBloc, ContactState>(
            builder: (context, state) {
              return Text(
                "Nama file: ${state.selectedFile != PlatformFile(name: '', path: '', size: 0) ? path.basename(state.selectedFile.path.toString()) : "Tidak terdapat file"}",
                style: ThemeTextStyle().m3BodyMedium,
              );
            },
          )
        ],
      ),
    );
  }
}
