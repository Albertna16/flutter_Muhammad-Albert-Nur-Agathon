import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_bloc/provider/contact_bloc/contact_bloc.dart';
import 'package:flutter_state_management_bloc/themes/theme_text_style.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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
              BlocBuilder<ContactBloc, ContactState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(state.currentColor),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Pick your Color",
                                style: ThemeTextStyle().m3BodyMedium),
                            content: BlockPicker(
                              pickerColor: state.currentColor,
                              onColorChanged: (color) {
                                state.currentColor = color;
                              },
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  print(state.currentColor);
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
          BlocBuilder<ContactBloc, ContactState>(
            builder: (context, state) {
              return Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: state.currentColor,
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
