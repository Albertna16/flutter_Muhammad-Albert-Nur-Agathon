import 'package:flutter/material.dart';
import 'package:flutter_advance_form/screen/soal_prioritas_1.dart';
import 'package:flutter_advance_form/screen/soal_prioritas_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advance Flutter Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: SoalPrioritas1();
      home: const SoalPrioritas2(),
    );
  }
}
