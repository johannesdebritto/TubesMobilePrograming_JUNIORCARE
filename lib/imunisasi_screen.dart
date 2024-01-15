import 'package:flutter/material.dart';

class imunisasiPage extends StatefulWidget {
  @override
  State<imunisasiPage> createState() => _imunisasiPageState();
}

class _imunisasiPageState extends State<imunisasiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Imunisasi'),
        backgroundColor: Color(0xFF674AEF),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Image.asset(
              "assets/image/imunisasi.png", // Ganti dengan URL gambar imunisasi yang sesuai
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              'Pentingnya Imunisasi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Imunisasi adalah suatu cara untuk meningkatkan kekebalan tubuh seseorang terhadap suatu penyakit tertentu. Dengan memberikan vaksin, tubuh akan membentuk pertahanan terhadap penyakit tersebut.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Proses Imunisasi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '1. Pemberian Vaksin',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Imunisasi dilakukan dengan memberikan vaksin yang mengandung fragmen lemah atau mati dari mikroorganisme penyebab penyakit. Vaksin dapat terdiri dari bakteri, virus, atau toksin yang diubah sedemikian rupa sehingga tidak menyebabkan penyakit tetapi tetap dapat merangsang sistem kekebalan tubuh.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '2. Stimulasi Sistem Kekebalan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Vaksin merangsang produksi antibodi, yang merupakan protein yang dihasilkan oleh sistem kekebalan untuk melawan mikroorganisme penyebab penyakit. Selain antibodi, imunisasi juga dapat merangsang produksi sel-sel kekebalan, seperti limfosit T, yang berperan penting dalam melawan infeksi.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '3. Memori Imunologis',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Salah satu manfaat utama imunisasi adalah menciptakan "memori imunologis". Setelah vaksinasi, tubuh akan memiliki kemampuan untuk mengenali dan melawan mikroorganisme penyebab penyakit jika terpapar di masa depan.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Manfaat Imunisasi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '1. Mencegah Penyakin Menular',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '2. Melindungi Individu dan Komunitas',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '3. Mengurangi Angka Kesakitan dan Kematian',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
