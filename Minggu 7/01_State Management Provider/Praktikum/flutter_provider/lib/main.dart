import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/contact_provider.dart';
import 'package:flutter_provider/routes/routes_navigation.dart';
import 'package:flutter_provider/screen/contact_screen.dart';
import 'package:flutter_provider/screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContactProvider())
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
      },
    );
  }
}
