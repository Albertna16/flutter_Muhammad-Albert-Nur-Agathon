import 'package:flutter/material.dart';
import 'package:flutter_assets_dialog_and_navigation/models/image_argument.dart';
import 'package:flutter_assets_dialog_and_navigation/widgets/bottom_sheet_widget.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          "Flutter Galery",
          style: GoogleFonts.mooli(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        gradient: const LinearGradient(
          colors: [Colors.cyan, Colors.blue, Colors.lightBlue],
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: imageList.length,
        itemBuilder: (context, int index) {
          final ImageArgument data = imageList[index];
          return Container(
            padding: const EdgeInsets.all(6),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BottomSheetWidget(data: data);
                  },
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  data.imageUrl,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
