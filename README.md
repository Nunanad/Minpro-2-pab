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
## Dokumentasi




