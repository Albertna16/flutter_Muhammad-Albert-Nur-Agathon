import 'package:flutter/material.dart';
import 'package:flutter_assets_dialog_and_navigation/themes/theme_color.dart';
import 'package:flutter_assets_dialog_and_navigation/themes/theme_text_style.dart';
import 'package:intl/intl.dart';

class BuildDatePicker extends StatefulWidget {
  final DateTime currentDate;
  final ValueChanged<DateTime>? onDateChanged;
  const BuildDatePicker({
    super.key,
    required this.currentDate,
    this.onDateChanged,
  });

  @override
  State<BuildDatePicker> createState() => _BuildDatePickerState();
}

class _BuildDatePickerState extends State<BuildDatePicker> {
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    selectedDate = widget.currentDate;
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
                "Date",
                style: ThemeTextStyle().m3TitleMedium,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeColor().m3SysLightPrimary,
                ),
                onPressed: () async {
                  final selectDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(1990),
                    lastDate: DateTime(selectedDate.year + 5),
                  );
                  if (selectDate != null) {
                    if (widget.onDateChanged != null) {
                      widget.onDateChanged!(selectDate);
                    }
                  }
                },
                child: const Text("Select"),
              ),
            ],
          ),
          Text(
            DateFormat('EEEE, dd-MM-yyyy').format(widget.currentDate),
            style: ThemeTextStyle().m3BodyMedium,
          ),
        ],
      ),
    );
  }
}
