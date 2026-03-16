## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
=======

# 🐐 MyGoat – Aplikasi Manajemen Kambing

MyGoat adalah aplikasi mobile berbasis Flutter yang dirancang untuk membantu peternak dalam mencatat dan memantau data kambing secara digital.  
Aplikasi ini memungkinkan pengguna untuk menambahkan data kambing, melihat detail informasi, serta mencatat riwayat perkembangan berat badan secara berkala.

Project ini dibuat sebagai implementasi konsep CRUD, multi-page navigation, dan manajemen state pada Flutter.

---

## 📱 Fitur Utama

### 1️⃣ Tambah Data Kambing
Pengguna dapat menambahkan data kambing dengan informasi:
- Nama
- Umur
- Tanggal Masuk
- Jenis Kelamin
- Jenis Kambing
- Berat Awal

Data yang ditambahkan akan langsung muncul di dashboard.

---

### 2️⃣ Dashboard Monitoring
Halaman utama menampilkan:
- Total jumlah kambing
- Rata-rata berat kambing
- Daftar kambing yang telah ditambahkan

Dashboard akan otomatis ter-update saat ada data baru.

---

### 3️⃣ Detail Kambing
Setiap kambing memiliki halaman detail yang menampilkan:
- Informasi lengkap kambing
- Riwayat berat badan
- Tanggal pencatatan berat

---

### 4️⃣ Update Berat Berkala
Pengguna dapat menambahkan berat terbaru melalui tombol tambah pada halaman detail.

Setiap penambahan berat akan:
- Disimpan dalam riwayat berat
- Ditampilkan dalam daftar histori
- Mempengaruhi perhitungan rata-rata berat

---

## 🧠 Konsep yang Digunakan

- Stateful Widget
- Form Validation
- Object Passing antar halaman
- Navigator.push() & Navigator.pop()
- List & Relasi Model (Kambing – RiwayatBerat)
- Dynamic ListView
- Manajemen State dengan setState()

---

## 🛠 Teknologi yang Digunakan

- Flutter
- Dart
- Material Design

---

## 🎯 Tujuan Pengembangan

Aplikasi ini dibuat untuk:
- Membantu digitalisasi pencatatan ternak
- Mengurangi pencatatan manual
- Memudahkan monitoring perkembangan berat kambing
- Mengimplementasikan konsep dasar pengembangan aplikasi mobile

---

## 🧩 Penjelasan Widget yang Digunakan

Berikut adalah beberapa widget utama yang digunakan dalam pengembangan aplikasi MyGoat:

### 1️⃣ MaterialApp
Digunakan sebagai root widget aplikasi yang menyediakan konfigurasi dasar seperti tema, title, dan routing.

### 2️⃣ Scaffold
Digunakan sebagai struktur dasar setiap halaman.  
Menyediakan AppBar, body, dan FloatingActionButton.

### 3️⃣ AppBar
Menampilkan judul halaman serta tombol aksi (misalnya tombol monitoring pakan).

### 4️⃣ Column & Row
Digunakan untuk menyusun widget secara vertikal (Column) dan horizontal (Row).  
Dipakai pada dashboard untuk menampilkan kartu statistik.

### 5️⃣ Expanded
Digunakan agar widget mengisi ruang yang tersedia secara proporsional, terutama pada ListView dan kartu statistik.

### 6️⃣ ListView.builder
Digunakan untuk menampilkan daftar data kambing dan riwayat berat secara dinamis berdasarkan jumlah data.

### 7️⃣ ListTile
Digunakan untuk menampilkan satu item data dalam bentuk baris yang berisi title, subtitle, dan ikon navigasi.

### 8️⃣ FloatingActionButton
Digunakan untuk menambahkan data baru (kambing atau pakan).

### 9️⃣ TextFormField
Digunakan dalam form input data kambing dengan validasi.

### 🔟 DropdownButtonFormField
Digunakan untuk memilih jenis kelamin dan jenis kambing.

### 1️⃣1️⃣ showDatePicker
Digunakan untuk memilih tanggal masuk kambing.

### 1️⃣2️⃣ AlertDialog
Digunakan untuk menambahkan data berat atau pakan melalui dialog pop-up.

### 1️⃣3️⃣ Navigator
Digunakan untuk berpindah antar halaman:
- Navigator.push()
- Navigator.pop()

Digunakan untuk mengirim dan menerima data antar halaman.

### 1️⃣4️⃣ setState()
Digunakan untuk memperbarui tampilan ketika data berubah, seperti saat menambah kambing atau memperbarui berat.

---

# 🚀 Pengembangan Mini Project 2

Pada Mini Project 2, aplikasi **MyGoat** dikembangkan lebih lanjut dengan menambahkan **integrasi database menggunakan Supabase** serta fitur monitoring pakan harian.

Dengan integrasi ini, data yang sebelumnya hanya tersimpan secara lokal kini disimpan pada **database cloud**, sehingga lebih terstruktur dan dapat diakses kembali saat aplikasi dijalankan.

---

# 🗄 Integrasi Database Supabase

Supabase digunakan sebagai backend database untuk menyimpan data aplikasi.

Beberapa operasi database yang digunakan dalam aplikasi:

* **Create** → Menambahkan data kambing, pakan, dan riwayat berat
* **Read** → Mengambil data dari database untuk ditampilkan di aplikasi
* **Update** → Memperbarui data tertentu jika diperlukan
* **Delete** → Menghapus data dari database

Database Supabase menyimpan tiga tabel utama:

### Tabel `kambing`

Menyimpan data utama kambing yang dimasukkan oleh pengguna.

Kolom utama:

* id_kambing
* nama
* umur
* jenis_kelamin
* jenis_kambing
* tanggal_masuk
* berat_awal
* created_at

---

### Tabel `pakan_harian`

Menyimpan data jumlah pakan yang diberikan kepada kambing setiap hari.

Kolom utama:

* id_pakan_harian
* tanggal
* jumlah_kg
* created_at

Data ini digunakan untuk menampilkan **total pakan harian pada dashboard**.

---

### Tabel `riwayat_berat`

Menyimpan riwayat perkembangan berat kambing.

Kolom utama:

* id_riwayat
* id_kambing
* tanggal
* berat
* created_at

Data ini digunakan untuk memantau **perkembangan berat badan kambing secara berkala**.

---

# 📊 Fitur Tambahan pada Mini Project 2

## Monitoring Pakan Harian

Pengguna dapat mencatat jumlah pakan yang diberikan setiap hari.

Fitur ini memungkinkan:

* pencatatan jumlah pakan kambing yang ada di kandang
* penyimpanan data pakan ke database
* menampilkan total pakan pada dashboard

---

## Penyimpanan Data Supabase

Dengan penggunaan Supabase, semua data aplikasi tersimpan secara online sehingga:

* data lebih aman
* data tidak hilang saat aplikasi ditutup
* aplikasi dapat mengambil kembali data dari database saat dijalankan


