# (14) Assets
Assets merupakan sebuah file yang di bundled dan di deployed bersamaan dengan aplikasi. Assets pun memiliki beberapa jenis tipe, diantaranya: static data (JSON files), icons,, image, dan font file (ttf). Jika kita ingin menambahkan sebuah assets kita harus memasukkannya di dalam pubspec.yaml yang terletak di root project.

## Image
Image atau gambar biasanya digunakan untuk mempercantik aplikasi yang sedang kita bangun agar lebih menarik di mata user. Flutter juga mendukung beberapa format image, diantaranya: JPEG, WebP, GIF, Animated Web/GIF, PNG, BMP, dan WBMP. Disini kita juga dapat menampilkan gambar yang terdapat pada project asset dan internet. 
```dart
Column(
  children: const [
    Image(
      image: AssetImage('assets/gambar_1.jpg'),
    ),
    const SizedBox(height: 10),
    Image.asset('assets/gambar_2.jpg'),
    const SizedBox(height: 10),
    Image.network('https://image.gambarpng.id/pngs/gambar-transparent-fruits-illustration-image_49023.png'),
  ],
),
```

**Tips**
Jika image yang digunakan untuk membuat aplikasi tersebut sangat banyak, kita dapat menggunakan extension di vscode jika kita ingin membuat gambar tersebut lebih mudah dipanggil dan tidak membutuhkan waktu yang lama untuk membuat menjadi properti class, nama extension tersebut Flutter Assets Gen(cara penggunaan telah ada di dalam deskripsi extension tersebut).

## Font
Font digunakan untuk memperindah teks pada aplikasi yang telah kita buat. Penggunaan font tersebut menjadi keunikan tersendiri pada aplikasi yang sedang kita buat. Penerapan font dapat menggunakan custom font atau dari package.

**Custom font**
cara penggunaan custom font yaitu:
1. Cari dan download font dengan format file (.ttf)
2. Masukkan file tersebut kedalam folder yang telah kita buat
3. Daftarkan font tersebut ke dalam pubspec.yaml
```dart
fonts:
  - family: Rowdies
    fonts:
      - asset; fonts/Rowdies-Bold.ttf
      - asset; fonts/Rowdies-Light.ttf
      - asset; fonts/Rowdies-Regular.ttf
```
4. Mengatur font secara default
```dart
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Advance Flutter Form',
    theme: ThemeData(fontFamily: 'Rowdies'),
    home: const HomePage(),
  );
}
```
5. Mengatur di spesifik widget
```dart
Text(
  'Selamat datang',
  style: TextStyle(
    fontSize: 24,
    fontFamily: 'Rowdies',
  ),
),
```

**Font dari Package**
cara penggunaan font dari package yaitu:
1. Tambahkan package google_fonts di dependencies pada file pubspec.yaml
```dart

  google_fonts: ^6.0.0
```
2. Import package di file dart
```dart
import 'package:google_fonts/google_fonts.dart';
```
3. Memanggil GoogleFonts
```dart
Text(
  'Selamat datang',
  style: GoogleFonts.rowdies(fontSize: 24),
),
```