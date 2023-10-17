# (20) Flutter Rest API

Representational State Tranfer Application Programming Interface merupakan sebuah arsitektural yang memisahkan tampilan dengan proses bisnis. Bagian tampilan dengan proses bisnis berkirim data melalui HTTP Request. 

## HTTP
HTTP merupakan sebuah protokol yang digunakan untuk berkirim data pada internet dan biasanya data tersebut berbentuk media web. Pola komunikasinya adalah Client mengirim request lalu server mengolah dan mambalas dengan memberi response.

**Struktur Request:**
**1. URL**
Alamat halaman yang akan diakses.
**2. Method(GET, POST, PUT, DELETE)**
Menunjukkan aksi yang diinginkan
**3. Header**
Informasi tambahan terkait request yang dikirimkan.
**4. Body**
Data yang disertakan bersama request.

**Struktur Response:**
**1. Status Code**
Kode yang mewakili keseluruhan response, baik sukses maupun gagal.
**2. Header**
Informasi tambahan terkait response yang diberikan.
**3. Body**
Data yang disertakan bersama response.

## DIO
Dio merupakan sebuah library Flutter yang digunakan untuk melakukan HTTP requests. Package ini biasanya digunakan dalam Flutter untuk berkomunikasi dengan server atau mengambil data dari API. Dio juga dapat melakukan permintaan HTTP seperti GET, POST, PUT, DELETE, dan lainnya dengan mudah. Ini juga mendukung fitur-fitur seperti mengirim data dalam bentuk JSON, menambahkan header ke permintaan, mengelola cookie, dan mengatur timeout.

**Cara penggunaan DIO:**
1. Instalasi
Tambahkan atau daftarkan package pada pubspec.yaml.
```yaml
dependencies:
  flutter: 
    sdk: flutter
  dio: ^5.3.3
```
2. Get API
Cara mengambil data API menggunakan DIO
```dart
import 'package:dio/dio.dart'

void getHttp() async {
  final response = await Dio().get('https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts');
  print(response);
}
```

## Serialisasi JSON
Serialisasi JSON merupakan sebuah cara untuk mengubah struktur data ke bentuk JSON. Untuk mengubahnya kita dapat menggunakan fungsi jsonEncode dari package dart:convert.

```dart
import 'dart:convert';

// Membuat objek Dart
Map<String, dynamic> person = {'name': 'John Thor', 'age': 30};

// Serialisasi objek menjadi JSON
String jsonString = json.encode(person);
```

## Deserialisasi JSON
Deserialisasi JSON merupakan sebuah cara untuk mengubah bentuk JSON ke struktur data. Untuk mengubahnya kita dapat menggunakan fungsi jsonDecode dari package dart:convert.

```dart
import 'dart:convert';

// Data JSON dari API
String jsonData = '{"name": "Alice", "age": 25}';

// Deserialisasi JSON menjadi objek Dart
Map<String, dynamic> person = json.decode(jsonData);
```

# (21) MVVM Architecture
MVVM (Model-View-ViewModel) adalah sebuah pola desain arsitektur yang digunakan dalam pengembangan aplikasi Flutter untuk memisahkan antara logic dengan tampilan (View) ke dalam ViewModel.

**Keuntungan:**
1. Reusability
Jika ada beberapa tampilan yang memerlukan alur logic yang sama, mereka bisa menggunakan ViewModel yang sama.
2. Maintainability
Mudah dirawat karena pekerjaan terkait tampilan tidak tertumpuk bersama logic.
3. Testability
Pengujian menjadi terpisah antara pengujian tampilan dengan pengujian logic sehingga dapat meningkatkan produktivitas pada pengujian. 

**Struktur Direktori:**
Model memiliki 2 bagian, yaitu bentuk data yang akan digunakan dan sumber dari data tersebut. Tiap screen diletakkan dalam sebuah direktori yang di dalamnya terdapat View dan ViewModel.

**Model:**
Model merupakan bentuk data yang akan digunakan, dibuat dalam bentuk class. Data data yang dimuat diletakkan pada property.

```dart
class ContactModels {
  int id;
  String name;
  String phone;

  ContactModels({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory ContactModels.fromJson(Map<String, dynamic> json) => ContactModels(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
  };
}
```

**ViewModel:**
ViewModel menyimpan data data dan logic yang diperlukan pada sebuah halaman. Jika widgetlain memerlukan logic yang sama, maka dapat menggunakan ViewModel ini juga.

```dart
class ContactViewModel with ChangeNotifier {
  List<ContactModels>? _contactList = [];

  List<ContactModels>? get contactList => _contactList;

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  void getAllContacts() async {
    _isLoading = true;
    try {
      final data = await ContactApi.getContact();
      _contactList = data;
      print('Proses Berhasil');
    } catch (e) {
      print('Proses Catch $e');
      _contactList = null;
    } finally {
      print('Proses Final');

      _isLoading = false;
    }
    notifyListeners();
  }

  Future<void> postContact(ContactModels newContact) async {
    _isLoading = true;
    try {
      final createdContact = await ContactApi.postContact(newContact);
      if (_contactList != null) {
        _contactList!.add(createdContact);
      }
      print('Kontak baru berhasil dibuat');
    } catch (e) {
      print('Gagal membuat kontak: $e');
    } finally {
      _isLoading = false;
    }
    notifyListeners();
  }
}
```

**Mendaftarkan ViewModel:**
Menggunakan MultiProvider agar dapat menggunakan banyak ViewModel. MaterialApp sebagai child utama.

```dart
MultiProvider(
  providers: [
  ChangeNotifierProvider<ContactViewModel>(
    create: (context) => ContactViewModel(),
  ),
  ],
  child: MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    home: ContactPage(),
  ),
);
```

**Menampilkan data di View:**
Setelah melakukan hal di atas kita dapat memanggil fungsi diatas yang telah menggunakan state management provider. Kita hanya perlu menggunakan Provider.of() untuk memanggil di semua file.