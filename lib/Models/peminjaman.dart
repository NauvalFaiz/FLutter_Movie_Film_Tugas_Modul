class PeminjamanModel {
  final String bookId;
  final String bookTitle;
  final String bookImage;
  final DateTime loanDate;
  final DateTime returnDate;
  final String status; // Dipinjam, Dikembalikan, Terlambat

  PeminjamanModel({
    required this.bookId,
    required this.bookTitle,
    required this.bookImage,
    required this.loanDate,
    required this.returnDate,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'bookId': bookId,
      'bookTitle': bookTitle,
      'bookImage': bookImage,
      'loanDate': loanDate.toIso8601String(),
      'returnDate': returnDate.toIso8601String(),
      'status': status,
    };
  }

  factory PeminjamanModel.fromMap(Map<String, dynamic> map) {
    return PeminjamanModel(
      bookId: map['bookId'] ?? '',
      bookTitle: map['bookTitle'] ?? '',
      bookImage: map['bookImage'] ?? 'assets/default_book.jpg',
      loanDate: DateTime.parse(map['loanDate'] ?? DateTime.now().toIso8601String()),
      returnDate: DateTime.parse(map['returnDate'] ?? DateTime.now().add(Duration(days: 14)).toIso8601String()),
      status: map['status'] ?? 'Dipinjam',
    );
  }

  PeminjamanModel copyWith({
    String? bookId,
    String? bookTitle,
    String? bookImage,
    DateTime? loanDate,
    DateTime? returnDate,
    String? status,
  }) {
    return PeminjamanModel(
      bookId: bookId ?? this.bookId,
      bookTitle: bookTitle ?? this.bookTitle,
      bookImage: bookImage ?? this.bookImage,
      loanDate: loanDate ?? this.loanDate,
      returnDate: returnDate ?? this.returnDate,
      status: status ?? this.status,
    );
  }
}