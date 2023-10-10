# (19) Flutter Storage

## Penyimpanan Lokal
Penyimpnan lokal diperlukan untuk efisiensi penggunaan data internet. Dan penyimpanan lokal di flutter terdapat beberapa cara implementasinya, contohnya seperti: Shared Preferences dan Local Database.

## Shared Preferences
Shared Preferences merupakan sebuah contoh implementasi penyimpanan lokal yang menyimpan data sederhana. Penyimpanan menggunakan Shared Preferences ini menggunakan format key-value. Dan Shared Preferences ini hanya menyimpan tipe data seperti teks, angka, dan boolean. Contoh penggunaan shared preferences seperti menyimpan data login dan menyimpan riwayat pencarian.

**Penggunaan Shared Preferences:**
1. Install package pada pubspec.yaml
```yaml
dependencies:
  flutter: 
    sdk: flutter
  shared_preferences: ^2.2.1
```

2. Write Data
Write data pada package shared preferences ini digunakan untuk menyimpan preferensi atau data dari pengguna ke dalam penyimpanan lokal ponsel, seperti token login dan riwayat pencarian.
```dart
// Obtain shared preferences.
final SharedPreferences prefs = await SharedPreferences.getInstance();

// Save an integer value to 'counter' key.
await prefs.setInt('counter', 10);
// Save an boolean value to 'repeat' key.
await prefs.setBool('repeat', true);
// Save an double value to 'decimal' key.
await prefs.setDouble('decimal', 1.5);
// Save an String value to 'action' key.
await prefs.setString('action', 'Start');
// Save an list of strings to 'items' key.
await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
```

3. Read Data
Read data pada package shared preferences ini digunakan untuk mengambil data yang telah di simpan di aplikasi dan agar dapat digunakan dalam logika atau tampilan aplikasi saat ini. Seperti kita dapat mengambil token yang telah ada ataupun belum saat login, jika belum maka diarahkan ke halaman login dan jika sudah terdapat token maka akan masuk langsung tanpa harus login.
```dart
// Try reading data from the 'counter' key. If it doesn't exist, returns null.
final int? counter = prefs.getInt('counter');
// Try reading data from the 'repeat' key. If it doesn't exist, returns null.
final bool? repeat = prefs.getBool('repeat');
// Try reading data from the 'decimal' key. If it doesn't exist, returns null.
final double? decimal = prefs.getDouble('decimal');
// Try reading data from the 'action' key. If it doesn't exist, returns null.
final String? action = prefs.getString('action');
// Try reading data from the 'items' key. If it doesn't exist, returns null.
final List<String>? items = prefs.getStringList('items');
```

4. Remove an Entry
Remove data pada package shared preferences ini digunakan untuk menghapus preferensi pengguna tertentu atau data yang tidak lagi diperlukan dalam aplikasi seperti menghapus token autentikasi setelah pengguna logout.
```dart
// Remove data for the 'counter' key.
await prefs.remove('counter');
```

## Local Database (SQLite)
SQLite merupakan sebuah package yang digunakan untuk menyimpan dan meminta data dalam jumlah besar pada local device yang bersifat private. Ketika ingin menggunakan packages tersebut kita harus mendaftarkan dulu ke dalam file pubspec.yaml dan packages tersebut telah mendukung insert, read, update, dan remove data.

**Penggunakan Local Database(SQLite):**
1. Intall packages pada file pubspec.yaml
```yaml
dependencies:
  flutter: 
    sdk: flutter
  sqflite: ^2.3.0
  path: ^1.8.3
```

2. Open database:
```dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> openDatabase() async {
  final databasePath = await getDatabasesPath();
  final path = join(databasePath, 'my_database.db');
  final database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    // Ketika database dibuat, buat tabel
    await db.execute(
        'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
  });
  return database;
}
```

3. Insert database:
```dart
Future<void> insertData() async {
  final Database db = await openDatabase();
  await db.insert('my_table', {'column1': 'value1', 'column2': 'value2'});
}
```
4. Fetch Database
```dart
Future<List<Map<String, dynamic>>> fetchData() async {
  final Database db = await openDatabase();
  final List<Map<String, dynamic>> data = await db.query('my_table');
  return data;
}
```

5. Close Database
```dart
Future<void> closeDatabase() async {
  final Database db = await openDatabase();
  await db.close();
}
```