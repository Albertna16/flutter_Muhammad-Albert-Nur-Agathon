import 'package:flutter/material.dart';
import 'package:flutter_api_mvvm/screen/contact/contact_view_model.dart';
import 'package:flutter_api_mvvm/screen/contact/components/button_component.dart';
import 'package:flutter_api_mvvm/widgets/sidebar_widget.dart';
import 'package:flutter_api_mvvm/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Screen"),
        centerTitle: true,
      ),
      drawer: const SidebarWidget(),
      body: Center(
        child: Consumer<ContactViewModel>(
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldWidget(
                  label: 'Name',
                  hintText: 'Input your name',
                  keyboardType: TextInputType.name,
                  controller: value.nameController,
                ),
                TextFieldWidget(
                  label: 'Phone',
                  hintText: 'Input your phone number',
                  keyboardType: TextInputType.phone,
                  controller: value.phoneController,
                ),
                const SizedBox(height: 20),
                ButtonComponent(
                  nameController: value.nameController,
                  phoneController: value.phoneController,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
