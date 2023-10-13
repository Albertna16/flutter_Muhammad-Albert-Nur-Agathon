import 'package:code_competence_2/models/tourismplace_models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListProductWidgets extends StatelessWidget {
  final VoidCallback pressedButton;
  const ListProductWidgets({super.key, required this.pressedButton});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: tourismPlaceList.length,
      itemBuilder: (context, index) {
        TourismPlace place = tourismPlaceList[index];
        return SafeArea(
          child: Container(
            width: 250,
            margin: const EdgeInsets.only(right: 10),
            child: Card(
              color: Colors.white70,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.asset(
                      "${place.imageAsset}",
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${place.name}",
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Location: ${place.location}",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Open Day: ${place.openDays}",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Date: ${place.openTime}",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${place.ticketPrice}",
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                          onPressed: pressedButton,
                          child: const Text('Pesan'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
