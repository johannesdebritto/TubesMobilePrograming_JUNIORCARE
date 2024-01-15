import 'package:flutter/material.dart';
import 'package:flutter_application_kesehatan/edit_profile.dart';
// import 'package:flutter_application_kesehatan/halamanpembelian.dart';
import 'package:flutter_application_kesehatan/login.dart';
import 'package:flutter_application_kesehatan/home_page.dart';
import 'package:flutter_application_kesehatan/keranjang_screen.dart';
import 'package:flutter_application_kesehatan/pilihan_perawatan.dart';
import 'package:flutter_application_kesehatan/profil_screen.dart';
import 'package:flutter_application_kesehatan/register.dart';
import 'package:flutter_application_kesehatan/pembelian.dart';
import 'package:flutter_application_kesehatan/welcome_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
      routes: {
        '/PilihPerawatanPage': (context) => PilihPerawatanPage(),
        '/home': (context) => HomePage(),
        '/keranjang': (context) => KeranjangPage(),
        '/pembelian': (context) => PembelianPage(),
        '/profile': (context) => ProfilePage(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/editprofile': (context) =>
            EditProfilePage(), // Ganti dengan nama rute dan file yang sesuai
      },
    );
  }
}
