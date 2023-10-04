import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_bloc/provider/contact_bloc/contact_bloc.dart';
import 'package:flutter_state_management_bloc/themes/theme_color.dart';
import 'package:flutter_state_management_bloc/themes/theme_text_style.dart';
import 'package:intl/intl.dart';

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
              BlocBuilder<ContactBloc, ContactState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColor().m3SysLightPrimary,
                    ),
                    onPressed: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: state.currentDate,
                        firstDate: DateTime(1990),
                        lastDate: DateTime(state.currentDate.year + 5),
                      );
                      if (selectedDate != null) {
                        state.currentDate = selectedDate;
                      }
                      print(state.currentDate);
                    },
                    child: const Text("Select"),
                  );
                },
              ),
            ],
          ),
          BlocBuilder<ContactBloc, ContactState>(
            builder: (context, state) {
              return Text(
                DateFormat('EEEE, dd-MM-yyyy')
                    .format(state.currentDate),
                style: ThemeTextStyle().m3BodyMedium,
              );
            },
          )
        ],
      ),
    );
  }
}
