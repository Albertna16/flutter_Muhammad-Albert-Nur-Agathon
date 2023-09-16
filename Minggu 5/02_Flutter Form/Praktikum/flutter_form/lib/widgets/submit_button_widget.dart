import 'package:flutter/material.dart';
import 'package:flutter_form/themes/theme_color.dart';
import 'package:flutter_form/themes/theme_text_style.dart';

class SubmitButtonWidget extends StatelessWidget {
  final int indexContact;
  final VoidCallback onAddContact;
  final VoidCallback onUpdateContact;
  final VoidCallback onClearContact;
  const SubmitButtonWidget(
      {super.key,
      required this.indexContact,
      required this.onAddContact,
      required this.onUpdateContact,
      required this.onClearContact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
        top: 7,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeColor().m3SysLightPrimary,
                ),
                onPressed: () {
                  if (indexContact == -1) {
                    onAddContact();
                  } else {
                    onUpdateContact();
                  }
                },
                child: Text(
                  indexContact == -1 ? "Submit" : "Update Contact",
                  style: ThemeTextStyle().m3LabelLarge,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Visibility(
            visible: indexContact != -1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.red, // Warna merah untuk tombol "Clear"
                  ),
                  onPressed: onClearContact, // Callback clear data
                  child: Text(
                    "Clear",
                    style: ThemeTextStyle().m3LabelLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
