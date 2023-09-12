import 'package:flutter/material.dart';
import 'package:soal_prioritas_1/soal-eksplorasi/models.dart';

class Eksplorasi extends StatelessWidget {
  const Eksplorasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff6200EE),
        title: const Text("My Flutter App"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.search, color: Colors.white54),
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, int index) {
          final Topic data = topicList[index];
          return ListTile(
            title: Text(
              data.topicName!,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black),
            ),
          );
        },
        separatorBuilder: (context, int index) =>
            const Divider(color: Colors.black12),
        itemCount: topicList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: const Color(0xff03DAC5),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff6200EE),
        fixedColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
            label: "Information",
          ),
        ],
        selectedLabelStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
