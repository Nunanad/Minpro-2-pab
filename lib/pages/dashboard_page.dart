import 'package:flutter/material.dart';
import '../models/kambing.dart';
import '../models/pakan_harian.dart';
import 'form_kambing_page.dart';
import 'detail_kambing_page.dart';
import '../pages/pakan_page.dart';
import '../main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  List<Kambing> daftarKambing = [];
  List<PakanHarian> daftarPakanKandang = [];
  final supabase = Supabase.instance.client;
  int get totalKambing => daftarKambing.length;

  double get rataRataBerat {
  if (daftarKambing.isEmpty) return 0;

  double total = 0;

  for (var kambing in daftarKambing) {
    total += kambing.beratTerakhir;
  }

  return total / daftarKambing.length;
}

  @override
void initState() {
  super.initState();
  ambilDataKambing();
}
Future<void> ambilDataKambing() async {
  final data = await supabase
      .from('kambing')
      .select()
      .order('created_at');

  daftarKambing = data.map<Kambing>((item) {
    return Kambing(
      id: item['id_kambing'].toString(),
      nama: item['nama'],
      umur: item['umur'],
      tanggalMasuk: DateTime.parse(item['tanggal_masuk']),
      jenisKelamin: item['jenis_kelamin'],
      jenisKambing: item['jenis_kambing'],
      beratAwal: (item['berat_awal'] as num).toDouble(),
      riwayatBerat: [],
      daftarPakan: [],
    );
  }).toList();

  setState(() {});
}
Future<void> tambahPakanSemua(double jumlah) async {

  final pakanBaru = PakanHarian(
    tanggal: DateTime.now(),
    jumlahKg: jumlah,
  );

  daftarPakanKandang.add(pakanBaru);

  await supabase.from('pakan_harian').insert({
    'tanggal': DateTime.now().toIso8601String(),
    'jumlah_kg': jumlah,
  });

  setState(() {});
}
  double get totalPakanHariIni {
    DateTime today = DateTime.now();
    double total = 0;

    for (var pakan in daftarPakanKandang) {
      if (pakan.tanggal.day == today.day &&
          pakan.tanggal.month == today.month &&
          pakan.tanggal.year == today.year) {
        total += pakan.jumlahKg;
      }
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     appBar: AppBar(
  title: const Text("Dashboard MyGoat"),
  centerTitle: true,
  actions: [
    IconButton(
      icon: const Icon(Icons.dark_mode),
      onPressed: () {
        MyGoatApp.of(context)?.toggleTheme();
      },
    )
  ],
),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Row(
              children: [

                Expanded(
                  child: _buildStatCard(
                    "Total Kambing",
                    totalKambing.toString(),
                    Icons.pets,
                    null,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _buildStatCard(
                    "Rata-rata Berat",
                    "${rataRataBerat.toStringAsFixed(1)} kg",
                    Icons.monitor_weight,
                    null,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            _buildStatCard(
              "Pakan Hari Ini",
              "${totalPakanHariIni.toStringAsFixed(1)} kg",
              Icons.grass,
              () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PakanPage(
                      daftarPakan: daftarPakanKandang,
                      onTambahPakan: tambahPakanSemua,
                    ),
                  ),
                );

                setState(() {});
              },
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
              padding: const EdgeInsets.only(top: 8),
                itemCount: daftarKambing.length,
                itemBuilder: (context, index) {

                  final kambing = daftarKambing[index];

                 return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xFF81C784),
                        child: Icon(Icons.pets, color: Colors.white),
                      ),
                      title: Text(
                        kambing.nama,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        kambing.riwayatBerat.isNotEmpty
                            ? "${kambing.jenisKelamin} • ${kambing.riwayatBerat.last.berat} kg"
                            : "${kambing.jenisKelamin} • ${kambing.beratAwal} kg",
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),

                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailKambingPage(kambing: kambing),
                          ),
                        );

                        setState(() {});
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
  backgroundColor: const Color(0xFF66BB6A),
  elevation: 4,
  onPressed: () async {

          await Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const FormKambingPage(),
  ),
);

await ambilDataKambing();

        },

        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildStatCard(
      String title,
      String value,
      IconData icon,
      VoidCallback? onTap,
      ) {

    return InkWell(
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 197, 224, 197),
          borderRadius: BorderRadius.circular(12),
        ),

        child: Row(
          children: [

            Icon(icon, size: 32,
            color: Colors.black,
          ),

            const SizedBox(width: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
  title,
  style: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),
),

Text(
  value,
  style: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
),
              ],
            ),
          ],
        ),
      ),
    );
  }
}