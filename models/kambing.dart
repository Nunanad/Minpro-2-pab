import 'riwayat_berat.dart';

class Kambing {
  String id;
  String nama;
  int umur;
  DateTime tanggalMasuk;
  String jenisKelamin;
  String jenisKambing;
  double beratAwal;
  List<RiwayatBerat> riwayatBerat;

  Kambing({
    required this.id,
    required this.nama,
    required this.umur,
    required this.tanggalMasuk,
    required this.jenisKelamin,
    required this.jenisKambing,
    required this.beratAwal,
    required this.riwayatBerat,
  });

  double get beratTerakhir {
    if (riwayatBerat.isEmpty) {
      return beratAwal;
    }
    return riwayatBerat.last.berat;
  }
}