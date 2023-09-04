import 'dart:io';

class Matematika {
  int hasil() {
    return 0;
  }
}

class KelipatanPersekutuanTerkecil implements Matematika {
  int x;
  int y;

  KelipatanPersekutuanTerkecil({required this.x, required this.y});

  @override
  int hasil() {
    int max = x > y ? x : y;
    int i = max;

    while (true) {
      if (i % x == 0 && i % y == 0) {
        return i;
      }
      i += max;
    }
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  int x;
  int y;

  FaktorPersekutuanTerbesar({required this.x, required this.y});

  @override
  int hasil() {
    while (y != 0) {
      int temp = y;
      y = x % y;
      x = temp;
    }
    return x;
  }
}

void main() {
  stdout.write("Masukkan angka ke-1: ");
  int angka1 = int.parse(stdin.readLineSync()!);
  stdout.write("Masukkan angka ke-2: ");
  int angka2 = int.parse(stdin.readLineSync()!);

  KelipatanPersekutuanTerkecil kelipatanPersekutuanTerkecil = KelipatanPersekutuanTerkecil(x: angka1, y: angka2);
  int kpk = kelipatanPersekutuanTerkecil.hasil();

  FaktorPersekutuanTerbesar faktorPersekutuanTerbesar= FaktorPersekutuanTerbesar(x: angka1, y: angka2);
  int fpb = faktorPersekutuanTerbesar.hasil();

  print('KPK dari $angka1 dan $angka2 adalah $kpk');
  print('FPB dari $angka1 dan $angka2 adalah $fpb');
}
