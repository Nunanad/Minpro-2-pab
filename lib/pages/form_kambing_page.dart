import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/kambing.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  final supabase = Supabase.instance.client;

  String? jenisKelamin;
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

 Future<void> simpanData() async {
  if (_formKey.currentState!.validate()) {

    await supabase.from('kambing').insert({
      'nama': namaController.text,
      'umur': int.parse(umurController.text),
      'tanggal_masuk': (tanggalMasuk ?? DateTime.now()).toIso8601String(),
      'jenis_kelamin': jenisKelamin ?? "Tidak diketahui",
      'jenis_kambing': jenisController.text,
      'berat_awal': double.parse(beratController.text),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Data kambing berhasil disimpan"),
      ),
    );

    Navigator.pop(context);
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
                decoration: const InputDecoration(
                  labelText: "Nama Kambing",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.pets),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama tidak boleh kosong";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              
              TextFormField(
                controller: umurController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                  labelText: "Umur Kambing",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Umur tidak boleh kosong";
                  }
                  if (int.tryParse(value) == null) {
                    return "Masukkan angka yang valid";
                  }
                  return null;
                },
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
                value: jenisKelamin,
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
                    jenisKelamin = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Jenis Kelamin",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 12),
              TextFormField(
                controller: jenisController,
                decoration: const InputDecoration(
                  labelText: "Jenis Kambing",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.category),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Jenis kambing wajib diisi" : null,
              ),

              const SizedBox(height: 12),

              /// BERAT
              TextFormField(
                controller: beratController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                ],
                decoration: const InputDecoration(
                  labelText: "Berat Awal (kg)",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.monitor_weight),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Berat tidak boleh kosong";
                  }
                  if (double.tryParse(value) == null) {
                    return "Masukkan angka yang valid";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

             
              ElevatedButton(
                onPressed: simpanData,
                child: const Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}