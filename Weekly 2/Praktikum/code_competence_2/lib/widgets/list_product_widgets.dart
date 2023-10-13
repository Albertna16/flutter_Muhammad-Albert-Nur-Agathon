import 'package:code_competence_2/models/tourismplace_models.dart';
import 'package:flutter/material.dart';

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
        return Container(
          width: 200,
          margin: const EdgeInsets.only(right: 10),
          child: Card(
            shape: RoundedRectangleBorder(
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
                  child: Image.network(
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
                      Text("${place.name}"),
                      Text("${place.location}"),
                      Text("${place.openDays}"),
                      Text("${place.openTime}"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${place.ticketPrice}"),
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
        );
      },
    );
  }
}
