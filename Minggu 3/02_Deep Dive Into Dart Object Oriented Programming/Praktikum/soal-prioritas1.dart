import 'dart:io';

class BangunRuang {
  int panjang;
  int lebar;
  int tinggi;

  BangunRuang(this.panjang, this.lebar, this.tinggi);

  int volume() {
    return 0;
  }
}

class Kubus extends BangunRuang {
  int? sisi;

  Kubus(this.sisi) : super(0, 0, 0);

  @override
  int volume() {
    return sisi! * sisi! * sisi!;
  }
}

class Balok extends BangunRuang {
  Balok(super.panjang, super.lebar, super.tinggi);

  @override
  int volume() {
    return panjang * lebar * tinggi;
  }
}

void main() {
  while (true) {
    print("1. Volume Kubus");
    print("2. Volume Balok");
    print("3. Exit");

    stdout.write("Pilih kode diatas(1-3): ");
    int pilihan = int.parse(stdin.readLineSync()!);

    if (pilihan == 1) {
      stdout.write("Masukkan panjang sisi: ");
      int sisi = int.parse(stdin.readLineSync()!);

      Kubus kubus = Kubus(sisi);
      print("Volume Kubus = ${kubus.volume()}\n");
    } else if (pilihan == 2) {
      stdout.write("Masukkan nilai panjang: ");
      int panjang = int.parse(stdin.readLineSync()!);
      stdout.write("Masukkan nilai lebar: ");
      int lebar = int.parse(stdin.readLineSync()!);
      stdout.write("Masukkan nilai tinggi: ");
      int tinggi = int.parse(stdin.readLineSync()!);

      Balok balok = Balok(panjang, lebar, tinggi);
      print("Volume Balok = ${balok.volume()}\n");
    } else if (pilihan == 3) {
      stdout.write("\n");
      break;
    } else {
      print("Kode yang anda masukkan salah\n");
    }
  }
}
