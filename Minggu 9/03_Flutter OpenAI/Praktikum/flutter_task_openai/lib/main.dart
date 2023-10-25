import 'package:flutter/material.dart';
import 'package:flutter_task_openai/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter OpenAI',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}