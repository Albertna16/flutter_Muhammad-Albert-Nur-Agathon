import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_bloc/bloc/contact_bloc/contact_bloc.dart';
import 'package:flutter_state_management_bloc/themes/theme_text_style.dart';
import 'package:flutter_state_management_bloc/widgets/list_contact_widget.dart';
import 'package:flutter_state_management_bloc/widgets/submit_button_widget.dart';
import 'package:flutter_state_management_bloc/widgets/text_description.dart';
import 'package:flutter_state_management_bloc/widgets/text_field_widgets.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contacts",
          style: ThemeTextStyle().m3HeadLineSmall,
        ),
        backgroundColor: const Color(0xFFE7E0EC),
        centerTitle: true,
      ),
      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          return ListView(
            children: [
              const TextDescription(),
              TextFieldWidget(
                label: "Name",
                hintText: "Insert Your Name",
                controller: state.nameController,
              ),
              TextFieldWidget(
                label: "Nomor",
                hintText: "+62...",
                controller: state.numberController,
              ),
              const SubmitButtonWidget(),
              const SizedBox(
                height: 16,
              ),
              const ListContactWidget(),
            ],
          );
        },
      ),
    );
  }
}
