import 'dart:io';

bool isPalindrom(String kata){
  int kataKiri = 0;
  int kataKanan = kata.length - 1;

  while (kataKiri < kataKanan) {
    if (kata[kataKiri] != kata[kataKanan]) {
      return false;
    }
    kataKiri++;
    kataKanan--;
  }
  return true;
}

void main() {
  int? choice;
  do {
    print("1. Program palindrom");
    print("2. Program faktor bilangan");
    print("3. Exit");
    stdout.write("Pilih kode diatas(1-3): ");
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      stdout.write("Masukkan kata: ");
      String kata = stdin.readLineSync()!.toLowerCase(); // untuk mengubah semua kata menjadi huruf kecil
      kata = kata.replaceAll(" ", ""); // untuk menghapus spasi pada kata

      if (isPalindrom(kata)) {
        print("Sampel output: Palindrom\n");
      }else{
        print("Sampel output: Bukan palindrom\n");
      }

    } else if (choice == 2) {
      stdout.write("Masukkan bilangan: ");
      int bil = int.parse(stdin.readLineSync()!);

      print("Faktor dari $bil: ");
      for (var i = 1; i <= bil; i++) {
        if (bil % i == 0) {
          print(i);
        }
      }
      print(" ");
    } else if (choice == 3) {
      print("Program Selesai!!\n");
      break;
    } else {
      print("Kode yang anda masukkan salah\n");
    }
  } while (choice != 3);
}
