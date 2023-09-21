# (13) Advance Flutter Form

## Interactice Widgets
Merupakan sebuah interaksi antara aplikasi dan user. Jadi kita mengumpulkan input dan feedback dari user. 

## Date Picker
Date Picker merupakan sebuah widget yang digunakan untuk user bisa memasukkan tanggal. Biasanya date picker ini digunakan untuk memasukkan tanggal kelahiran, waktu pemesanan tiket, waktu reservasi restoran, jadwal meeting, dll

**Cara pembuatan date picker:**
1. Menambahkan packages intl di pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  intl: ^0.18.1
```
2. Mempersiapkan variabel
```dart
DateTime _dueDate = DateTime.now();
final currentDate = DateTime.now();
```
3. Membangun UI
```dart
Widget buildDatePicker(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Date",
          ),
          TextButton(
            onPressed: () {},
            child: Text("Select"),
          ),
        ],
      ),
      Text(
        DateFormat('dd-MM-yyy').format(_dueDate),
      ),
    ],
  );
}
```
4. Menambahkan fungsi showDatePicker dan memanggil fungsi setState di dalam onPressed
```dart
onPressed: () async {
  final selectDate = await showDatePicker(
    context: context,
    initialDate: currentDate,
    firstDate: DateTime(1990),
    lastDate: DateTime(currentDate.year + 5),
  );
  setState(() {
    if (selectDate != null) {
      _dueDate = selectDate;
    }
  });
},
```

## Color Picker
Color Picker merupakan sebuah widget yang digunakan untuk user bisa memilih color yang di inginkan. Biasanya color picker ini digunakan dalam berbagai studi kasus, contohnya sebagai wallpaper atau latar belakang.

**Cara pembuatan color picker:**
1. Install packages flutter_colorpicker di pub.dev dan masukkan ke pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  flutter_colorpicker: ^1.0.3
```
2. Mempersiapkan variabel
```dart
Color _currentColor = Colors.orange;
```
3. Membangun UI
```dart
Widget buildColorPicker(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Color",
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: _currentColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(_currentColor),
        ),
        onPressed: () {},
        child: const Text("Pick Color"),
      )
    ],
  );
}
```
4. Menambahkan fungsi showDialog di dalam onPressed dengan return widget AlertDialog
```dart
showDialog(
  context: context,
  builder: (context) {
    return AlertDialog(
      title: const Text("Pick your Color"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Save"),
        ),
      ],
    );
  },
);
```
5. Import packages flutter_colorpicker dalam file dart
```dart
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
```
6. Buat kode untuk penggunaan packages flutter_colorpicker
```dart
return AlertDialog(
  title: Text("Pick your Color"),
  content: BlockPicker(
    pickerColor: _currentColor,
    onColorChanged: (color) {
      setState(() {
        _currentColor = color;
      });
    },
  ),
  actions: [...],
);
```

## File Picker
File picker merupakan sebuah kemampuan widget yang digunakan untuk mengakses storage. File picker ini biasa digunakan untuk studi kasus yang memang membutuhkan file dari ponsel atau laptop yang sedang digunakan.

**Cara membuat file picker:**
1. Install packages file_picker dan open_file di pub.dev
```dart
dependencies:
  flutter:
    sdk: flutter
  file_picker: ^5.5.0
  open_file: ^3.3.2
```
2. Import packages file_picker dan open_file di dart
```dart
import 'package:open_file/open_file.dart';
import 'package:file_picker/file_picker.dart';
```
3. Membangun UI
```dart
Widget buildFilePicker() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Pick Files",
      ),
      const SizedBox(
        height: 10,
      ),
      ElevatedButton(
        onPressed: () {},
        child: const Text("Pick and Open Files"),
      ),
    ],
  );
}
```
4. Membuat fungsi untuk mengexplore dan memilih files dari storage
```dart
void _pickFile() async {
  final result = await FilePicker.platform.pickFiles();
  if (result == null) {
    return;
  }
}
```
5. Memanggil fungsi _pickFile di dalam onPressed
```dart
ElevatedButton(
  onPressed: () {
    _pickFile();
  },
  child: const Text("Pick and Open Files"),
),
```
6. Membuat fungsi untuk membuka files yang telah dipilih
```dart
void _openFiels(PlatformFile file) {
  OpenFile.open(file.path);
}
```
7. Mengambil file dari object result dan memanggil fungsi _openfile di dalam fungsi _pickfile
```dart
void _pickFile() async {
  final result = await FilePicker.platform.pickFiles();
  if (result == null) {
    return;
  }

  // mendapatkan file dari object result
  final file = result.files.first;
  _openFiels(file);
}
```