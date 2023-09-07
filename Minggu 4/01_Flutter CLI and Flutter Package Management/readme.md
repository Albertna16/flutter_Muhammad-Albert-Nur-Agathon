# (09) Flutter CLI and Flutter Package Management

## Flutter CLI
Flutter CLI (Command Line Interface) merupakan sebuah alat yang digunakan untuk berinteraksi dengan Flutter SDK.

**Terdapat perintah perintah penting dalam CLI:**
1. Flutter Doctor yaitu perintah yang digunakan untuk menampilkan informasi software yang dibutuhkan oleh flutter.
```
// terdapat 2 cara
flutter doctor
flutter doctor -v
```

2. Flutter Create yaitu perintah yang digunakan untuk membuat project aplikasi flutter baru.
```
flutter create <APP_NAME>
```

3. Flutter Run yaitu perintah yang digunakan untuk menjalankan project aplikasi di device yang tersedia.
```
flutter run <DART_FILE>
```

4. Flutter Emulator yaitu perintah yang digunakan untuk menampilkan daftar emulator yang terinstall dan menampilkan option untuk membuka emulator atau membuat baru.
```
flutter emulators
flutter emulators --launch <EMULATOR_ID>
flutter emulators --create [--name xyz]
```

5. Flutter Channel yaitu perintah yang digunakan untuk menampilkan daftar flutter channel yang tersedia dan menunjukkan channel yang digunakan saat ini.
```
flutter channel
```

6. Flutter pub yaitu perintah yang digunakan untuk menambahkan packages ataupun mendownload semua packages yang ada di pubspec.yaml
```
// untuk menambahkan packages
flutter pub add <packages_name>

// untuk mendownload semua packages
flutter pub get
```

7. Flutter build yaitu perintah yang digunakan untuk memproduksi sebuah file aplikasi untuk keperluan deploy atau publish ke AppStore, PlayStore, dll.
```
flutter build <DIRECTORY>
```

8. Flutter clean yaitu perintah yang digunakan untuk menghapus folder build serta file lainnya yang dihasilkan saat kita menjalankan aplikasi di emulator. Perintah ini juga akan mengurangi size dari project tersebut.
```
flutter clean
```

## Packages Management
Packages management merupakan pendukung yang biasa digunakan untuk menunjang para developer dalam pembuatan aplikasi. Packages tersebut dibuat oleh developer lain yang hasil buatannya tersebut memudahkan para developer untuk memakai packages tersebut tanpa kita membuat dari awal. 

**Cara menambahkan packages**
1. Cari packages yang ingin ditambahkan di pub.dev
2. Copy baris dependencies yang ada di bagian installing atau klik icon copy di sebelah nama packages
3. Buka file pubspec.yaml
4. Paste barisnya dibawah dependencies
5. Run flutter pub get di terminal atau save file jika menggunakan vscode
6. Import packages di file dart yang memerlukan packages tersebut
7. Packages sudah bisa dipakai
