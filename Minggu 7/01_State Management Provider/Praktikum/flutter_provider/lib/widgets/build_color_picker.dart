import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/contact_provider.dart';
import 'package:flutter_provider/themes/theme_text_style.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class BuildColorPicker extends StatelessWidget {
  const BuildColorPicker({super.key});

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
                "Color",
                style: ThemeTextStyle().m3TitleMedium,
              ),
              Consumer(
                builder: (context, ContactProvider contactProvider, child) {
                  return ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          contactProvider.currentColor),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Pick your Color",
                                style: ThemeTextStyle().m3BodyMedium),
                            content: BlockPicker(
                              pickerColor: contactProvider.currentColor,
                              onColorChanged: (color) {
                                contactProvider.currentColor = color;
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
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer(
            builder: (context, ContactProvider contactProvider, child) {
              return Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: contactProvider.currentColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
