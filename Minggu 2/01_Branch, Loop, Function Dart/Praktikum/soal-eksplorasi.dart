import 'dart:io';

bool isPrime(int bil) {
  // cek apakah bilangan kurang dari sama dengan 1
  if (bil <= 1) {
    return false;
  }

  // perulangan untuk pengecekan karena bilangan prima hanya memiliki 2 faktor pembagi, 1 dan bilangan itu sendiri
  for (int i = 2; i <= bil / 2; i++) {
    // pengecekan jika bilangan dapat dibagi selain 1 dan bilangan itu sendiri dapat dinyatakan bilangan itu bukan prima
    if (bil % i == 0) {
      return false;
    }
  }
  return true;
}

void tabelPerkalian(int bil) {
  // perulangan untuk mencetak tabel perkalian
  for (var a = 1; a <= bil; a++) {
    // perulangan yang paling dalam yang akan dieksekusi terlebih dahulu
    for (var b = 1; b <= bil; b++) {
      var hasil = a * b;
      stdout.write("$hasil\t"); // \t untuk tab setelah hasil perkalian
    }
    print(""); // Pindah baris setelah setiap baris selesai
  }
}

void main() {
  int? choice;
  do {
    print("1. Program Penentuan Bilangan Prima");
    print("2. Program Mencetak Tabel Perkalian");
    print("3. Exit");
    stdout.write("Pilih kode diatas(1-3): ");
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      // input bilangan
      stdout.write("Masukkan bilangan: ");
      int bil = int.parse(stdin.readLineSync()!);

      // pengecekan, jika true itu bilangan prima dan jika false maka salah
      if (isPrime(bil)) {
        print("$bil => bilangan prima\n");
      } else {
        print("$bil => bukan bilangan prima\n");
      }
    } else if (choice == 2) {
      // input bilangan untuk membuat tabel perkalian
      stdout.write("Masukkan bilangan untuk tabel perkalian: ");
      int bil = int.parse(stdin.readLineSync()!);

      // call function
      tabelPerkalian(bil);
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
