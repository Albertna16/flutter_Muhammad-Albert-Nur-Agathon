import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/contact_provider.dart';
import 'package:flutter_provider/themes/theme_color.dart';
import 'package:flutter_provider/themes/theme_text_style.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BuildDatePicker extends StatelessWidget {
  const BuildDatePicker({super.key});

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
                "Date",
                style: ThemeTextStyle().m3TitleMedium,
              ),
              Consumer(
                builder: (context, ContactProvider contactProvider, child) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColor().m3SysLightPrimary,
                    ),
                    onPressed: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: contactProvider.currentDate,
                        firstDate: DateTime(1990),
                        lastDate:
                            DateTime(contactProvider.currentDate.year + 5),
                      );
                      if (selectedDate != null) {
                        contactProvider.currentDate = selectedDate;
                      }
                    },
                    child: const Text("Select"),
                  );
                },
              ),
            ],
          ),
          Consumer(
            builder: (context, ContactProvider contactProvider, child) {
              return Text(
                DateFormat('EEEE, dd-MM-yyyy')
                    .format(contactProvider.currentDate),
                style: ThemeTextStyle().m3BodyMedium,
              );
            },
          ),
        ],
      ),
    );
  }
}
