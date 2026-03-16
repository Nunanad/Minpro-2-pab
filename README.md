<<<<<<< HEAD
# mygoat

A new Flutter project.

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

## Dokumentasi

<img width="1919" height="905" alt="image" src="https://github.com/user-attachments/assets/01025d03-4d31-412f-9a23-d82f91395526" />

<img width="1919" height="909" alt="image" src="https://github.com/user-attachments/assets/8ef783ac-e5c6-45fe-b621-fc569c667867" />

<img width="1919" height="905" alt="image" src="https://github.com/user-attachments/assets/835c265c-da0e-4e2a-8a30-9115014dda48" />

<img width="1919" height="1075" alt="Screenshot 2026-02-28 234859" src="https://github.com/user-attachments/assets/baf2e509-249c-4283-a5fe-bfad5a34fbfa" />

<img width="1919" height="908" alt="image" src="https://github.com/user-attachments/assets/de2d9ea5-f7f5-4db0-bd9a-71cee99d3316" />

<img width="1919" height="908" alt="image" src="https://github.com/user-attachments/assets/a451f880-85ec-4fd8-b6de-10a168b7b0be" />

<img width="1919" height="906" alt="image" src="https://github.com/user-attachments/assets/b81dfe0b-31af-4a82-a416-e17a6f78e143" />



>>>>>>> a43fa7672e51e779300a58d1155db166f9a30e31
