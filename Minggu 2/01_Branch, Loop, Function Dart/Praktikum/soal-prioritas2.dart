import 'dart:io';

void segitigaPiramid(int tinggiPiramid) {
  for (var a = 1; a <= tinggiPiramid; a++) {
    // create space
    for (var b = tinggiPiramid - a; b > 0; b--) {
      stdout.write("   ");
    }
    // create star
    for (var c = 1; c <= 2 * a - 1; c++) {
      stdout.write(" * ");
    }
    print(" ");
  }
}

void jamPasir(int tinggiJamPasir) {
  for (var a = 0; a < tinggiJamPasir; a++) {
    // create space
    for (var b = 1; b < a + 1; b++) {
      stdout.write(" ");
    }
    // create star
    for (var c = 2 * (tinggiJamPasir - a) - 1; c > 0; c--) {
      stdout.write("0");
    }
    print(" ");
  }

  for (var a = 2; a <= tinggiJamPasir; a++) {
    // create space
    for (var b = tinggiJamPasir - a; b > 0; b--) {
      stdout.write(" ");
    }
    // create star
    for (var c = 1; c <= 2 * a - 1; c++) {
      stdout.write("0");
    }
    print(" ");
  }
}

BigInt factorial(BigInt bil) {
  // factorial proses
  if (bil <= BigInt.one) {
    return BigInt.one;
  } else {
    return bil * factorial(bil - BigInt.one);
  }
}

double luasLingkaran(int jari) {
  double luas = 22 / 7 * jari * jari;
  return luas;
}

void main() {
  int? choice;
  do {
    print("1. Program Piramid Bintang");
    print("2. Program Jam Pasir");
    print("3. Program Faktorial");
    print("4. Program Luas Lingkaran");
    print("5. Exit");
    stdout.write("Pilih kode diatas(1-5): ");
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      // input tinggi piramid
      stdout.write("Masukkan tinggi piramid: ");
      int tinggiPiramid = int.parse(stdin.readLineSync()!);

      // call function
      segitigaPiramid(tinggiPiramid);
      print(" ");
    } else if (choice == 2) {
      // input tinggi jam pasir
      stdout.write("Masukkan tinggi jam pasir: ");
      int tinggiJamPasir = int.parse(stdin.readLineSync()!);

      // call function
      jamPasir(tinggiJamPasir);
      print(" ");
    } else if (choice == 3) {
      // input angka yang ingin di faktorialkan
      stdout.write("Masukkan angka: ");
      BigInt bil = BigInt.parse(stdin.readLineSync()!);
      BigInt hasil = factorial(bil);

      // call function
      print("Faktorial dari $bil adalah $hasil\n");
    } else if (choice == 4) {
      // input panjang jari jari
      stdout.write("Masukkan panjang jari jari: ");
      int jari = int.parse(stdin.readLineSync()!);
      
      // initiate variable and call function
      double luas = luasLingkaran(jari);
      print("Luas lingkarang dengan jari jari $jari adalah $luas");
    } else if (choice == 5) {
      // end program
      print("Program Selesai!!\n");
      break;
    } else {
      // wrong
      print("Kode yang anda masukkan salah\n");
    }
  } while (choice != 3);
}
