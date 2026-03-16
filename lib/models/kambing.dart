import 'riwayat_berat.dart';
import 'pakan_harian.dart';

class Kambing {
  String id;
  String nama;
  int umur;
  DateTime tanggalMasuk;
  String jenisKelamin;
  String jenisKambing;
  double beratAwal;
  List<RiwayatBerat> riwayatBerat;
  List<PakanHarian> daftarPakan; 


  Kambing({
    required this.id,
    required this.nama,
    required this.umur,
    required this.tanggalMasuk,
    required this.jenisKelamin,
    required this.jenisKambing,
    required this.beratAwal,
    required this.riwayatBerat,
     required this.daftarPakan,
  });

  double get beratTerakhir {
    if (riwayatBerat.isEmpty) {
      return beratAwal;
    }
    return riwayatBerat.last.berat;
  }
}