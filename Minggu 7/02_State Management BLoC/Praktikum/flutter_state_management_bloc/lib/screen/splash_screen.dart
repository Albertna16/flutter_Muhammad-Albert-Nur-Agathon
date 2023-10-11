import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_state_management_bloc/routes/routes_navigation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(
        context,
        RoutesNavigation.contactScreen,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const Image(
          fit: BoxFit.cover,
          image: AssetImage('assets/image/splash_screen.jpg'),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/image/address-book-solid.svg",
              height: 70,
              color: Colors.white,
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              'Contact App',
              style: GoogleFonts.mooli(
                fontSize: 26,
                color: Colors.white,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}