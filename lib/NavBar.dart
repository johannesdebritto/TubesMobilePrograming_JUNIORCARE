import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_kesehatan/bbi.dart';
import 'package:flutter_application_kesehatan/konsultasi.dart';

import 'package:flutter_application_kesehatan/obat_screen.dart';

import 'package:flutter_application_kesehatan/pilihan_perawatan.dart';
import 'package:flutter_application_kesehatan/shared_preferences_service.dart';
import 'package:flutter_application_kesehatan/user_model.dart';

import 'package:flutter_application_kesehatan/vitamin.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  UserModel? _user;
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    UserModel? user = await SharedPreferencesService.getUser();
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(" Name : ${_user?.username ?? ''}"),
            accountEmail: Text(
              'Email: ${_user?.email ?? ''}',
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: _user?.imagePath != null
                    ? Image.file(
                        File(_user!.imagePath!),
                        width: 80,
                        height: 80,
                      )
                    : Image.asset(
                        'assets/image/profile.png', // Ganti dengan path file gambar profil awal Anda
                        width: 80,
                        height: 80,
                      ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.medication),
            title: Text('Obat'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ObatPage(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.local_pharmacy),
            title: Text('Vitamin'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VitaminPage(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.spa),
            title: Text('Perawatan Anak'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PilihPerawatanPage(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.local_hospital_outlined),
            title: Text('Cek Kesehatan'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KesehatanPage(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.medical_services),
            title: Text('Konsultasi Dokter'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KonsultasiPage(),
                  ));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              // Navigasi kembali ke halaman login
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login', // Ganti '/login' dengan route yang benar untuk halaman login
                (route) => false, // Hapus semua halaman lainnya dari stack
              );
            },
          ),
        ],
      ),
    );
  }
}

class _user {}
