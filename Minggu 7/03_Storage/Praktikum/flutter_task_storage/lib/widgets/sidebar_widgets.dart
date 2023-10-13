import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:flutter_task_storage/routes/routes_navigation.dart';
import 'package:flutter_task_storage/themes/theme_color.dart';
import 'package:flutter_task_storage/themes/theme_text_style.dart';
import 'package:flutter_task_storage/utils/shared_preferences_utils.dart';

class SidebarWidgets extends StatelessWidget {
  final String? username;
  const SidebarWidgets({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GradientAppBar(
            gradient: const LinearGradient(
              colors: [Colors.cyan, Colors.blue, Colors.lightBlue],
            ),
            leading: const Icon(
              Icons.person,
              size: 36,
              color: Colors.black,
            ),
            title: Text(
              username ?? '',
              style: ThemeTextStyle().m3TitleLarge,
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
    );
  }
}
