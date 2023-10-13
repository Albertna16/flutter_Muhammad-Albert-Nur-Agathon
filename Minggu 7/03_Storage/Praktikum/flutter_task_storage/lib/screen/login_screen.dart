import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:flutter_task_storage/routes/routes_navigation.dart';
import 'package:flutter_task_storage/themes/theme_color.dart';
import 'package:flutter_task_storage/themes/theme_text_style.dart';
import 'package:flutter_task_storage/utils/shared_preferences_utils.dart';
import 'package:flutter_task_storage/widgets/text_field_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonEnabled = false;

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          "Login Screen",
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
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          TextFieldWidget(
            label: 'Username',
            hintText: 'input your username',
            controller: _usernameController,
            keyboardType: TextInputType.name,
          ),
          TextFieldWidget(
            label: 'Password',
            hintText: 'input your password',
            controller: _passwordController,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ThemeColor().m3SysLightPrimary,
            ),
            onPressed: _isButtonEnabled
                ? () async {
                    await SharedPreferencesUtils().addToken(
                      _usernameController.text,
                    );

                    Navigator.pushReplacementNamed(
                        context, RoutesNavigation.contactScreen);
                  }
                : null,
            child: Text(
              'Login',
              style: ThemeTextStyle().m3LabelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
