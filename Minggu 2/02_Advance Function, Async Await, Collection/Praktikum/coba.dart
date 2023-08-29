import 'dart:io';

void main() {
  List<List<dynamic>> pemainList = [];

  // Menginputkan jumlah elemen yang akan dimasukkan
  stdout.write("Masukkan jumlah data list: ");
  int jumlah = int.parse(stdin.readLineSync()!);
  stdout.write("\n");

  for (int i = 0; i < jumlah; i++) {
    print("Masukkan data ke-${i + 1}:");

    stdout.write("Masukkan nama pemain: ");
    String namaPemain = stdin.readLineSync()!;
    stdout.write("Masukkan negara asal pemain: ");
    String negara = stdin.readLineSync()!;

    pemainList.add([namaPemain, negara]);
  }
  stdout.write("\n");

  Map<String, String> pemainMap = {};

  for (var item in pemainList) {
    pemainMap[item[0]] = item[1];
  }

  print("Data dari list:");
  for (var item in pemainList) {
    print("${item[0]}\t: ${item[1]}");
  }

  print("\nData map terbaru:");
  pemainMap.forEach((key, value) {
    print("$key\t: $value");
  });
  stdout.write("\n");
}
