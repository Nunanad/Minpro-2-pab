import 'package:flutter/material.dart';
import '../models/kambing.dart';
import '../models/riwayat_berat.dart';
import '../pages/pakan_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class DetailKambingPage extends StatefulWidget {
  final Kambing kambing;

  DetailKambingPage({super.key, required this.kambing});

  @override
  State<DetailKambingPage> createState() => _DetailKambingPageState();
}

class _DetailKambingPageState extends State<DetailKambingPage> {

  final supabase = Supabase.instance.client;

  Future<void> tambahRiwayatBerat(int idKambing, double berat) async {

    await supabase.from('riwayat_berat').insert({
      'id_kambing': idKambing,
      'tanggal': DateTime.now().toString().split(' ')[0],
      'berat': berat,
    });

  }

  void tambahBerat(double beratBaru) {
    setState(() {
      widget.kambing.riwayatBerat.add(
        RiwayatBerat(
          tanggal: DateTime.now(),
          berat: beratBaru,
        ),
        
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    final kambing = widget.kambing;

    return Scaffold(
      appBar: AppBar(
        title: Text(kambing.nama),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Umur: ${kambing.umur} tahun"),
            Text("Jenis Kelamin: ${kambing.jenisKelamin}"),
            Text("Jenis Kambing: ${kambing.jenisKambing}"),
            Text("Tanggal Masuk: ${kambing.tanggalMasuk.toLocal()}"),
            

            const SizedBox(height: 20),


ElevatedButton.icon(
  icon: const Icon(Icons.grass),
  label: const Text("Monitoring Pakan"),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PakanPage(
          daftarPakan: kambing.daftarPakan,
        ),
      ),
    );
  },
),

const SizedBox(height: 20),

            const Text(
  "Riwayat Berat",
  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
),

if (kambing.riwayatBerat.isEmpty)
  const Center(
    child: Text("Belum ada riwayat berat"),
  )
else
  Expanded(
    child: ListView.builder(
      itemCount: kambing.riwayatBerat.length,
      itemBuilder: (context, index) {
        final riwayat = kambing.riwayatBerat[index];
        return ListTile(
          leading: const Icon(Icons.monitor_weight),
          title: Text("${riwayat.berat} kg"),
          subtitle: Text(
            "${riwayat.tanggal.day}-${riwayat.tanggal.month}-${riwayat.tanggal.year}",
          ),
        );
      },
    ),
  ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final controller = TextEditingController();

          final hasil = await showDialog<double>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Tambah Berat"),
                content: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Berat (kg)",
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Batal"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final berat = double.tryParse(controller.text);
                      if (berat != null) {
                        Navigator.pop(context, berat);
                      }
                    },
                    child: const Text("Simpan"),
                  ),
                ],
              );
            },
          );

         if (hasil != null) {

  tambahBerat(hasil);

  await tambahRiwayatBerat(
    int.parse(widget.kambing.id),
    hasil,
  );

}
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}