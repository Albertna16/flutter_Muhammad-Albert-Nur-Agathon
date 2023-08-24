import 'dart:io';

String predikatNilai(int nilai) {
  if (nilai > 70) {
    return "Nilai A";
  } else if (nilai > 40) {
    return "Nilai B";
  } else if (nilai > 0) {
    return "Nilai C";
  } else {
    return "";
  }
}

void main() {
  int? choice;
  do {
    print("1. Program predikat nilai");
    print("2. Program menampilkan deretan angka");
    print("3. Exit");
    stdout.write("Pilih kode diatas(1-3): ");
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      stdout.write("Masukkan nilai anda: ");
      int nilai = int.parse(stdin.readLineSync()!);

      String predikat = predikatNilai(nilai);
      print("Predikat nilai anda adalah $predikat\n");
    } else if (choice == 2) {
      stdout.write("Masukkan batas awal angka: ");
      int batasAwal = int.parse(stdin.readLineSync()!);
      stdout.write("Masukkan batas akhir angka: ");
      int batasAkhir = int.parse(stdin.readLineSync()!);

      for (var i = batasAwal; i <= batasAkhir; i++) {
        stdout.write("$i, ");
      }
      print("\n");
    } else if (choice == 3) {
      print("Program Selesai!!\n");
      break;
    } else {
      print("Kode yang anda masukkan salah\n");
    }
  } while (choice != 3);
}
