// lib/Settings/Models/user_models.dart
import 'package:flutter/material.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String studentId;
  final String major;
  final String avatarUrl;
  final int borrowedBooksCount;
  final int returnedBooksCount;
  final DateTime joinDate;
  final String bio;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.studentId,
    required this.major,
    required this.avatarUrl,
    required this.borrowedBooksCount,
    required this.returnedBooksCount,
    required this.joinDate,
    required this.bio,
  });

  // Copy with method
  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? studentId,
    String? major,
    String? avatarUrl,
    int? borrowedBooksCount,
    int? returnedBooksCount,
    DateTime? joinDate,
    String? bio,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      studentId: studentId ?? this.studentId,
      major: major ?? this.major,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      borrowedBooksCount: borrowedBooksCount ?? this.borrowedBooksCount,
      returnedBooksCount: returnedBooksCount ?? this.returnedBooksCount,
      joinDate: joinDate ?? this.joinDate,
      bio: bio ?? this.bio,
    );
  }

  // Get member level berdasarkan aktivitas
  String get memberLevel {
    final totalActivity = borrowedBooksCount + returnedBooksCount;
    if (totalActivity >= 50) return "Platinum";
    if (totalActivity >= 25) return "Gold";
    if (totalActivity >= 10) return "Silver";
    return "Bronze";
  }

  // Get color berdasarkan level
  Color get memberLevelColor {
    switch (memberLevel) {
      case "Platinum": return Colors.blueGrey;
      case "Gold": return Colors.amber;
      case "Silver": return Colors.grey;
      case "Bronze": return Colors.brown;
      default: return Colors.grey;
    }
  }

  @override
  String toString() {
    return 'UserModel{name: $name, borrowed: $borrowedBooksCount, returned: $returnedBooksCount}';
  }

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'studentId': studentId,
      'major': major,
      'avatarUrl': avatarUrl,
      'borrowedBooksCount': borrowedBooksCount,
      'returnedBooksCount': returnedBooksCount,
      'joinDate': joinDate.toIso8601String(),
      'bio': bio,
    };
  }

  // Create from Map - PERBAIKAN INI
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      studentId: map['studentId'] ?? '',
      major: map['major'] ?? '',
      avatarUrl: map['avatarUrl'] ?? '',
      borrowedBooksCount: map['borrowedBooksCount'] ?? 0,
      returnedBooksCount: map['returnedBooksCount'] ?? 0,
      joinDate: map['joinDate'] != null
          ? DateTime.parse(map['joinDate'])
          : DateTime.now(),
      bio: map['bio'] ?? '',
    );
  }
}