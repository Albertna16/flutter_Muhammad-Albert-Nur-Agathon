import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextDescriptionWidgets extends StatelessWidget {
  const TextDescriptionWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Contact us',
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Tambahkan teman baru ke daftar kontakmu sekarang! Bangun hubungan yang lebih erat dan nikmati percakapan yang menyenangkan. Yuk, tambah kontak sekarang!',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
