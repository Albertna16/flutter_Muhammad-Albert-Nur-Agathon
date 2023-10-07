# (18) State Management BLoC

## Declarative UI
Flutter memiliki sifat declarative yang artinya flutter membangun UI nya pada screen untuk mencerminkan keadaan state saat ini

1. **State**
State adalah ketika sebuah widget sedang aktif dan widget tersebut menyimpan data di memori. Flutter akan membangun ulang UI nya ketika ada state atau data yang berubah. Ada 2 jenis state dalam flutter, antara lain ephemeral state dan app state.

2. **Ephemeral State**
Digunakan ketika tidak ada bagian lain pada widget tree yang membutuhkan untuk mengakses data widgetnya, contohnya: PageView, BottomNavigationBar, Switch Button. Tidak memerlukan state management yang kompleks dan hanya membutuhkan StatefulWidget dengan menggunakan fungsi setState.

3. **App State**
Digunakan ketika bagian yang lain suatu aplikasi membutuhkan akses data ke state widget, seperti: Login info, Pengaturan preferensi pengguna, Keranjang belanja, dimana informasi yang pengguna pilih di suatu screen yang mana informasi itu akan muncul di screen yang berbeda.

4. **Pendekatan State Management**
setState lebih cocok digunakan pada ephemeral state, lalu untuk provider cocok digunakan di app state, dan untuk bloc menggunakan pola stream/observable untuk memisahkan UI dengan bisnis logicnya.

## BLoC
BLoC atau Business Logic Component yaitu sebuah state management yang memisahkan antara business logic dengan UI. Cara kerja BLoC yaitu pertama menerima event sebagai input, Dianalisa dan dikelola di dalam BLoC, dan menghasilkan state sebagai output. 

**Cara Penggunaan BLoC**
1. Install Package
Kita harus mendaftarkan 2 package terlebih dahulu ke dalam pubspec.yaml yaitu flutter_bloc dan equatable.
2. Membuat Folder BLoC
Kita harus membuat folder BLoC antara lain counter_bloc.dart, counter_event.dart, dan counter_state.dart. untuk penamaan filenya bebas.
3. Menambahkan Event
Di dalam file counter_event.dart tambahkan sebuah event:
```dart
abstract class CounterEvent extends Equatable {
  const CounterEvent(); 
  @override
  List<Object> get props => [];
}
class Increment extends CounterEvent {}
class Decrement extends CounterEvent {};
```
4. Menambahkan State
Tambahkan state di dalam file counter_state.dart:
```dart
class CounterState extends equatable {
  int value = 0;
  CounterState(this.value);
 
  @override
  List<Object> get props => [value];
}
```
5. Menambahkan BlocProvider
Daftarkan BLoC kita ke dalam main.dart
```dart
Widget build(BuildContext context) {
  return BlocProvider<CounterBloc>(
    create: (context) => CounterBloc();
    child: MaterialApp(
      title: 'Flutter BLoC',
      home: const HomePage(),
    )
  );
}
```

6. Bangun sebuah UI dan tambahkan sebuah BlocBuilder untuk mengambil sebuah logic di dalam CounterBloc
```dart
BlocBuilder<CounterBloc, CounterState>(
  builder: (context, state) {
    return Center(
      child: Column(
        Text(
          '${state.value}',
          style: TextStyle(fontSize: 40),
        ),
        SizedBox(
          height: 20
        ),
        ElevatedButton(
          onPressed: () {
            context.read<ContactBloc>().add(Increment());
          },
          child: Text('Increment'),
        ),
        SizedBox(
          height: 10
        ),
        ElevatedButton(
          onPressed: () {
            context.read<ContactBloc>().add(Decrement());
          },
          child: Text('Decrement'),
        ),
      ),
    );
  }
)
```