import 'package:flutter/material.dart';
import 'package:flutter_assets_dialog_and_navigation/routes/routes_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class SideBarWidgets extends StatelessWidget {
  const SideBarWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 50,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.cyan, Colors.blue, Colors.lightBlue],
              ),
            ),
            child: Center(
              child: Text(
                'Menu App',
                style: GoogleFonts.mooli(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, RoutesNavigation.contactScreen);
              },
              child: Text('Contact Page', style: GoogleFonts.mooli(fontWeight: FontWeight.w700),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, RoutesNavigation.homeScreen);
              },
              child: Text('Galery Page', style: GoogleFonts.mooli(fontWeight: FontWeight.w700),),
            ),
          ),
        ],
      ),
    );
  }
}
