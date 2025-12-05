// lib/Settings/Models/buku_model.dart
class BukuModel {
  final int id;
  final String title;
  final String publisher;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final String status;
  final String? borrowerName;
  final DateTime? loanDate;
  final DateTime? returnDate;

  BukuModel({
    required this.id,
    required this.title,
    required this.publisher,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.status,
    this.borrowerName,
    this.loanDate,
    this.returnDate,
  });

  // Copy with method untuk update
  BukuModel copyWith({
    int? id,
    String? title,
    String? publisher,
    String? overview,
    String? posterPath,
    double? voteAverage,
    String? status,
    String? borrowerName,
    DateTime? loanDate,
    DateTime? returnDate,
  }) {
    return BukuModel(
      id: id ?? this.id,
      title: title ?? this.title,
      publisher: publisher ?? this.publisher,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      voteAverage: voteAverage ?? this.voteAverage,
      status: status ?? this.status,
      borrowerName: borrowerName ?? this.borrowerName,
      loanDate: loanDate ?? this.loanDate,
      returnDate: returnDate ?? this.returnDate,
    );
  }

  // Helper untuk cek status
  bool get isBorrowed => status == "Borrowed";
  bool get isAvailable => status == "Available";
}
