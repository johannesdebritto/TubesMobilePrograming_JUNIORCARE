import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeranjangPage extends StatefulWidget {
  @override
  _KeranjangPageState createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  int _currentIndex = 1;

  Future<List<Map<String, String>>> _getCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, String>> cartItems =
        (prefs.getStringList('cartItems') ?? []).map((item) {
      return Map<String, String>.from(
          Map<String, dynamic>.from(json.decode(item)));
    }).toList();

    return cartItems;
  }

  void _incrementQuantity(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, String>> cartItems =
        (prefs.getStringList('cartItems') ?? []).map((item) {
      return Map<String, String>.from(
          Map<String, dynamic>.from(json.decode(item)));
    }).toList();

    setState(() {
      // Increment 'quantity' dalam cartItems[index]
      cartItems[index]['quantity'] =
          (int.parse(cartItems[index]['quantity'] ?? '0') + 1).toString();
    });

    // Update data di SharedPreferences
    await prefs.setStringList(
      'cartItems',
      cartItems.map((item) => json.encode(item)).toList(),
    );
  }

  void _decrementQuantity(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, String>> cartItems =
        (prefs.getStringList('cartItems') ?? []).map((item) {
      return Map<String, String>.from(
          Map<String, dynamic>.from(json.decode(item)));
    }).toList();

    setState(() {
      // Decrement 'quantity' dalam cartItems[index]
      cartItems[index]['quantity'] =
          (int.parse(cartItems[index]['quantity'] ?? '0') - 1).toString();
    });

    // Update data di SharedPreferences
    await prefs.setStringList(
      'cartItems',
      cartItems.map((item) => json.encode(item)).toList(),
    );
  }

  void _hapusHalaman() async {
    // Tambahkan logika penghapusan halaman di sini
    // Misalnya, kosongkan data keranjang

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs
        .remove('cartItems'); // Menghapus data keranjang dari SharedPreferences

    // Buka ulang halaman keranjang setelah menghapus data
    setState(() {});
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<Map<String, String>>>(
        future: _getCartItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    color: Color(0xFFF5EEE6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ListTile(
                          title: Text(snapshot.data![index]['obatName'] ?? ''),
                          subtitle: Text(
                              'Harga : ${_formatHarga(snapshot.data![index]['harga'] ?? '0')}'),
                          leading: Image.asset(
                            snapshot.data![index]['imagePath'] ?? '',
                            width: 100,
                            height: 100,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Jumlah Pesanan :"),
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                _decrementQuantity(index);
                              },
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data![index]['quantity'] ?? '0',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                _incrementQuantity(index);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  'Keranjang kosong',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'fab1', // Tag unik untuk FloatingActionButton pertama
            onPressed: () async {
              // Dapatkan kembali data keranjang setelah dihapus
              List<Map<String, String>> cartItems = await _getCartItems();
              // Navigasi ke halaman pembelian dan kirim data keranjang
              Navigator.pushNamed(context, '/pembelian', arguments: cartItems);
            },
            child: Icon(Icons.shopping_basket),
            backgroundColor: Color(0xFF674AEF),
          ),
          SizedBox(width: 16.0), // Jarak antara dua Floating Button
          FloatingActionButton(
            heroTag: 'fab2', // Tag unik untuk FloatingActionButton kedua
            onPressed: () {
              // Panggil fungsi untuk menghapus halaman
              _hapusHalaman();
            },
            child: Icon(Icons.delete, color: Colors.white),
            backgroundColor: Colors.red, // Ganti warna sesuai kebutuhan
          ),
        ],
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
