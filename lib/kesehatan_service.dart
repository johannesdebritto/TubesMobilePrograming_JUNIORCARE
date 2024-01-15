import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class KesehatanService {
  //method untuk mengambil data dari local storage
  getData() async {
    //inisiasi class untuk menggunakan paket penyimpanan local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //mengambil list/array kesehatan di local storage
    List<String> itemStrings = prefs.getStringList('kesehatan') ?? [];

    //mapping data
    return itemStrings
        .map((item) => json.decode(item) as Map<String, dynamic>)
        .toList();
  }

// tinggibadan.text,
//                       beratbadan.text,
//                       suhutubuh.text,
//                       polamakan.text,
//                       polatidur.text,
  //method untuk menyimpan data ke local storage
  saveData(
    String hari,
    String tinggibadan,
    String beratbadan,
    String suhutubuh,
    String polamakan,
    String polatidur,
  ) async {
    //inisiasi class untuk menggunakan paket penyimpanan local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //mengambil data dari localstorage dari list kesehatan
    List<String> dataList = prefs.getStringList('kesehatan') ?? [];

    //membuat variabel objek dengan data yang diisi melalui form
    Map<String, dynamic> newData = {
      'id': DateTime.now().millisecondsSinceEpoch.toInt(),
      'hari': hari,
      'tinggibadan': tinggibadan,
      'beratbadan': beratbadan,
      'suhutubuh': suhutubuh,
      'polamakan': polamakan,
      'polatidur': polatidur,
    };

    dataList.add(jsonEncode(newData)); // Menambahkan data baru ke dalam daftar
    prefs.setStringList(
      'kesehatan',
      dataList,
    ); // Menyimpan daftar data ke local storage
  }

  //method untuk mengupdate data ke local storage
  updateData(
    String hari,
    String tinggibadan,
    String beratbadan,
    String suhutubuh,
    String polamakan,
    String polatidur,
    int id,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> dataList = prefs.getStringList('kesehatan') ?? [];

    Map<String, dynamic> newData = {
      'id': id,
      'hari': hari,
      'tinggibadan': tinggibadan,
      'beratbadan': beratbadan,
      'suhutubuh': suhutubuh,
      'polamakan': polamakan,
      'polatidur': polatidur,
    };

    int dataIndex = -1;
    for (int i = 0; i < dataList.length; i++) {
      Map<String, dynamic> data = jsonDecode(dataList[i]);
      if (data['id'] == id) {
        dataIndex = i;
        break;
      }
    }

    if (dataIndex != -1) {
      dataList[dataIndex] = jsonEncode(newData);
    }

    prefs.setStringList(
      'kesehatan',
      dataList,
    );
  }

  deleteData(int index) async {
    //adalah metode yang digunakan untuk mendapatkan instance (instansiasi) objek SharedPreferences dalam Flutter.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //digunakan untuk mendapatkan nilai dari SharedPreferences dengan kunci 'data'
    List<String> dataList = prefs.getStringList('kesehatan') ?? [];

    //menghilangkan data dari dataList berdasarkan index
    dataList.removeAt(index);

    //set ulang local storage dengan data yang diperbarui
    prefs.setStringList('kesehatan', dataList);
  }
}

//contact