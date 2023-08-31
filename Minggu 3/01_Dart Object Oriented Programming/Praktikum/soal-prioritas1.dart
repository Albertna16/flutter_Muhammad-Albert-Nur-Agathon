import 'dart:io';

class Hewan {
  // inisiasi variabel berat
  int berat = 0;
}

class Mobil {
  // inisiasi variabel kapasitas dan muatan
  int kapasitas = 0;
  List<Hewan> muatan = [];

  // digunakan untuk menghitung total muatan hewan
  int totalMuatan() {
    int total = 0;
    for (int i = 0; i < muatan.length; i++) {
      total += muatan[i].berat;
    }
    return total;
  }

  // digunakan untuk cek apakah total muatan melebihi kapasitas atau tidak
  bool tambahMuatan(Hewan hewan) {
    if (hewan.berat + totalMuatan() > kapasitas) {
      print("Hewan tidak dapat ditambahkan");
      return false;
    } else {
      muatan.add(hewan);
      print("Hewan ditambahkan, dengan kapasitas saat ini ${totalMuatan()}");
      return true;
    }
  }
}

void main() {
  // create object
  Mobil truk = Mobil();
  bool addedAll = true;

  // input jumlah hewan
  stdout.write("Masukkan jumlah hewan\t: ");
  int jumlah = int.parse(stdin.readLineSync()!);
  
  // input kapasitas truk
  stdout.write("Masukkan kapasitas truk\t: ");
  truk.kapasitas = int.parse(stdin.readLineSync()!);

  // digunakan untuk input berat tiap hewan dan cek apakah totalmuatan melebihi kapasitas atau tidak
  for (var i = 0; i < jumlah; i++) {
    Hewan hewan = Hewan();
    stdout.write("\nMasukkan berat hewan ke-${i + 1}: ");
    hewan.berat = int.parse(stdin.readLineSync()!);

    if (!truk.tambahMuatan(hewan)) {
      addedAll = false;
      break;
    }
  }

  if (addedAll) {
    print("Semua hewan telah ditambahkan ke truk!!!");
  } else {
    print("Proses dihentikan karena kapasitas terlampaui!!!");
  }
}
