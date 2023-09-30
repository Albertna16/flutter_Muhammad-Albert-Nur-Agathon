# (17) Flutter Global State Management

## State
State merupakan sebuah data yang dapat dibaca saat pembuatan widget dan dapat berubah saat widget sedang aktif. State ini hanya dimiliki oleh StatefulWidget. Setelah kita mempelajari state ini, kita juga perlu untuk merubahnya menjadi global state untuk meningkatkan performa aplikasi dan meringkas code agar lebih mudah dibaca atau readable dan membuat antara widget dapat memanfaatkan state yang sama dengan mudah.

**Contoh penggunaan setState**
```dart
ElevatedButton(
  onPressed: () {
    setState((){
      number = number + 1;
    });
  },
  child: const Text('Tambah'),
),
```

## Global State
Global state merupakan sebuah state biasa yang dapat digunakan pada seluruh widget. Untuk menggunakan global state ini kita dapat memanfaatkan sebuah state management Provider yang dimana kita harus menginstall packagenya terlebih dahulu untuk dapat menggunakan state managemen tersebut.

1. **Instalasi Provider**
Untuk melakukan instalasi, kita hanya mendaftarkan package ke dalam pubspec.yaml dan setelah itu jalankan perintah flutter pub get untuk mendapatkan package tersebut.
```dart
dependencies:
  provider: ^6.0.5
```

2. **Membuat State Provider**
Untuk membuat state provider ini, kita membuat sebuah class baru dengan menambahkan kode ChangeNotifier.
```dart
class Contact with ChangeNotifier {
  List<Map<String, String>> _contacts = [];
  List<Map<String, String>> get contacts => _contacts;

  void add(Map<String, String> contact){
    _contacts.add(contact);
    notifyListeners();
  }
}
```

3. **Mendaftarkan State Provider**
Untuk mendaftarkan provider tersebut kita dapat melakukannya di dalam file main.dart dan didaftarkan pada runApp.
```dart
void main() {
  runApp(
    MultiProvider(
      provider: [
        ChangeNotifierProvider(create: (_) => Contact());
      ],
      child: MyWidget(),
    ),
  );
}
```

4. **Menggunakan State dari Provider**
Untuk menggunakan provider kita dapat menyimpannya di dalam sebuah variabel dan mengambil data melalui getter.
```dart
final contactProvider = Provider.of<Contact>(context);

ListView.builder(
  itemCount: contactProvider.contacts.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(contactProvider.contacts[index]['name'] ?? ''),
      subtitle: Text(contactProvider.contacts[index]['phone'] ?? ''),
    );
  }
)
```