# (07) Deep Dive Into Dar Object Oriented Programming

### **Constructor**
Constructor merupakan sebuah method yang dijalankan saat pembuatan object. Constructor dapat menerima parameter tetapi tidak memiliki return dan penamaan dari constructor sendiri itu sama dengan nama class. 

Constructor juga memiliki beberapa jenis yaitu 
- Default Constructor
- Named Constructor
- Factory Constructor

Contoh penggunaan Constructor:
```dart
class Hewan {
  // property
  var mata;
  var kaki;

  // default constructor
  Hewan(this.mata);
}
```

### **Inheritance**
Inheritance merupakan sebuah penurunan sifat dari class parent ke class child. Jadi kita membuat class baru dengan memanfaatkan class parent untuk mengambil kemampuan dari class tersebut. keywords untuk melakukan proses inheritance ini kita dapat menambahkan kata 'extends' pada setelah nama class baru diikuti dengan nama class parentnya.

Contoh penggunaan inheritance:
```dart
class Book {
  String title;
  String author;

  Book(this.title, this.author);

  void printInfo() {
    print("Title: $title\n $author");
  }
}

class FictionBook extends Book {
  // property yang berbeda dengan induk
  String genre;
  FictionBook(this.genre, super.title, super.author);

  @override
  void printInfo() {
    print("Genre $genre");
  }
}
```

### **Method Overriding**
Method Overriding merupakan sebuah cara yang digunakan agar class memiliki method yang sama dengan proses yang berbeda. Overriding dilakukan pada class yang melakukan inheritance. Jadi pada class parent sudah memiliki method dan fungsi overriding ini kita menuliskannya pada class child untuk mengambil method tersebut.

Contoh penggunaan method overriding:
```dart
class Book {
  void printInfo() {
    print("Tidak diketahui");
  }
}

class NonFictionBook extends Book {
  @override
  void printInfo() {
    print("Buku Non Fiksi");
  }
}
```

### **Interface**
Interface disini sekilas mirip dengan inheritance. Pada interface kita menambahkan keyword atau kode 'implements' untuk melakukan proses interface. perbedaan interface dengan inheritance terdapat pada class yang melakukan implements wajib untuk melakukan override semua method yang ada pada class parent.

contoh penggunaan interface:
```dart
class ShippingMethod {
  String estimasiDeliveryTime() {
    return "";
  }
}

class GroundShipping implements ShippingMethod {
  @override
  String estimasiDeliveryTime() {
    return "2-5 hari";
  }
}
```

### **Abstract Class**
Abstract class merupakan sebuah class abstrak yang di dalamnya berisi sebuah function dan digunakan dengan menggunakan extends. Class ini tidak dapat dibuat object dan tidak semua method harus di-override.

Contoh penggunaan abstract class:
```dart
abstract class Task {
  String description;
  bool isDone;

  Task(this.description) : isDone = false;

  // non metode abstract
  void markAsDone() {
    isDone = true;
    print("Task $description marked as done");
  }

  // metode abstract
  void printInfo();
}

class RegularTask extends Task {
  RegularTask(super.description);

  @override
  void printInfo() {
    print("REGULAR TASK $description, Status ${isDone ? "Done" : "Not Done"}");
  }
}
```

### **Polymorphism**
Polymorphism merupakan kemampuan data berubah menjadi bentuk lain. Dalam Polymorphism, tipe data yang tidak bisa digunakan adalah super class. Dan dapat dilakukan pada class extends atau implements.

### **Generics**
Generics dapat digunakan pada class atau fungsi. Generics memberikan kemampuan kepada class atau fungsi agar dapat menerima data dengan tipe yang berbeda. Dan tipe data yang diinginkan, ditentukan saat membuat sebuah class atau menjalankan sebuah fungsi.

Contoh penggunaan generics:
```dart
class Box<T> {
  T value;
  Box(this.value);

  void display() {
    print('Nilai dalam kotak: $value');
  }
}

void main() {
  var intBox = Box<int>(42);
  intBox.display();

  var stringBox = Box<String>('Hello, Flutter!');
  stringBox.display();
}
```
