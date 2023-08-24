import 'dart:io';

void main() {
  int? choice;
  do {
    print("1. Sambung 3 kata");
    print("2. Volume tabung");
    print("3. Exit");
    stdout.write("Pilih kode diatas(1-3): ");
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      stdout.write("Masukkan kata ke-1: ");
      String kataPertama = stdin.readLineSync()!;

      stdout.write("Masukkan kata ke-2: ");
      String kataKedua = stdin.readLineSync()!;

      stdout.write("Masukkan kata ke-3: ");
      String kataKetiga = stdin.readLineSync()!;

      print("Hasil penggabungan semua kata ==> $kataPertama $kataKedua $kataKetiga\n");
    } else if (choice == 2) {
      stdout.write("Masukkan panjang jari jari: ");
      double jari = double.parse(stdin.readLineSync()!);
      stdout.write("Masukkan tinggi tabung: ");
      double tinggi = double.parse(stdin.readLineSync()!);

      double volume = 22 / 7 * jari * jari * tinggi;
      print("Volume tabung adalah $volume\n");
    } else if (choice == 3) {
      print("Program Selesai!!\n");
      break;
    } else {
      print("Kode yang anda masukkan salah\n");
    }
  } while (choice != 3);
}
