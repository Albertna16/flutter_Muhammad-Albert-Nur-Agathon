import 'dart:io';

List<String> repairList(List<String> data) {
  List<String> dataUnik = [];
  for (var i = 0; i < data.length; i++) {
    if (!dataUnik.contains(data[i])) {
      dataUnik.add(data[i]);
    }
  }
  return dataUnik;
}

Map<String, int> hitungData(List<String> data) {
  Map<String, int> frekuensi = {};
  for (var i = 0; i < data.length; i++) {
    if (frekuensi.containsKey(data[i])) {
      frekuensi[data[i]] = frekuensi[data[i]]! + 1;
    } else {
      frekuensi[data[i]] = 1;
    }
  }
  return frekuensi;
}

void main() {
  int? choice;
  do {
    print("1. Program Menghapus Data Sama Dalam List");
    print("2. Program Menghitung Frekuensi Dalam List");
    print("3. Exit");
    stdout.write("Pilih kode diatas(1-3): ");
    choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      // initiate list
      List<String> sampel = [];

      stdout.write("Masukkan jumlah data: ");
      int jumlah = int.parse(stdin.readLineSync()!);

      for (var i = 0; i < jumlah; i++) {
        stdout.write("Masukkan data ke-${i + 1}: ");
        String kata = stdin.readLineSync()!;
        sampel.add(kata);
      }

      // print sampeData1 and repair list
      print("\nSampel awal\t: $sampel");
      print("Sampel akhir\t: ${repairList(sampel)}\n");
    } else if (choice == 2) {
      List<String> sampel = [];
      stdout.write("Masukkan jumlah data: ");
      int jumlah = int.parse(stdin.readLineSync()!);

      for (var i = 0; i < jumlah; i++) {
        stdout.write("Masukkan data ke-${i + 1}: ");
        String kata = stdin.readLineSync()!;
        sampel.add(kata);
      }

      Map<String, int> frekuensi = hitungData(sampel);

      frekuensi.forEach((key, value) {
        print("$key\t: $value");
      });
      stdout.write("\n");
    } else if (choice == 3) {
      // end program
      print("Program Selesai!!\n");
      break;
    } else {
      // wrong
      print("Kode yang anda masukkan salah\n");
    }
  } while (choice != 3);
}
