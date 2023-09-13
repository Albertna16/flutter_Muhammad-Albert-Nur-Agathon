# Flutter Layout

Layout merupakan sebuah tata letak yang digunakan untuk merancang susunan elemen desain grafis. Dalam flutter layotu berbentuk widget yang mengatur widget di dalamnya.

## Single Child Layout
1. **Container**
Container merupakan sebuah widget yang digunakan untuk membuat box biasanya digunakan untuk membungkus widget lain di dalamnya. Container memiliki banyak parameter yang ada di dalamnya dan biasanya digunakan sesuai kebutuhan dari aplikasi yang dikembangkan.
```dart
Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
    border: Border.all(color: Colors.black, width: 1),
    borderRadius: BorderRadius.circular(10),
  ),
  child: Text("Selamat datang"),
),
```
2. **Center**
Center merupakan sebuah widget yang digunakan untuk meletakkan widget yang dibungkusnya agar berada pada bagian tengah.
```dart
Center(
  child: Text("Selamat datang"),
),
```
3. **SizedBox**
SizedBox merupakan sebuah widget yang digunakan untuk membuat box dan dapat membungkus widget lain yang biasanya digunakan untuk memberikan jarak antara elemen yang satu dengan elemen yang lainnya. Widget ini hampir sama dengan container tetapi sizedbox lebih sederhana dari container.
```dart
SizedBox(
  height: 100,
  width: 80,
  child: Text("Selamat datang"),
),
```

## Multi Child Layout
1. **Column**
Column merupakan sebuah widget yang digunakan untuk menampung banyak widget di dalamnya secara vertical.
```dart
Column(
  children: [
    Container(child: Text("Muhammad")),
    Container(child: Text("Albert")),
    Container(child: Text("Nur")),
    Container(child: Text("Agathon")),
  ],
),
```
2. **Row**
Row merupakan sebuah widget yang digunakan untuk menampung banyak widget di dalamnya secara horizontal.
```dart
Row(
  children: [
    Container(child: Text("Muhammad")),
    Container(child: Text("Albert")),
    Container(child: Text("Nur")),
    Container(child: Text("Agathon")),
  ],
),
```
3. **ListView**
ListView merupakan sebuah widget yang digunakan untuk menampung banyak widget di dalamnya dan dapat memungkinkan untuk di scroll jika elemennya melebihi ukuran dari hp. ListView sendiri memiliki beberapa jenis yaitu ListView.builder, ListView.separated, dan ListView.custom.
- ListView
```dart
ListView(
  padding: const EdgeInsets.all(8),
  children: <Widget>[
    Container(
      height: 50,
      color: Colors.amber[600],
      child: const Center(child: Text('Entry A')),
    ),
    Container(
      height: 50,
      color: Colors.amber[500],
      child: const Center(child: Text('Entry B')),
    ),
    Container(
      height: 50,
      color: Colors.amber[100],
      child: const Center(child: Text('Entry C')),
    ),
  ],
),
```
- ListView.builder
```dart
final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];

Widget build(BuildContext context) {
  return ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 50,
        color: Colors.amber[colorCodes[index]],
        child: Center(child: Text('Entry ${entries[index]}')),
      );
    }
  );
}
```
- ListView.separated
```dart
final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];

Widget build(BuildContext context) {
  return ListView.separated(
    padding: const EdgeInsets.all(8),
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 50,
        color: Colors.amber[colorCodes[index]],
        child: Center(child: Text('Entry ${entries[index]}')),
      );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  );
}
```
4. **GridView**
GridView merupakan sebuah widget yang digunakan untuk menampung banyak widget di dalamnya dan memungkinkan kita untuk melakukan scroll serta dapat mengatur ada berapa banyak item yang terdapat di tiap barisnya. GridView sendiri memiliki beberapa jenis yaitu GridView.count dan GridView.builder.
- GridView.count
```dart
GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 2,
  children: <Widget>[
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[100],
      child: const Text("He'd have you all unravel at the"),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[200],
      child: const Text('Heed not the rabble'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[300],
      child: const Text('Sound of screams but the'),
    ),
  ],
)
```
- GridView.builder
```dart
Widget myWidget(BuildContext context) {
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 300,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.amber,
          child: Center(child: Text('$index')),
        );
      }
    ),
  );
}
```