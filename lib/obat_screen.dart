import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ObatPage extends StatefulWidget {
  @override
  State<ObatPage> createState() => _ObatPageState();
}

class _ObatPageState extends State<ObatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Obat'),
        backgroundColor: Color(0xFF674AEF),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  child: Card(
                    color: Color(0xFF674AEF),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/image/obh.png', // Ganti dengan path file gambar Anda
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'OBH Anak',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Harga : Rp.10.000',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            GestureDetector(
                              onTap: () {
                                _addToCart('OBH Anak', 10000.0,
                                    'assets/image/obh.png');
                                Navigator.pushNamed(context, '/keranjang');
                              },
                              child: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Card(
                    color: Color(0xFF674AEF),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/image/hufagrip.png', // Ganti dengan path file gambar Anda
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Hufagrip',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Harga : Rp.12.000',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            GestureDetector(
                              onTap: () {
                                _addToCart('Hufagrip', 12000.0,
                                    'assets/image/hufagrip.png');
                                Navigator.pushNamed(context, '/keranjang');
                              },
                              child: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Card(
                    color: Color(0xFF674AEF),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/image/bisolvon.png', // Ganti dengan path file gambar Anda
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Bisolvon Anak',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Harga : Rp.13.000',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            GestureDetector(
                              onTap: () {
                                _addToCart('Bisolvon Anak', 13000.0,
                                    'assets/image/bisolvon.png');
                                Navigator.pushNamed(context, '/keranjang');
                              },
                              child: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Card(
                    color: Color(0xFF674AEF),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/image/viks.png', // Ganti dengan path file gambar Anda
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Viks Formula 44 Anak',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Harga : Rp.8.000',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            GestureDetector(
                              onTap: () {
                                _addToCart('Viks Formula 44 Anak', 8000.0,
                                    'assets/image/viks.png');
                                Navigator.pushNamed(context, '/keranjang');
                              },
                              child: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Menambahkan item ke keranjang
  _addToCart(String obatName, double harga, String imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<Map<String, dynamic>> cartItems =
        (prefs.getStringList('cartItems') ?? []).map((item) {
      return Map<String, dynamic>.from(
          Map<String, dynamic>.from(json.decode(item)));
    }).toList();

    cartItems.add({
      'obatName': obatName,
      'harga': harga.toString(),
      'imagePath': imagePath,
      'quantity': '1', // Default quantity is set to 1
    });

    await prefs.setStringList(
      'cartItems',
      cartItems.map((item) => json.encode(item)).toList(),
    );
  }
}
