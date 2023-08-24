import 'dart:io';

void main() {
  int? choice;
  do {
    print("1. Persegi");
    print("2. Persegi Panjang");
    print("3. Lingkaran");
    print("4. Exit");
    stdout.write("Pilih kode diatas(1-4): ");
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      // input user
      stdout.write("Masukkan panjang sisi : ");
      double sisi = double.parse(stdin.readLineSync()!);

      // keliling dan luas
      double keliling = 4 * sisi;
      double luas = sisi * sisi;
      print("Keliling persegi adalah $keliling");
      print("Luas persegi adalah $luas\n");
    } else if (choice == 2) {
      // input user
      stdout.write("Masukkan nilai panjang : ");
      double panjang = double.parse(stdin.readLineSync()!);
      stdout.write("Masukkan nilai lebar : ");
      double lebar = double.parse(stdin.readLineSync()!);

      // keliling dan luas
      double keliling = 2 * (panjang + lebar);
      double luas = panjang * lebar;
      print("Keliling persegi panjang adalah $keliling");
      print("Luas persegi panjang adalah $luas\n");
    } else if (choice == 3) {
      // input user
      stdout.write("Masukkan nilai jari jari : ");
      double jari = double.parse(stdin.readLineSync()!);

      // keliling dan luas
      double keliling = 22 / 7 * 2 * jari;
      double luas = 22 / 7 * jari * jari;
      print("Keliling lingkaran adalah $keliling");
      print("Luas lingkaran adalah $luas\n");
    } else if (choice == 4) {
      print("Program Selesai!!");
      break;
    } else {
      print("Kode yang anda masukkan salah\n");
    }
  } while (choice != 4);
}
