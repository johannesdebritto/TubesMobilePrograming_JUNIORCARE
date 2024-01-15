import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VitaminPage extends StatefulWidget {
  @override
  State<VitaminPage> createState() => _VitaminPageState();
}

class _VitaminPageState extends State<VitaminPage> {
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
                              'assets/image/fitkom.png', // Ganti dengan path file gambar Anda
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Fitkom',
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
                                _addToCart('Fitkom', 10000.0,
                                    'assets/image/fitkom.png');
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
                              'assets/image/sakatonik.png', // Ganti dengan path file gambar Anda
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Sakatonik',
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
                                _addToCart('Sakatonik', 12000.0,
                                    'assets/image/sakatonik.png');
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
                              'assets/image/vidoran1.png', // Ganti dengan path file gambar Anda
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Vidoran',
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
                                _addToCart('Vidoran', 13000.0,
                                    'assets/image/vidoran1.png');
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
                              'assets/image/vege.png', // Ganti dengan path file gambar Anda
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Vegetables 21 Jr',
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
                                  'Harga : Rp.15.000',
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
                                _addToCart('Vegetables 21 Jr', 12000.0,
                                    'assets/image/vege.png');
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
