import 'package:flutter/material.dart';

class VaksinPage extends StatefulWidget {
  @override
  State<VaksinPage> createState() => _VaksinPageState();
}

class _VaksinPageState extends State<VaksinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Vaksianasi'),
        backgroundColor: Color(0xFF674AEF),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Image.asset(
              "assets/image/vaksin.png", // Ganti dengan URL gambar imunisasi yang sesuai
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Text(
              'Pentingnya Vaksinasi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Vaksinasi adalah suatu proses pemberian vaksin atau imunogen ke dalam tubuh seseorang dengan tujuan untuk meningkatkan sistem kekebalan tubuhnya terhadap suatu penyakit tertentu.  Vaksin adalah suatu bahan yang mengandung fragmen lemah atau mati dari mikroorganisme penyebab penyakit atau bahan yang dapat merangsang produksi antibodi dan sel-sel kekebalan dalam tubuh. ',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'manfaat utama dari vaksinasi: ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '1. Perlindungan Individu:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Vaksin membantu melatih sistem kekebalan tubuh untuk mengenali dan melawan mikroorganisme penyebab penyakit.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '2. Mencegah Penyebaran Penyakit',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Vaksinasi membantu menghentikan penyebaran penyakit menular. Ketika sebagian besar populasi divaksinasi, kekebalan kelompok (herd immunity) dapat terbentuk, memberikan perlindungan kepada individu yang tidak dapat atau belum divaksinasi, seperti bayi atau individu dengan sistem kekebalan yang lemah.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '3. Mengurangi Kesakitan dan Kematian',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Vaksinasi telah terbukti mengurangi kesakitan dan kematian yang disebabkan oleh penyakit-penyakit serius seperti campak, polio, dan hepatitis B.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
