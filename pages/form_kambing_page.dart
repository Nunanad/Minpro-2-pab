import 'package:flutter/material.dart';
import '../models/kambing.dart';


class FormKambingPage extends StatefulWidget {
  const FormKambingPage({super.key});

  @override
  State<FormKambingPage> createState() => _FormKambingPageState();
}

class _FormKambingPageState extends State<FormKambingPage> {
  final _formKey = GlobalKey<FormState>();

  final namaController = TextEditingController();
  final umurController = TextEditingController();
  final jenisController = TextEditingController();
  final beratController = TextEditingController();


String? jenisKelamin;
String? jenisKambing;
DateTime? tanggalMasuk;

  Future<void> pilihTanggal() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        tanggalMasuk = picked;
      });
    }
  }

  void simpanData() {
    if (_formKey.currentState!.validate() && tanggalMasuk != null) {
      final kambingBaru = Kambing(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        nama: namaController.text,
        umur: int.parse(umurController.text),
        tanggalMasuk: tanggalMasuk!,
        jenisKelamin: jenisKelamin!,
        jenisKambing: jenisController.text,
        beratAwal: double.parse(beratController.text),
        riwayatBerat: [],
      );

      Navigator.pop(context, kambingBaru);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Kambing"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(labelText: "Nama Kambing"),
                validator: (value) =>
                    value!.isEmpty ? "Nama wajib diisi" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: umurController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Umur (tahun)"),
                validator: (value) =>
                    value!.isEmpty ? "Umur wajib diisi" : null,
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: pilihTanggal,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tanggalMasuk == null
                        ? "Pilih Tanggal Masuk"
                        : "${tanggalMasuk!.day}-${tanggalMasuk!.month}-${tanggalMasuk!.year}",
                  ),
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: jenisKelamin,
                items: const [
                  DropdownMenuItem(
                    value: "Jantan",
                    child: Text("Jantan"),
                  ),
                  DropdownMenuItem(
                    value: "Betina",
                    child: Text("Betina"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    jenisKelamin = value!;
                  });
                },
                decoration:
                    const InputDecoration(labelText: "Jenis Kelamin"),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: jenisController,
                decoration:
                    const InputDecoration(labelText: "Jenis Kambing"),
                validator: (value) =>
                    value!.isEmpty ? "Jenis kambing wajib diisi" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: beratController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: "Berat Awal (kg)"),
                validator: (value) =>
                    value!.isEmpty ? "Berat wajib diisi" : null,
              ),
              const SizedBox(height: 20),
          ElevatedButton(
  onPressed: () {
  if (_formKey.currentState!.validate()) {

    final kambing = Kambing(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      nama: namaController.text,
      umur: int.parse(umurController.text),
      tanggalMasuk: tanggalMasuk ?? DateTime.now(),
      jenisKelamin: jenisKelamin ?? "Tidak diketahui",
      jenisKambing: jenisKambing ?? "Tidak diketahui",
      beratAwal: double.parse(beratController.text),
      riwayatBerat: [],
    );

    Navigator.pop(context, kambing);
  }
},
  child: const Text("Simpan"),
),
            ],
          ),
        ),
      ),
    );
  }
}