import 'package:flutter/material.dart';
import '../models/kambing.dart';
import '../models/pakan_harian.dart';
import 'form_kambing_page.dart';
import 'detail_kambing_page.dart';
import 'pakan_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Kambing> daftarKambing = [];
  List<PakanHarian> daftarPakan = [];

  @override
  void initState() {
    super.initState();
  }

  int get totalKambing => daftarKambing.length;

  double get rataRataBerat {
    if (daftarKambing.isEmpty) return 0;
    double total = 0;
    for (var kambing in daftarKambing) {
      total += kambing.beratTerakhir;
    }
    return total / daftarKambing.length;
  }

  double get pakanHariIni {
    DateTime today = DateTime.now();
    for (var pakan in daftarPakan) {
      if (pakan.tanggal.day == today.day &&
          pakan.tanggal.month == today.month &&
          pakan.tanggal.year == today.year) {
        return pakan.jumlahKg;
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard MyGoat'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.grass),
            onPressed: () {},
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
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    "Rata-rata Berat",
                    "${rataRataBerat.toStringAsFixed(1)} kg",
                    Icons.monitor_weight,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildStatCard(
              "Pakan Hari Ini",
              "${pakanHariIni.toStringAsFixed(1)} kg",
              Icons.grass,
            ),
            const SizedBox(height: 20),
           Expanded(
  child: ListView.builder(
    itemCount: daftarKambing.length,
    itemBuilder: (context, index) {
      final kambing = daftarKambing[index];

      return ListTile(
        title: Text(kambing.nama),
       subtitle: Text(
  kambing.riwayatBerat.isNotEmpty
      ? "${kambing.jenisKelamin} • ${kambing.riwayatBerat.last.berat} kg"
      : "${kambing.jenisKelamin} • ${kambing.beratAwal} kg",
),
       trailing: Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    IconButton(
      icon: const Icon(Icons.delete, color: Colors.red),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Hapus Kambing"),
            content: const Text("Yakin ingin menghapus data kambing ini?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Batal"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    daftarKambing.removeAt(index);
                  });
                  Navigator.pop(context);
                },
                child: const Text("Hapus"),
              ),
            ],
          ),
        );
      },
    ),
    const Icon(Icons.arrow_forward_ios, size: 16),
  ],
),
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
      );
    },
  ),
),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
  backgroundColor: Colors.green,
  onPressed: () async {
    final Kambing? kambingBaru = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FormKambingPage(),
      ),
    );

    if (kambingBaru != null) {
      setState(() {
        daftarKambing.add(kambingBaru);
      });
    }
  },
  child: const Icon(Icons.add),
),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF2E7D32)),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }

  }
