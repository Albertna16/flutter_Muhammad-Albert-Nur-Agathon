import 'package:flutter/material.dart';
import 'package:flutter_advance_form/themes/theme_text_style.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class BuildColorPicker extends StatefulWidget {
  final Color currentColor;
  final ValueChanged<Color>? onColorChanged;
  const BuildColorPicker(
      {Key? key, required this.currentColor, this.onColorChanged})
      : super(key: key);

  @override
  State<BuildColorPicker> createState() => _BuildColorPickerState();
}

class _BuildColorPickerState extends State<BuildColorPicker> {
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
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(widget.currentColor),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Pick your Color",
                            style: ThemeTextStyle().m3BodyMedium),
                        content: BlockPicker(
                          pickerColor: widget.currentColor,
                          onColorChanged: (color) {
                            setState(() {
                              widget.onColorChanged!(color);
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
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: widget.currentColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
