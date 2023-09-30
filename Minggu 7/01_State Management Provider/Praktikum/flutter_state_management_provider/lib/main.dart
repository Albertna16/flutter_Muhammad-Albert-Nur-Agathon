import 'package:flutter/material.dart';
import 'package:flutter_state_management_provider/provider/contact_provider.dart';
import 'package:flutter_state_management_provider/screen/contact_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ContactProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: const ContactPage(),
      home: const ContactPage(),
    );
  }
}
