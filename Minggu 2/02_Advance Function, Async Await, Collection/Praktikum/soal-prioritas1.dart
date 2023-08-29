import 'dart:io';

void main() async {
  List data = [];
  stdout.write("Masukkan jumlah elemen dalam list: ");
  int bil = int.parse(stdin.readLineSync()!);

  stdout.write("Masukkan bilangan pembagi: ");
  int pembagi = int.parse(stdin.readLineSync()!);

  for (var i = 0; i < bil; i++) {
    stdout.write("Masukkan angka ke-${i+1}: ");
    int angka = int.parse(stdin.readLineSync()!);
    data.add(angka);
  }

  print("Data sebelum dikali: $data");
  print("Data setelah dikali: ${await perkalian(data, pembagi)}");
}

Future<List> perkalian(List data, int pengali) async {
  List hasil = data;
  for (var i = 0; i < data.length; i++) {
    hasil[i] = await data[i] * pengali;
  }
  return hasil;
}