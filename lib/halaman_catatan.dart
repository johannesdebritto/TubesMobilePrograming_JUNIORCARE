import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_kesehatan/kesehatan_service.dart';
import 'package:flutter_application_kesehatan/edit_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  KesehatanService kesehatanService = KesehatanService();
  List data = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });

    List getData = await kesehatanService.getData();
    setState(() {
      data = getData;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catatan Kesehatan'),
        backgroundColor: Color(0xFF674AEF),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (_, item) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    title: Text(
                      'Catatan Kesehatan :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hari  : ${data[item]['hari']}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text('Tinggi Badan : ${data[item]['tinggibadan']} Cm'),
                        Text('Berat Badan : ${data[item]['beratbadan']} Kg'),
                        Text('Suhu Tubuh : ${data[item]['suhutubuh']} Celcius'),
                        Text('Pola Makan : ${data[item]['polamakan']}'),
                        Text('Pola Tidur : ${data[item]['polatidur']}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditForm(
                                  data: data[item],
                                ),
                              ),
                            );

                            // Setelah selesai mengedit, perbarui data dan kembali ke halaman HomeScreen
                            getData();
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.edit),
                        ),
                        SizedBox(width: 8),
                        IconButton(
                          onPressed: () {
                            kesehatanService.deleteData(item);
                            getData();
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
