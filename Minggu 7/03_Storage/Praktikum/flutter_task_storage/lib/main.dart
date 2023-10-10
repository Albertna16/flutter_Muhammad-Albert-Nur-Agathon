import 'package:flutter/material.dart';
import 'package:flutter_task_storage/models/db_contact_manager.dart';
import 'package:flutter_task_storage/routes/routes_navigation.dart';
import 'package:flutter_task_storage/screen/contact_screen.dart';
import 'package:flutter_task_storage/screen/login_screen.dart';
import 'package:flutter_task_storage/screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DbContactManager()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Advance Flutter Form',
      initialRoute: RoutesNavigation.splashScreen,
      routes: {
        RoutesNavigation.splashScreen: (_) => const SplashScreen(),
        RoutesNavigation.contactScreen: (_) => const ContactScreen(),
        RoutesNavigation.loginScreen: (_) => const LoginScreen(),
      },
    );
  }
}
