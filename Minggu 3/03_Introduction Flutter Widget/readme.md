# (08) Introduction Flutter and Flutter Widget

## Flutter
Flutter merupakan alat pengembangan antarmuka pengguna yang digunakan untuk membuat aplikasi mobile, dekstop, dan web. Flutter memiliki keunggulan yaitu mudah digunakan dan dipelajari, produktivitas tinggi, dokumentasi kodenya juga lengkap, dan komunitas yang berkembang pesat seiring berjalannya waktu.

**Bagian dari flutter:**
- SDK (Software Development Kit) marupakan sebuah alat alat untuk membantu proses pengembangan aplikasi.
- Framework merupakan perlengkapan untuk membentu aplikasi yang dapat dikustomisasi.

**Perintah dalam flutter:**
```
// Untuk membuat project
flutter create <nama_project>

// Untuk menjalankan project
flutter run
```

**Struktur direktori**
- Direktori platform => android, ios, web
- Direktori project => lib(utama), test(pengujian)

## Widget
Widget merupakan sebuah alat bantu yang digunakan untuk membentuk antarmuka (UI). Widget juga berupa class yang mana class tersebut kita dapat memanggilnya langsung saat kita sedang membuat program tersebut. Widget tersebut juga dapat terdiri dari beberapa widget lainnya.

## Stetaless Widget
Stateless Widget merupakan widget penting saat kita membuat sebuah program dan merupakan widget yang tidak bergantung pada perubahan data. Stateless Widget hanya fokus pada tampilan saja dan dibuat dengan extends pada class StatelessWidget.

**Contoh penggunaan stateless widget:**
```dart
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter"),
      ),
      body: const Text("Selamat datang"),
    );
  }
}
```

## Stateful Widget
Stateful Widget merupakan widget penting saat kita membuat sebuah program dan merupakan widget yang mementingkan perubahan data dan merupakan kebalikan dari Stateless Widget. Stateful Widget dibuat dengan extends pada class statefulWidget.

**Contoh penggunaan stateful widget:**
```dart
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter"),
      ),
      body: const Text("Selamat datang"),
    );
  }
}
```

## Built in Widget
Pada flutter terdapat beberapa widget yang dapat langsung digunakan dan sudah ter install saat kita menginstall flutter. Widget tersebut yaitu:
- MaterialApp
membangun aplikasi dengan desain material
```dart
MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData.dark(),
  home: const MyHomePage(),
);
```
- Scaffold
Widget yang digunakan untuk membuat sebuah halaman
```dart
Scaffold(
  appBar: AppBar(
    title: const Text("Flutter"),
  ),
  body: const Text("Selamat datang"),
);
```
- AppBar
Widget yang digunakan untuk membuat bar pada bagian atas aplikasi
```dart
AppBar(title: const Text("Flutter")),
```
- Text
Widget yang digunakan untuk menampilkan teks
```dart
const Text("Selamat datang"),
```

