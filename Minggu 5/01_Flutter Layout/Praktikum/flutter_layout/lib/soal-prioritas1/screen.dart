import 'package:flutter/material.dart';
import 'package:flutter_layout/soal-prioritas1/models.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MaterialApp"),
      ),
      drawer: const Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Home",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Settings",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (context, int index) {
          final Contact data = contactList[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                data.name![0],
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(data.name!),
            subtitle: Text(data.number!),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
          ),
        ],
      ),
    );
  }
}
