import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/contact_provider.dart';
import 'package:flutter_provider/themes/theme_text_style.dart';
import 'package:flutter_provider/widgets/build_color_picker.dart';
import 'package:flutter_provider/widgets/build_date_picker.dart';
import 'package:flutter_provider/widgets/build_file_picker.dart';
import 'package:flutter_provider/widgets/list_contact_widget.dart';
import 'package:flutter_provider/widgets/submit_button_widget.dart';
import 'package:flutter_provider/widgets/text_description.dart';
import 'package:flutter_provider/widgets/text_field_widgets.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contacts",
          style: ThemeTextStyle().m3HeadLineSmall,
        ),
        backgroundColor: const Color(0xFFE7E0EC),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const TextDescription(),
          TextFieldWidget(
            label: "Name",
            hintText: "Insert Your Name",
            controller: contactProvider.nameController,
          ),
          TextFieldWidget(
            label: "Nomor",
            hintText: "+62...",
            controller: contactProvider.numberController,
          ),
          const SizedBox(
            height: 16,
          ),
          const BuildDatePicker(),
          const SizedBox(
            height: 16,
          ),
          const BuildColorPicker(),
          const SizedBox(
            height: 16,
          ),
          const BuildFilePicker(),
          const SizedBox(
            height: 16,
          ),
          const SubmitButtonWidget(),
          const ListContactWidget(),
        ],
      ),
    );
  }
}
