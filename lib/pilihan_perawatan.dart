import 'package:flutter/material.dart';
import 'package:flutter_application_kesehatan/add_form.dart';
import 'package:flutter_application_kesehatan/halaman_catatan.dart';
import 'package:flutter_application_kesehatan/konsultasi.dart';

class PilihPerawatanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perawatan Anak'),
        backgroundColor: Color(0xFF674AEF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // Mengubah menjadi CrossAxisAlignment.stretch
          children: [
            SizedBox(height: 16),
            Text(
              'Catat Pertumbuhan Anak Anda Disini',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddForm(),
                    ));
              },
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.blue,
                child: Text(
                  'Catatatan Pertumbuhan Si kecil',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    )); // Tambahkan logika untuk menu kedua
              },
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.blue,
                child: Text(
                  'Lihat Catatan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KonsultasiPage(),
                    )); // Tambahkan logika untuk menu kedua
              },
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.blue,
                child: Text(
                  'Konsultasi Dengan Dokter anak',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            // Tambahkan widget lainnya di sini
          ],
        ),
      ),
    );
  }
}
