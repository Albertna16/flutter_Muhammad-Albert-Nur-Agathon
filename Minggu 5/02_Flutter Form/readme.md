# (12) Flutter Form

## Form
Form merupakan sebuah widget yang digunakan untuk menerima isian data dari pengguna dan isia data dapat lebih dari satu. Jika kita menggunakan widget form kita harus menggunakan StatefulWidget. Keadaan form disimpan menggunakan GlobalKey FormState.
```dart
// property
var formKey = GlobalKey<FormState>();

// build
Form(
  key: formKey,
  child: InputWidgets,
),
```

## Input
## TextField
TextField merupakan sebuah widget yang digunakan untuk menerima isian data dari pengguna dan isia data dapat lebih dari satu. Data diambil menggunakan TextEditingController dan isian data dapat berupa teks. 
```dart
// property
var inputController = TextEditingController();

// build
TextField(
  controller: inputController,
),
```

## Radio
Radio merupakan sebuah widget yang digunakan untuk memberikan pilihan atau opsi kepada pengguna untuk dapat memilih value yang diinginkan dan pengguna hanya dapat memilih 1 opsi saja. Data dari radio diambil menggunakan property dengan tipe data sesuai value pada radio.
```dart
// property
var radioValue = "";

// build
Radio<String>(
  value: "Laki-laki",
  groupValue: radioValue,
  onChanged: (String? value){
    setState((){
      radioValue = value ?? "";
    });
  },
),
```

## CheckBox
CheckBox merupakan sebuah widget yang digunakan untuk memberikan pilihan atau opsi kepada pengguna untuk dapat memilih value yang diinginkan dan pengguna dapat memilih beberapa opsi. Data dari checkbox diambil menggunakan property bertipe boolean.
```dart
// property
var checkValue = false ;

// build
CheckBox(
  value: checkValue,
  onChanged: (bool? value){
    setState((){
      checkValue = value ?? false;
    });
  },
),
```

## DropdownButton
DropdownButton merupakan sebuah widget yang digunakan untuk memberikan pilihan atau opsi kepada pengguna untuk dapat memilih value yang diinginkan dan pengguna hanya dapat memilih 1 opsi saja, serta opsi tidak ditampilkan di awal, tetapi ditampilkan ketika opsi tersebut telah ditekan. Data dari DropdownButton diambil menggunakan property dengan tipe data sesuai value pada DropdownMenuItem.
```dart
// property
var dropdownValue = 0;

// build
DropdownButton(
  value: dropdownValue,
  onChanged: (int? value){
    setState((){
      dropdownValue = value ?? 0;
    });
  },
  item: const [
    DropdownMenuItem(
      value: 0,
      child: Text("Pilih...."),
    ),
    DropdownMenuItem(
      value: 1,
      child: Text("Satu"),
    ),
    DropdownMenuItem(
      value: 2,
      child: Text("Dua"),
    ),
  ]
),
```

## Button
Button merupakan sebuah tombol yang dibuat untuk melakukan sesuatu saat tombol tersebut ditekan.

## ElevatedButton
ElevatedButton merupakan sebuah widget yang digunakan untuk membuat button yang timbul dan ketika ditekan akan menjalankan onPressed. 
```dart
ElevatedButton(
  child: const Text("Submit"),
  onPressed: (){
    // lakukan sesuatu
  },
),
```

## IconButton
IconButton merupakan sebuah widget yang digunakan untuk membuat button yang hanya menampilkan icon dan ketika ditekan akan menjalankan onPressed.
```dart
IconButton(
  icon: const Icon(Icons.add),
  onPressed: (){
    // lakukan sesuatu
  },
),
```