import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:flutter_task_storage/models/db_contact_manager.dart';
import 'package:flutter_task_storage/themes/theme_color.dart';
import 'package:flutter_task_storage/utils/shared_preferences_utils.dart';
import 'package:flutter_task_storage/widgets/list_contact_widget.dart';
import 'package:flutter_task_storage/widgets/sidebar_widgets.dart';
import 'package:flutter_task_storage/widgets/submit_button_widget.dart';
import 'package:flutter_task_storage/widgets/text_description.dart';
import 'package:flutter_task_storage/widgets/text_field_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  String? username;

  void initial() async {
    username = await SharedPreferencesUtils().getToken();
    setState(() {});
  }

  @override
  void initState() {
    initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          "Contact Screen",
          style: GoogleFonts.mooli(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: ThemeColor().m3SysLightOnSurface,
          ),
        ),
        centerTitle: true,
        gradient: const LinearGradient(
          colors: [Colors.cyan, Colors.blue, Colors.lightBlue],
        ),
      ),
      drawer: SidebarWidgets(
        username: username,
      ),
      body: ListView(
        children: [
          const TextDescription(),
          Consumer<DbContactManager>(
            builder: (context, dbContactManager, child) {
              return TextFieldWidget(
                label: "Name",
                hintText: "Insert Your Name",
                controller: dbContactManager.nameController,
                keyboardType: TextInputType.name,
              );
            },
          ),
          Consumer<DbContactManager>(
            builder: (context, dbContactManager, child) {
              return TextFieldWidget(
                label: "Nomor",
                hintText: "+62...",
                controller: dbContactManager.numberController,
                keyboardType: TextInputType.phone,
              );
            },
          ),
          const SubmitButtonWidget(),
          const SizedBox(height: 16),
          const ListContactWidget(),
        ],
      ),
    );
  }
}
