import 'dart:io';

class Calculator {
  List<int> data = [];

  int penjumlahan(List<int> data) {
    return data[0] + data[1];
  }

  int pengurangan(List<int> data) {
    return data[0] - data[1];
  }

  int perkalian(List<int> data) {
    return data[0] * data[1];
  }

  double pembagian(List<int> data) {
    return data[0] / data[1];
  }
}

class Course {
  String title;
  String description;

  Course({required this.title, required this.description});
}

class Student {
  String nama;
  String kelas;
  List<Course> kursus = [];

  Student({required this.nama, required this.kelas});

  void tambahKursus(Course course) {
    kursus.add(course);
    print("Kursus berhasil ditambahkan\n");
  }

  void hapusKursus(Course course) {
    kursus.remove(course);
  }

  void tampilKursus() {
    print("Kursus dari $nama: ");
    for (var i = 0; i < kursus.length; i++) {
      print("${i + 1}. ${kursus[i].title} - ${kursus[i].description}");
    }
  }
}

void main() {
  Calculator calculator = Calculator();
  var student = Student(nama: "Muhammad Albert", kelas: "Kelas Harimau");
  int? choice;
  do {
    print("1. Soal nomor 1");
    print("2. Soal nomor 2");
    print("3. Exit");
    stdout.write("Pilih kode diatas(1-3): ");
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      List<int> data = [];
      for (var i = 0; i < 2; i++) {
        stdout.write("Masukkan data ke-${i + 1}: ");
        int bil = int.parse(stdin.readLineSync()!);
        data.add(bil);
      }
      print("Hasil penjumlahan\t= ${calculator.penjumlahan(data)}");
      print("Hasil pengurangan\t= ${calculator.pengurangan(data)}");
      print("Hasil perkalian\t\t= ${calculator.perkalian(data)}");
      print("Hasil pembagian\t\t= ${calculator.pembagian(data)}\n");
    } else if (choice == 2) {
      while (true) {
        print("1. Tambah kursus");
        print("2. Hapus kursus");
        print("3. Lihat kursus");
        print("4. Exit");

        stdout.write("Pilih kode diatas(1-3): ");
        int pilihan = int.parse(stdin.readLineSync()!);

        if (pilihan == 1) {
          stdout.write("Masukkan judul kursus\t\t: ");
          String judul = stdin.readLineSync()!;
          stdout.write("Masukkan deskripsi kursus\t: ");
          String deskripsi = stdin.readLineSync()!;

          var kursusBaru = Course(title: judul, description: deskripsi);
          student.tambahKursus(kursusBaru);
        } else if (pilihan == 2) {
          student.tampilKursus();
          stdout.write("Pilih nomor kursus untuk dihapus: ");
          int pilihan = int.parse(stdin.readLineSync()!) - 1;

          if (pilihan >= 0 && pilihan < student.kursus.length) {
            student.hapusKursus(student.kursus[pilihan]);
            print("Kursus berhasil dihapus!!\n");
          } else {
            print("Nomor yang anda pilih tidak terdaftar\n");
          }
        } else if (pilihan == 3) {
          student.tampilKursus();
          stdout.write("\n");
        } else if (pilihan == 4) {
          stdout.write("\n");
          break;
        } else {
          print("Kode yang anda masukkan salah\n");
        }
      }
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
