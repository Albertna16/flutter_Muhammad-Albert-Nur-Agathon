import 'package:flutter/material.dart';
import 'package:flutter_assets_dialog_and_navigation/models/image_argument.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    final imageArguments = ModalRoute.of(context)!.settings.arguments as ImageArgument;
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          "Detail Image",
          style: GoogleFonts.mooli(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        gradient: const LinearGradient(
          colors: [Colors.cyan, Colors.blue, Colors.lightBlue],
        ),
      ),
      body: Image(
        image: AssetImage(imageArguments.imageUrl),
      ),
    );
  }
}
