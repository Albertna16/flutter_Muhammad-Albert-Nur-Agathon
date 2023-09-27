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

# (15) Dialog & Bottom Sheet

## AlertDialog
AlertDialog merupakan sebuah widget yang digunakan untuk memunculkan sebuah dialog pada tampilan android. Widget tersebut membutuhkan helper method showDialog(). Widget tersebut biasa digunakan untuk menginformasikan pengguna tentang situasi tertentu, bisa juga digunakan untuk mendapatkan inputan dari user. 

**Contoh penggunaan AlertDialog**
```dart
ElevatedButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Invalid Name"),
          content: const Text("Data nama yang anda masukkan salah"),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Kembali",),
            ),
          ],
        );
      },
    );
  },
  child: const Text("Submit"),
),
```

## Bottom Sheet
showModalBottomSheet merupakan sebuah widget yang digunakan untuk menampilkan sebuah dialog yang muncul dari bawah layar aplikasi. Widget tersebut membutuhkan dua properti, yaitu context dan builder.

**Contoh penggunaan showModalBottomSheet**
```dart
ElevatedButton(
  onPressed: () {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        Container(
          // berisi konten yang ada di dalam dialog bottom sheet
        ),
      },
    );
  },
  child: const Text("Submit"),
),
```

# (16) Flutter Navigation
Navigation merupakan sebuah cara yang dilakukan untuk berpindah dari halaman satu ke dalaman yang lain.

## Navigation Dasar
1. Navigator.push()
Merupakan perpindahan halaman yang menumpuk halaman baru diatas halaman awal.
```dart
GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(),
      ),
    );
  },
  child: const Icon(Icons.edit),
);
```

2. Navigator.pop()
Merupakan cara untuk kembali ke halaman sebelumnya.

```dart
GestureDetector(
  onTap: () {
    Navigator.pop(context);
  },
  child: const Icon(Icons.backspace),
);
```

3. Navigator.Replacement()
Merupakan cara perpindahan halaman yang mengganti dan sekaligus menghapus halaman sebelumnya dengan halaman baru.
```dart
void _completeLogin() {
  Navigator.pushReplacement<void, void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const MyHomePage(),
    ),
  );
}
```

4. Navigator.pushAndRemoveUntil()
Merupakan cara perpindahan halaman yang menghapus seluruh halaman sebelumnya dan berpindah ke halaman yang baru.
```dart
void _finishAccountCreation() {
  Navigator.pushAndRemoveUntil<void>(
    context,
    MaterialPageRoute<void>(builder: (BuildContext context) => const MyHomePage()),
    ModalRoute.withName('/'),
  );
}
```

## Navigation dengan Named Routes
1. Navigator.pushNamed()
Merupakan perpindahan halaman yang menumpuk halaman baru diatas halaman awal.

2. Navigator.pop()
Merupakan cara untuk kembali ke halaman sebelumnya.

**Mendaftarkan Routes**
- Tambahkan initialRoute dan routes pada MaterialApp
- Tiap route adalah fungsi yang membentuk halaman
```dart
MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  ),
  // menentukan halaman yang pertama kali dibuka 
  initialRoute: '/',

  // daftar halaman yang dapat dibuka
  routes: {
    '/': (_) => const HomeScreen(),
    '/about': (_) => const AboutScreen(),
  }
);
``` 

**Perpindahan Halaman**
```dart
TextButton(
  onPressed: () {
    Navigator.of(context).pushNamed('/about');
  },
  child: const Text("Ya"),
),
```

**Mengirim Data ke Halaman Baru**
Menggunakan arguments saat melakukan pushNamed
```dart
// Mengirim data
TextButton(
  onPressed: () {
    Navigator.of(context).pushNamed(
      '/about',
      arguments: 'Hore'
    );
  },
  child: const Text("Ya"),
),
```

```dart
// Mengambil data
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // mengambil parameter yang dikirim dari arguments
    final parameter = ModalRoute.of(context)!.settings.arguments as String;
    
    return ...;
  }
}
```