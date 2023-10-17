import 'package:flutter/material.dart';
import 'package:flutter_api_mvvm/screen/contact/contact_view_model.dart';
import 'package:flutter_api_mvvm/screen/dicebear/dicebear_view_model.dart';
import 'package:flutter_api_mvvm/screen/splash/splash_screen.dart';
import 'package:flutter_api_mvvm/screen/user/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ContactViewModel>(
            create: (context) => ContactViewModel()),
        ChangeNotifierProvider<DicebearViewModel>(
            create: (context) => DicebearViewModel()),
            ChangeNotifierProvider<UserViewModel>(
            create: (context) => UserViewModel()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter API & MVVM',
        home: SplashScreen(),
      ),
    );
  }
}
