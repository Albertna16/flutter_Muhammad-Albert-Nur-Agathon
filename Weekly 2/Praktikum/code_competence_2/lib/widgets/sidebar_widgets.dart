import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SidebarWidgets extends StatelessWidget {
  const SidebarWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ],
            title: const Text('Menu App'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Contact Us',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'About Us',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Login',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
