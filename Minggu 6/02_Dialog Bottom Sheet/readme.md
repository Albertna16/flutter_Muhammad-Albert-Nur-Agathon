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