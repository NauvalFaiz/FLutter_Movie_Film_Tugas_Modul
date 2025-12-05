// lib/core/models/borrow_record.dart
import 'package:flutter/material.dart';

class BorrowRecord {
  final String id;
  final String bookId;
  final String bookTitle;
  final String borrowerName;
  final String borrowerEmail;
  final DateTime borrowDate;
  final DateTime dueDate;
  final bool isReturned;
  final DateTime? returnDate;
  final bool isOverdue;
  final int overdueDays;
  
  BorrowRecord({
    required this.id,
    required this.bookId,
    required this.bookTitle,
    required this.borrowerName,
    required this.borrowerEmail,
    required this.borrowDate,
    required this.dueDate,
    required this.isReturned,
    this.returnDate,
    required this.isOverdue,
    required this.overdueDays,
  });

  // Helper method untuk cek apakah record adalah milik user tertentu
  bool isUserRecord(String userEmail) {
    return borrowerEmail == userEmail;
  }

  // Helper untuk mendapatkan status teks
  String get statusText {
    if (!isReturned) {
      return isOverdue ? "Terlambat" : "Dipinjam";
    } else {
      return isOverdue ? "Dikembalikan (Terlambat)" : "Dikembalikan";
    }
  }

  // Helper untuk warna status
  Color get statusColor {
    if (!isReturned) {
      return isOverdue ? Colors.red : Colors.orange;
    } else {
      return isOverdue ? Colors.red : Colors.green;
    }
  }

  BorrowRecord copyWith({
    String? id,
    String? bookId,
    String? bookTitle,
    String? borrowerName,
    String? borrowerEmail,
    DateTime? borrowDate,
    DateTime? dueDate,
    bool? isReturned,
    DateTime? returnDate,
    bool? isOverdue,
    int? overdueDays,
  }) {
    return BorrowRecord(
      id: id ?? this.id,
      bookId: bookId ?? this.bookId,
      bookTitle: bookTitle ?? this.bookTitle,
      borrowerName: borrowerName ?? this.borrowerName,
      borrowerEmail: borrowerEmail ?? this.borrowerEmail,
      borrowDate: borrowDate ?? this.borrowDate,
      dueDate: dueDate ?? this.dueDate,
      isReturned: isReturned ?? this.isReturned,
      returnDate: returnDate ?? this.returnDate,
      isOverdue: isOverdue ?? this.isOverdue,
      overdueDays: overdueDays ?? this.overdueDays,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bookId': bookId,
      'bookTitle': bookTitle,
      'borrowerName': borrowerName,
      'borrowerEmail': borrowerEmail,
      'borrowDate': borrowDate.toIso8601String(),
      'dueDate': dueDate.toIso8601String(),
      'isReturned': isReturned,
      'returnDate': returnDate?.toIso8601String(),
      'isOverdue': isOverdue,
      'overdueDays': overdueDays,
    };
  }

  factory BorrowRecord.fromMap(Map<String, dynamic> map) {
    return BorrowRecord(
      id: map['id'],
      bookId: map['bookId'],
      bookTitle: map['bookTitle'],
      borrowerName: map['borrowerName'],
      borrowerEmail: map['borrowerEmail'],
      borrowDate: DateTime.parse(map['borrowDate']),
      dueDate: DateTime.parse(map['dueDate']),
      isReturned: map['isReturned'],
      returnDate: map['returnDate'] != null ? DateTime.parse(map['returnDate']) : null,
      isOverdue: map['isOverdue'],
      overdueDays: map['overdueDays'],
    );
  }
}