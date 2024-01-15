import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PembelianPage extends StatefulWidget {
  @override
  _PembelianPageState createState() => _PembelianPageState();
}

class _PembelianPageState extends State<PembelianPage> {
  int _currentIndex = 2;
  List<Map<String, String>> cartItems = [];

  @override
  void initState() {
    super.initState();
    _getCartItems();
  }

  Future<void> _getCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, String>> items =
        (prefs.getStringList('cartItems') ?? []).map((item) {
      return Map<String, String>.from(
          Map<String, dynamic>.from(json.decode(item)));
    }).toList();

    setState(() {
      cartItems = items;
    });
  }

// Tambahkan method berikut pada _PembelianPageState
  void _hapusPembelian() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs
        .remove('cartItems'); // Menghapus data pembelian dari SharedPreferences

    // Setelah menghapus, perbarui state agar widget merender ulang
    setState(() {
      cartItems = []; // Kosongkan list pembelian
    });
  }

  String _formatHarga(String hargaString) {
    try {
      double harga = double.parse(hargaString);
      return 'Rp.${harga.toStringAsFixed(0)}';
    } catch (e) {
      return 'Invalid Harga';
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalHarga = 0;

    for (var item in cartItems) {
      double harga = double.parse(item['harga'] ?? '0');
      int quantity = int.parse(item['quantity'] ?? '0');
      totalHarga += harga * quantity;
    }

    String formattedTotalHarga = _formatHarga(totalHarga.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('Pembelian'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: cartItems.isNotEmpty
                ? ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      double totalHarga =
                          double.parse(cartItems[index]['harga'] ?? '0') *
                              int.parse(cartItems[index]['quantity'] ?? '0');

                      return Card(
                        margin: EdgeInsets.all(10),
                        color: Color(0xFFF5EEE6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Dipesan pada: ${DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now())}',
                                style: TextStyle(
                                    fontSize: 16, fontStyle: FontStyle.italic),
                              ),
                            ),
                            ListTile(
                              title: Text(cartItems[index]['obatName'] ?? ''),
                              subtitle: Text(
                                  'Harga : ${_formatHarga(cartItems[index]['harga'] ?? '0')}'),
                              leading: Image.asset(
                                cartItems[index]['imagePath'] ?? '',
                                width: 100,
                                height: 100,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Jumlah Pesanan :   "),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      cartItems[index]['quantity'] ?? '0',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Total Harga : ${_formatHarga(totalHarga.toString())}',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            // Add a green label indicating the item has been purchased
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Sudah Dibeli',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      'Riwayat Pembelian Kosong',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Panggil fungsi untuk menghapus halaman
          _hapusPembelian();
        },
        child: Icon(Icons.delete_forever),
        backgroundColor: Color(0xFF674AEF),
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
                    Navigator.pushNamed(context, '/home');
                    break;
                  case 1:
                    Navigator.pushNamed(context, '/keranjang');
                    break;
                  case 2:
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
