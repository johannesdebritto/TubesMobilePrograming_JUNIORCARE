import 'package:flutter/material.dart';
import 'package:flutter_application_kesehatan/imunisasi_screen.dart';
import 'package:flutter_application_kesehatan/navbar.dart';

import 'package:flutter_application_kesehatan/bbi.dart';
import 'package:flutter_application_kesehatan/obat_screen.dart';
import 'package:flutter_application_kesehatan/pilihan_perawatan.dart';
import 'package:flutter_application_kesehatan/user_model.dart';
import 'package:flutter_application_kesehatan/vitamin.dart';
import 'package:flutter_application_kesehatan/shared_preferences_service.dart';
import 'package:flutter_application_kesehatan/vaksin_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

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
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(" Welcome  ${_user?.username ?? ''}"),
        backgroundColor: Color(0xFF674AEF),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              shrinkWrap: true, // Tambahkan shrinkWrap: true
              physics: NeverScrollableScrollPhysics(),
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ObatPage(),
                        ));
                  },
                  child: Card(
                    color: Color(0xFF674AEF),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.medication,
                          size: 40,
                          color: Colors.white,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Obat',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VitaminPage(),
                        ));
                  },
                  child: Card(
                    color: Color(0xFF674AEF),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_pharmacy,
                          size: 40,
                          color: Colors.white,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Vitamin',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PilihPerawatanPage(),
                        ));
                  },
                  child: Card(
                    color: Color(0xFF674AEF),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.spa,
                          size: 40,
                          color: Colors.white,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Perawatan Anak',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KesehatanPage(),
                        ));
                  },
                  child: Card(
                    color: Color(0xFF674AEF),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_hospital_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Cek Kesehatan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Align(
              alignment:
                  Alignment.centerLeft, // Sesuaikan alignment sesuai kebutuhan
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0), // Sesuaikan padding kiri sesuai kebutuhan
                child: Text(
                  'Informasi Kesehatan Lainnya',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VaksinPage(),
                          ));
                    },
                    child: Container(
                      width: 300, // Sesuaikan lebar kotak sesuai kebutuhan
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/image/vaksin.png",
                            height:
                                200, // Sesuaikan tinggi gambar sesuai kebutuhan
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Manfaat Vaksinasi",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => imunisasiPage(),
                          ));
                    },
                    child: Container(
                      width: 300, // Sesuaikan lebar kotak sesuai kebutuhan
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/image/imunisasi.png", // Ganti dengan path gambar kedua
                            height:
                                200, // Sesuaikan tinggi gambar sesuai kebutuhan
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Manfaat Imunisasi",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 25,
            offset: const Offset(8, 20),
          )
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            selectedItemColor: Color(0xFF674AEF),
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                switch (index) {
                  case 0:
                    break;
                  case 1:
                    Navigator.pushNamed(context, '/keranjang');
                    break;
                  case 2:
                    Navigator.pushNamed(context, '/pembelian');
                    break;
                  case 3:
                    Navigator.pushNamed(context, '/profile');
                    break;
                }
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                label: "Keranjang",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_basket,
                ),
                label: "Pembelian",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_2_rounded,
                ),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
