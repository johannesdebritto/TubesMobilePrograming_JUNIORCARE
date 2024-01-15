import 'package:flutter/material.dart';
import 'package:flutter_application_kesehatan/kesehatan_service.dart';
import 'package:flutter_application_kesehatan/halaman_catatan.dart';

class AddForm extends StatefulWidget {
  const AddForm({super.key});
  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  //inisialisasi variabel
  final _formKey = GlobalKey<FormState>();
  TextEditingController hari = TextEditingController();
  TextEditingController tinggibadan = TextEditingController();
  TextEditingController beratbadan = TextEditingController();
  TextEditingController suhutubuh = TextEditingController();
  TextEditingController polamakan = TextEditingController();
  TextEditingController polatidur = TextEditingController();

  //inisialisasi class
  KesehatanService kesehatanService = KesehatanService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Kesehtan Anak'),
        backgroundColor: Color(0xFF674AEF),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          // key adalah kunci unik untuk mengidentifikasi suatu form
          // di bawah key ini tambahkan widget sesuai selera kalian
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Masukan Hari : '),
                controller: hari,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukan Hari ';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Masukan Tinggi Badan (cm) : '),
                controller: tinggibadan,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukan Tinggi Badan ';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Masukan Berat Badan (kg) :'),
                controller: beratbadan,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukan Berat Badan';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: ' Masukan  Suhu Tubuh (celcius):'),
                controller: suhutubuh,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukan Suhu Tubuh';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Masukan Pola Makan:'),
                controller: polamakan,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukan Pola Makan:';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Masukan Pola Tidur :'),
                controller: polatidur,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukan Pola Tidur :';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  //jika validasi berhasil maka jalankan perintah di bawahnya
                  //jika tidak maka tampilkan pesan kesalahan di tiap formnya
                  if (_formKey.currentState!.validate()) {
                    kesehatanService.saveData(
                      hari.text,
                      tinggibadan.text,
                      beratbadan.text,
                      suhutubuh.text,
                      polamakan.text,
                      polatidur.text,
                    );
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF674AEF), // Warna latar belakang tombol
                ),
                child: Text('Tambah Data'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
