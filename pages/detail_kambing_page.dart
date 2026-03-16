import 'package:flutter/material.dart';
import '../models/kambing.dart';
import '../models/riwayat_berat.dart';

class DetailKambingPage extends StatefulWidget {
  final Kambing kambing;

  const DetailKambingPage({super.key, required this.kambing});

  @override
  State<DetailKambingPage> createState() => _DetailKambingPageState();
}

class _DetailKambingPageState extends State<DetailKambingPage> {

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

            const Text(
              "Riwayat Berat",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: kambing.riwayatBerat.length,
                itemBuilder: (context, index) {
                  final riwayat = kambing.riwayatBerat[index];
                  return ListTile(
                    title: Text("${riwayat.berat} kg"),
                    subtitle: Text(riwayat.tanggal.toLocal().toString()),
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
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}