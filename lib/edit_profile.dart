import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_kesehatan/shared_preferences_service.dart';
import 'package:flutter_application_kesehatan/user_model.dart';
import 'package:file_picker/file_picker.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  String? imagePath;

  @override
  void initState() {
    super.initState();
    // Mendapatkan data pengguna dari SharedPreferences
    SharedPreferencesService.getUser().then((user) {
      if (user != null) {
        setState(() {
          // Mengisi nilai awal pada controller
          emailController.text = user.email ?? '';
          phoneController.text = user.phoneNumber ?? '';
          alamatController.text = user.alamat ?? '';
          imagePath = user.imagePath;
        });
      }
    });
  }

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        imagePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Menampilkan gambar pengguna
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: imagePath != null
                    ? Image.file(
                        File(imagePath!),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                    : Center(
                        child: Icon(
                          Icons.add_a_photo,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
            SizedBox(height: 10),
            // Form untuk mengedit Email
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 10),
            // Form untuk mengedit Phone Number
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            SizedBox(height: 10),
            // Form untuk mengedit Alamat
            TextFormField(
              controller: alamatController,
              decoration: InputDecoration(
                labelText: 'Alamat',
              ),
            ),
            SizedBox(height: 20),
            // Tombol untuk menyimpan perubahan
            ElevatedButton(
              onPressed: () async {
                // Mendapatkan data pengguna dari SharedPreferences
                final UserModel? currentUser =
                    await SharedPreferencesService.getUser();

                if (currentUser != null) {
                  // Membuat objek UserModel baru dengan perubahan yang diinginkan
                  final UserModel updatedUser = UserModel(
                    username: currentUser.username,
                    password: currentUser.password,
                    email: emailController.text,
                    phoneNumber: phoneController.text,
                    alamat: alamatController.text,
                    imagePath: imagePath,
                  );

                  // Menyimpan data pengguna yang diperbarui ke SharedPreferences
                  await SharedPreferencesService.saveUser(updatedUser);

                  // Kembali ke halaman profil setelah menyimpan perubahan
                  Navigator.pop(context);
                }
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
