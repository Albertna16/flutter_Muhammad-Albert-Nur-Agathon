import 'dart:io';

Future<BigInt> factorial(BigInt bil) async {
  // factorial proses
  if (bil <= BigInt.one) {
    return BigInt.one;
  } else {
    return bil * await factorial(bil - BigInt.one);
  }
}

void main() async {
  int? choice;
  do {
    print("Program Soal Prioritas 2");
    print("1. Soal nomor 1");
    print("2. Soal nomor 2");
    print("3. Soal nomor 3");
    print("4. Exit");
    stdout.write("Pilih kode diatas(1-4): ");
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
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
    } else if (choice == 2) {
      // declare and initite variabel
      List data = [];
      double total = 0;

      // input jumlah bilangan
      stdout.write("Masukkan jumlah bilangan: ");
      int bil = int.parse(stdin.readLineSync()!);

      // perulangan untuk input angka ke 1 hingga ke n
      for (var i = 0; i < bil; i++) {
        stdout.write("Masukkan angka ke-${i + 1}: ");
        int angka = int.parse(stdin.readLineSync()!);
        data.add(angka);
      }

      // menampilkan list dan proses perhitungan menggunakan perulangan
      print("\nList: $data");
      for (var i = 0; i < bil; i++) {
        total += data[i];
      }
      print("Total: $total, Frekuensi: $bil");
      total = total / bil;
      print("Rata rata penjumlahan list: ${total.ceil()}\n");
    } else if (choice == 3) {
      // input angka yang ingin di faktorialkan
      stdout.write("Masukkan angka: ");
      BigInt bil = BigInt.parse(stdin.readLineSync()!);
      BigInt hasil = await factorial(bil);

      // call function
      print("Faktorial dari $bil adalah $hasil\n");
    } else if (choice == 4) {
      // end program
      print("Program Selesai!!\n");
      break;
    } else {
      // wrong
      print("Kode yang anda masukkan salah\n");
    }
  } while (choice != 4);
}
