import 'package:flutter/material.dart';

class KesehatanPage extends StatefulWidget {
  @override
  State<KesehatanPage> createState() => _KesehatanPageState();
}

class _KesehatanPageState extends State<KesehatanPage> {
  TextEditingController tinggiController = TextEditingController();
  TextEditingController usiaController = TextEditingController();
  String hasil = '';

  void hitungBeratBadanIdeal() {
    double tinggi = double.tryParse(tinggiController.text) ?? 0.0;
    int usia = int.tryParse(usiaController.text) ?? 0;

    if (tinggi > 0 && usia > 0) {
      double beratBadanIdeal = (tinggi - 100 + (usia / 10)) * 0.9;
      setState(() {
        hasil = 'Berat Badan Ideal: ${beratBadanIdeal.toStringAsFixed(2)} kg';
      });
    } else {
      setState(() {
        hasil = 'Masukkan tinggi dan usia yang valid.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Periksa Kesehatan Anak'),
        backgroundColor: Color(0xFF674AEF),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Text(
              'Kalkulator Berat Badan Anak',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: tinggiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Tinggi (cm)'),
            ),
            SizedBox(height: 30),
            TextField(
              controller: usiaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Usia (tahun)'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: hitungBeratBadanIdeal,
              child: Text('Hitung Berat Badan Ideal'),
            ),
            SizedBox(height: 16),
            Align(
              alignment:
                  Alignment.centerLeft, // Sesuaikan alignment sesuai kebutuhan
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0), // Sesuaikan padding kiri sesuai kebutuhan
                child: Text(
                  'Hasil Perhitungan',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Align(
              alignment:
                  Alignment.centerLeft, // Sesuaikan alignment sesuai kebutuhan
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0), // Sesuaikan padding kiri sesuai kebutuhan
                child: Text(
                  hasil,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
