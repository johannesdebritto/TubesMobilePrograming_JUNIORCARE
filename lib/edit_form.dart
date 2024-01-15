import 'package:flutter/material.dart';
import 'package:flutter_application_kesehatan/kesehatan_service.dart';
import 'package:flutter_application_kesehatan/halaman_catatan.dart';

class EditForm extends StatefulWidget {
  final Map<dynamic, dynamic> data;

  EditForm({required this.data});

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController hari = TextEditingController();
  TextEditingController tinggibadan = TextEditingController();
  TextEditingController beratbadan = TextEditingController();
  TextEditingController suhutubuh = TextEditingController();
  TextEditingController polamakan = TextEditingController();
  TextEditingController polatidur = TextEditingController();

  KesehatanService kesehatanService = KesehatanService();

  @override
  void initState() {
    super.initState();
    initializeControllers();
  }

  void initializeControllers() {
    hari.text = widget.data['hari']!;
    tinggibadan.text = widget.data['tinggibadan']!;
    beratbadan.text = widget.data['beratbadan']!;
    suhutubuh.text = widget.data['suhutubuh']!;
    polamakan.text = widget.data['polamakan']!;
    polatidur.text = widget.data['polatidur']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Obat'),
        backgroundColor: Color(0xFF674AEF),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
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
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    kesehatanService.updateData(
                      hari.text,
                      tinggibadan.text,
                      beratbadan.text,
                      suhutubuh.text,
                      polamakan.text,
                      polatidur.text,
                      widget.data['id'],
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Data Updated Successfully'),
                      ),
                    );

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF674AEF), // Warna latar belakang tombol
                ),
                child: Text('Update Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// edit