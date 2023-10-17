# (22) UI Testing
UI Testing merupakan pengujian yang dilakukan pada tampilan suatu aplikasi untuk memastikan aplikasi dapat menerima interaksi dan memberi respon kepada pengguna. Pada flutter juga disebut sebagai widget testing sehingga pengujian dilakukan pada iwdgets dengan menuliskan script yang dapat dijalankan secara otomatis. UI testing juga memiliki keuntungan:
1. Memastikan selutuh widget memberi tampilan yang sesuai
2. Memastikan seluruh interaksi dapat diterima dengan baik
3. Menjadi ketentuan yang harus diikuti saat diperlukan perubahan pada widget

**Cara melakukan UI Testing:**
1. Instalasi Package Testing
Pada umumnya, package testing sudah ter-install sejak project pertama kali dibuat. Tetapi, cara ini dapat dilakukan, jika ingin meng-install secara manual.
```yaml
dev_dependencies:
  flutter test:
    sdk: flutter
```

2. Penulisan Script Testing
Script testing ini berapa pada struktur folder test. Nama file harus diikuti dengan _test.dart seperti contact_test.dart, about_test.dart. Tiap file berisi fungsi main() yang di dalamnya dapat dituliskan script testing. Tiap skenario pengujian disebut test case
```dart
void main() {
  testWidgets('Judul halaman harus ...', (WidgetTester tester) async {
    // ....
  });

  testWidgets('Tombol harus ...', (WidgetTester tester) async {
    // ....
  });
}
```

3. Script Testing
Test case diawali dengan testWidgets dan diberi judul. Simulasi proses mengaktifkan halaman AboutScreen. Memeriksa apakah di halaman tersebut terdapat tesk "About Screen"
```dart
testWidgets('Judul halaman harus About Screen', (WidgetTester tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: AboutScreen(),
    ),
  );

  expect(find.text('About Screen'), findsOneWidget);
});
```

# (23) Output Build Flutter
Output Build Flutter merupakan File/berkas hasil keluaran dari project flutter yang kalian buat. Digunakan untuk merilis aplikasi ke App Store atau Play Store. Terdiri dari formmat APK atau AAB untuk android dan IPA untuk iOS.

## Mode Build
1. Mode debug
Untuk pengujuan selama proses development.
2. Mode profile
Untuk pengujian performa aplikasi
3. Mode release
Untuk merilis aplikasi ke Google Play Store dan Stores android lainnya.

## Build APK
Hanya dapat berjalan di Android dan memiliki format .apk. Dapat di install langsung pada perangkat android.

```
flutter build apk --debug

flutter build apk --profile

flutter build apk --release
```

**Mengatur nama aplikasi:**
Ubah properti **android:label** pada AndroidManifest.xml yang ada di folder android/app/src/AndroidManifest.xml
```xml
<application
    android:label="Counter_app" // ganti disini untuk namanya
    android:name="${applicationName}"
    android:icon="${@mipmap/ic_launcher}"
>
```

**Mengatur Perizinan:**
Menambahkan tag uses-permission, contoh perizinan seperti: Camera, Bluetooth, Internet, dll

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.INTERNET"/>
</manifest>
```

## Build IPA
Hasil output hanya dapat berjalan di iOS. Memiliki format file .ipa. Ketika ingin melakukan build aplikasi kita harus mendaftarkan akun Apple Development Program. Perintah build hanya dapat dijalankan pada perangkat Apple.

**info.plist:**
Tempat konfigurasi data informasi mengenai aplikasi iOS. Berada di folder ios/Runner/info.plist. Untuk mengatur nama aplikasi, ubah nama di dalam tag String dibawah key **Bundle Name** yang ada di info.plist.

## Mengatur Nama Aplikasi
1. Install package rename dengan menjalankan perintah di terminal **flutter pub global activate rename**
```
flutter pub global activate rename
```

2. Jalankan perintah pada terminal flutter pub global run rename getAppName "Nama Aplikasi".
```
flutter pub global run rename getAppName "MVVM App"
```

3. Stop dan jalankan ulang program, maka nama akan otomatis terganti

## Mengatur Icon Aplikasi
1. Buat folder assets di root project flutter
2. Pindahkan file icon yang beresolusi 1024 x 1024, dari folder ic_launcher sebelumnya ke dalam folder assets.
3. Tambahkan package **flutter_launcher_icons** di **dev_dependencies** pada file pubspec.yaml
```yaml
dev_dependencies:
  flutter_launcher_icons: ^0.13.1 
```
4. Tambahkan flutter_icons di pubspec.yaml di bawah dev_dependencies
```yaml
flutter_icons:
  android: true
  ios: true
  image_path: "assets/app_logo.png"
```
5. Jalankan perintah **flutter clean && flutter pub get && flutter pub run flutter_launcher_icons:main** di terminal
```
flutter clean && flutter pub get && flutter pub run flutter_launcher_icons:main
```
6. Stop dan jalankan ulang aplikasi maka otomatis icon dari aplikasi tersebut telah berubah