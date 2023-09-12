# (10) Flutter Platform WIdget

## MaterialApp
MaterialApp merupakan sebuah widget dasar yang mengemas seluruh widget dalam aplikasi. Widget ini digunakan pada sistem android. Dan saat ingin menggunakan widget ini kita harus meng-import sebuah package 'package:flutter/material.dart'. Di dalam MaterialApp terdapat beberapa struktur yaitu theme, home, route, dan initialRoute.

**Struktur MaterialApp**
1. theme digunakan untuk menentukan tema aplikasi yang ingin digunakan.
```dart
// Struktur dari theme
MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData.dark(),
  home: const MyHomePage(),
);
```
2. home merupakan bagian dari aplikasi yang pertama kali dibuka.
```dart
// Struktur dari home
MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData.dark(),
  home: const MyHomePage(),
);
```
3. routes dan InitialRoute digunakan untuk mengatur halaman hampir sama dengan fungsi dari home.
```dart
// Struktur dari routes dan InitialRoute
MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData.dark(),
  initialRoute: 'home',
  routes: {
    'home': (_) => const HomePgae(),
  },
);
```

## Scaffold
Scaffold merupakan widget dasar untuk membangun sebuah halaman pada MaterialApp. Di dalam widget Scaffold terdapat beberapa struktur yang bisa digunakan seperti appBar, drawer, body, bottomNavigationBar, dan lain lain.

**Struktur Scaffold:**
```dart
Scaffold(
  appBar: AppBar(...),
  drawer: Drawer(...),
  body: ...,
  bottomNavigationBar: BottomNavigationBar(...),
);
```
1. appBar digunakan untuk memberikan sebuah bar menu yang terdapat di bagian atas aplikasi.
2. drawer digunakan untuk membuat side bar.
3. body digunakan untuk membuat bagian utama dalam halaman.
4. bottomNavigationBar digunakan untuk 

## CupertinoApp
CupertinoApp merupakan sebuah widget dasar yang mengemas seluruh widget dalam aplikasi. Widget ini digunakan pada sistem iOS. Dan saat ingin menggunakan widget ini kita harus meng-import sebuah package 'package:flutter/cupertino.dart'.

**Struktur CupertinoApp:**
```dart
final _themeDark = const CupertinoThemeData.raw(
  Brightness.dart,
  null,
  null,
  null,
  null,
  null,
);

CupertinoApp(
  theme: _themeDart,
  home: const HomePage(),
);
```
1. variabel _themeDark dibuat untuk menyimpan tema.
2. kita perlu membuat hal itu karena Cupertino tidak menyediakan ThemeData.Dark() seperti pada MaterialApp.
3. Widget yang pertama kali dijalankan yaitu pada bagian home.

## CupertinoPageScaffold
CupertinoPageScaffold merupakan widget dasar untuk membangun sebuah halaman pada CupertinoApp. Di dalam widget CupertinoPageScaffold terdapat beberapa struktur yang bisa digunakan seperti navigationBar dan child.
```dart
CupertinoPageScaffold(
  navigationBar: CupertinoNavigationBar(...),
  child: ...,
);
```
1. navigationBar merupakan sebuah struktur yang digunakan untuk membuat bar menu pada bagian atas aplikasi.
2. child merupakan sebuah struktur yang digunakan untuk membuat halaman utama.