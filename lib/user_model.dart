class UserModel {
  String username;
  String password;
  String email;
  String phoneNumber;
  String alamat;
  String? imagePath;

  UserModel({
    required this.username,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.alamat,
    this.imagePath,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      password: json['password'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      alamat: json['alamat'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'phoneNumber': phoneNumber,
      'alamat': alamat,
      'imagePath': imagePath,
    };
  }
}
