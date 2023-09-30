import 'package:flutter/material.dart';
import 'package:flutter_state_management_provider/provider/contact_provider.dart';
import 'package:flutter_state_management_provider/themes/theme_color.dart';
import 'package:flutter_state_management_provider/themes/theme_text_style.dart';
import 'package:provider/provider.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);
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
                  if (contactProvider.indexContact == -1) {
                    contactProvider.addContact();
                  } else {
                    contactProvider.updateContact();
                  }
                },
                child: Text(
                  contactProvider.indexContact == -1 ? "Submit" : "Update Contact",
                  style: ThemeTextStyle().m3LabelLarge,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Visibility(
            visible: contactProvider.indexContact != -1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.red, 
                  ),
                  onPressed: (){
                    contactProvider.clearContact();
                  }, 
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
