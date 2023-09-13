import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout/soal-eksplorasi/screen.dart';
import 'package:flutter_layout/soal-prioritas1/screen.dart';
import 'package:flutter_layout/soal-prioritas2/homepageios.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Soal Prioritas 1
    return MaterialApp(
      title: 'Flutter Layout',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );

    // // Soal Prioritas 2
    // const _themeDark = CupertinoThemeData.raw(
    //   Brightness.dark,
    //   null,
    //   null,
    //   null,
    //   null,
    //   null,
    //   null,
    // );
    // return const CupertinoApp(
    //   theme: _themeDark,
    //   home: HomePage(),
    // );

    // // Soal Eksplorasi
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData.dark(),
    //   home: const Eksplorasi(),
    // );
  }
}
