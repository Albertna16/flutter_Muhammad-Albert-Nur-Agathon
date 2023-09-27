import 'package:flutter/material.dart';
import 'package:flutter_assets_dialog_and_navigation/models/image_argument.dart';
import 'package:flutter_assets_dialog_and_navigation/routes/routes_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomSheetWidget extends StatelessWidget {
  final ImageArgument data;
  const BottomSheetWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    TextStyle styleMooli = GoogleFonts.mooli();

    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    "Pindah halaman?",
                    style: styleMooli,
                  ),
                  content: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      data.imageUrl,
                      height: 150,
                      width: 150,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(
                          context,
                          RoutesNavigation.detailScreen,
                          arguments: data,
                        );
                      },
                      child: Text(
                        "Ya",
                        style: styleMooli,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Tidak",
                        style: styleMooli,
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              data.imageUrl,
              height: 150,
              width: 150,
            ),
          ),
        ),
      ),
    );
  }
}
