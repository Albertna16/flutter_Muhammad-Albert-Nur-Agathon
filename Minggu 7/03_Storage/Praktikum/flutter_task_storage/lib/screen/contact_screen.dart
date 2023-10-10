import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:flutter_task_storage/models/db_contact_manager.dart';
import 'package:flutter_task_storage/routes/routes_navigation.dart';
import 'package:flutter_task_storage/themes/theme_color.dart';
import 'package:flutter_task_storage/themes/theme_text_style.dart';
import 'package:flutter_task_storage/utils/shared_preferences_utils.dart';
import 'package:flutter_task_storage/widgets/list_contact_widget.dart';
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
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.cyan, Colors.blue, Colors.lightBlue],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      username ?? '',
                      style: ThemeTextStyle().m3TitleLarge,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeColor().m3SysLightPrimary,
                ),
                onPressed: () async {
                  await SharedPreferencesUtils().removeToken();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RoutesNavigation.splashScreen,
                    (route) => false,
                  );
                },
                child: Text(
                  'Log Out',
                  style: ThemeTextStyle().m3LabelLarge,
                ),
              ),
            )
          ],
        ),
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
              );
            },
          ),
          Consumer<DbContactManager>(
            builder: (context, dbContactManager, child) {
              return TextFieldWidget(
                label: "Nomor",
                hintText: "+62...",
                controller: dbContactManager.numberController,
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
