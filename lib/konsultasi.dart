import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class KonsultasiPage extends StatefulWidget {
  @override
  State<KonsultasiPage> createState() => _KonsultasiPageState();
}

class _KonsultasiPageState extends State<KonsultasiPage> {
  // Ganti dengan informasi dokter yang sesuai
  String dokterImage = 'assets/image/Dokter.png';
  String dokterName = 'Dr. Ronaldo';
  String dokterDescription = 'Dokter Spesialis Anak';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konsultasi Dokter'),
        backgroundColor: Color(0xFF674AEF),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(dokterImage),
            ),
            SizedBox(height: 20),
            Text(
              dokterName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              dokterDescription,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Ganti nomor WhatsApp dengan nomor yang sesuai
                _openWhatsApp('+6285602813201');
              },
              icon: Icon(Icons.chat),
              label: Text('Chat via WhatsApp'),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuka WhatsApp dengan nomor tertentu
  void _openWhatsApp(String phoneNumber) async {
    String whatsappUrl = 'https://wa.me/+6285602813201';
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      // Tampilkan pesan kesalahan jika tidak dapat membuka WhatsApp
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Tidak dapat membuka WhatsApp.'),
        ),
      );
    }
  }
}
