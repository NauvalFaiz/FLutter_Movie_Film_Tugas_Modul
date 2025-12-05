import 'package:flutter/material.dart';

class ProfileModel {
  String nama;
  String alamat;
  String email;
  String password;

  ProfileModel({
    required this.nama,
    required this.alamat,
    required this.email,
    required this.password,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      nama: map['nama'] ?? '',
      alamat: map['alamat'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'alamat': alamat,
      'email': email,
      'password': password,
    };
  }

  bool get isComplete {
    return nama.isNotEmpty &&
        alamat.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty;
  }

  void clear() {
    nama = '';
    alamat = '';
    email = '';
    password = '';
  }

  void copyFrom(ProfileModel other) {
    nama = other.nama;
    alamat = other.alamat;
    email = other.email;
    password = other.password;
  }

  @override
  String toString() {
    return 'ProfileModel(nama: $nama, alamat: $alamat, email: $email, password: ${password.isNotEmpty ? '***' : ''})';
  }
}

class ProfileField {
  final String key;
  final String label;
  final String hint;
  final IconData icon;
  final bool isPassword;

  ProfileField({
    required this.key,
    required this.label,
    required this.hint,
    required this.icon,
    this.isPassword = false,
  });
}
