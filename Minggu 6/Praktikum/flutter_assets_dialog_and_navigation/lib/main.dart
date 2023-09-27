import 'package:flutter/material.dart';
import 'package:flutter_assets_dialog_and_navigation/routes/routes_navigation.dart';
import 'package:flutter_assets_dialog_and_navigation/screen/detail_screen.dart';
import 'package:flutter_assets_dialog_and_navigation/screen/home_screen.dart';
import 'package:flutter_assets_dialog_and_navigation/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const SplashScreen(),
      initialRoute: RoutesNavigation.splashScreen,
      routes: {
        RoutesNavigation.splashScreen: (_) => const SplashScreen(),
        RoutesNavigation.homeScreen: (_) => const HomeScreen(),
        RoutesNavigation.detailScreen: (_) => const DetailScreen(),
      },
    );
  }
}

