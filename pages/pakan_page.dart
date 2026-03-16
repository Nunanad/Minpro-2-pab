import 'package:flutter/material.dart';
import '../models/pakan_harian.dart';

class PakanPage extends StatefulWidget {
  final List<PakanHarian> daftarPakan;

  const PakanPage({super.key, required this.daftarPakan});

  @override
  State<PakanPage> createState() => _PakanPageState();
}

class _PakanPageState extends State<PakanPage> {
  void tambahPakan(double jumlah) {
    setState(() {
      widget.daftarPakan.add(
        PakanHarian(
          tanggal: DateTime.now(),
          jumlahKg: jumlah,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Monitoring Pakan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: widget.daftarPakan.length,
          itemBuilder: (context, index) {
            final pakan = widget.daftarPakan[index];
            return ListTile(
              leading: const Icon(Icons.grass),
              title: Text("${pakan.jumlahKg} kg"),
              subtitle: Text(
                "${pakan.tanggal.day}-${pakan.tanggal.month}-${pakan.tanggal.year}",
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final controller = TextEditingController();

          final hasil = await showDialog<double>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Tambah Pakan"),
                content: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Jumlah Pakan (kg)",
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Batal"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final nilai = double.tryParse(controller.text);
                      if (nilai != null) {
                        Navigator.pop(context, nilai);
                      }
                    },
                    child: const Text("Simpan"),
                  ),
                ],
              );
            },
          );

          if (hasil != null) {
            tambahPakan(hasil);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}