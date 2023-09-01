import 'dart:io';

class Buku {
  int id;
  String judul;
  String penerbit;
  int harga;
  String kategori;

  Buku(
    this.id,
    this.judul,
    this.penerbit,
    this.harga,
    this.kategori,
  );
}

class TokoBuku {
  List<Buku> listBuku = [];

  void tambahBuku(Buku buku) {
    listBuku.add(buku);
  }

  void hapusBuku(Buku buku) {
    listBuku.remove(buku);
  }

  void tampilBuku() {
    for (var i = 0; i < listBuku.length; i++) {
      print("Data buku ke-${i + 1}: ");
      print("Id: ${listBuku[i].id}");
      print("Judul: ${listBuku[i].judul}");
      print("Penerbit: ${listBuku[i].penerbit}");
      print("Harga: ${listBuku[i].harga}");
      print("Kategori: ${listBuku[i].kategori}\n");
    }
  }
}

void main() {
  var tokoBuku = TokoBuku();

  while (true) {
    print("1. Tambah buku");
    print("2. Hapus buku");
    print("3. Lihat data buku");
    print("4. Exit");

    stdout.write("Pilih kode diatas(1-4): ");
    int pilihan = int.parse(stdin.readLineSync()!);

    if (pilihan == 1) {
      stdout.write("Masukkan id buku\t: ");
      int id = int.parse(stdin.readLineSync()!);
      stdout.write("Masukkan judul buku\t: ");
      String judul = stdin.readLineSync()!;
      stdout.write("Masukkan penerbit buku\t: ");
      String penerbit = stdin.readLineSync()!;
      stdout.write("Masukkan harga buku\t: ");
      int harga = int.parse(stdin.readLineSync()!);
      stdout.write("Masukkan kategori buku\t: ");
      String kategori = stdin.readLineSync()!;

      var bukuBaru = Buku(id, judul, penerbit, harga, kategori);
      tokoBuku.tambahBuku(bukuBaru);
      stdout.write("\n");
    } else if (pilihan == 2) {
      tokoBuku.tampilBuku();
      stdout.write("Pilih data buku untuk dihapus: ");
      int dataBuku = int.parse(stdin.readLineSync()!) - 1;

      if (dataBuku >= 0 && dataBuku < tokoBuku.listBuku.length) {
        tokoBuku.hapusBuku(tokoBuku.listBuku[dataBuku]);
        print("Buku berhasil dihapus!!\n");
      } else {
        print("Id yang anda pilih tidak terdaftar\n");
      }
    } else if (pilihan == 3) {
      tokoBuku.tampilBuku();
      stdout.write("\n");
    } else if (pilihan == 4) {
      stdout.write("\n");
      break;
    } else {
      print("Kode yang anda masukkan salah\n");
    }
  }
}
