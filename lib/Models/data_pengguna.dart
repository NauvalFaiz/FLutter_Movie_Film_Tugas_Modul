import 'package:prjsj1/Models/buku.dart';

class PenggunaModel {
  final String id;
  final String name;
  final String email;
  final String? profileImage;
  final List<PeminjamanModel> loanHistory;

  PenggunaModel({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
    required this.loanHistory,
  });

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'loanHistory': loanHistory.map((loan) => loan.toMap()).toList(),
    };
  }

  // Create from Map
  factory PenggunaModel.fromMap(Map<String, dynamic> map) {
    return PenggunaModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      profileImage: map['profileImage'],
      loanHistory: List<PeminjamanModel>.from(
        (map['loanHistory'] ?? []).map((x) => PeminjamanModel.fromMap(x)),
      ),
    );
  }

  PenggunaModel copyWith({
    String? id,
    String? name,
    String? email,
    String? profileImage,
    List<PeminjamanModel>? loanHistory,
  }) {
    return PenggunaModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      loanHistory: loanHistory ?? this.loanHistory,
    );
  }
}
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

  // Convert to Map
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

  // Create from Map
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

class DummyData {
  static List<BukuModel> getDummyBooks() {
    return [
      BukuModel(
        id: 1,
        title: "Kebijakan Pendidikan",
        overview: "Konsep, model, dan isu strategis di Indonesia",
        publisher: "Dr. Rahmat Fadhli, Ed.M.",
        status: "Available",
        voteAverage: 4.0,
        posterPath: "assets/img1.jpeg",
      ),
      BukuModel(
        id: 2,
        title: "Pararation",
        overview: "Ken Arok dalam pusaran konstelasi konflik Panjalu-Jenggala dan strategi rumit, massif dan jitu Ken Arok mencapai kekuasaan",
        publisher: "Otto Sukatno",
        status: "Available",
        voteAverage: 5.0,
        posterPath: "assets/img2.jpeg",
      ),
      BukuModel(
        id: 3,
        title: "Flutter Masterclass",
        overview: "Panduan lengkap pengembangan aplikasi mobile dengan Flutter",
        publisher: "Tech Publishing",
        status: "Borrowed",
        voteAverage: 4.5,
        posterPath: "assets/img3.jpeg",
      ),
      BukuModel(
        id: 4,
        title: "Data Structures & Algorithms",
        overview: "Konsep dasar struktur data dan algoritma untuk pemula",
        publisher: "Computer Science Press",
        status: "Available",
        voteAverage: 4.2,
        posterPath: "assets/img4.jpeg",
      ),
      BukuModel(
        id: 5,
        title: "Mobile App Design",
        overview: "Prinsip desain UI/UX untuk aplikasi mobile",
        publisher: "Design Studio",
        status: "Available",
        voteAverage: 4.7,
        posterPath: "assets/img5.jpeg",
      ),
    ];
  }

  static PenggunaModel getDummyUser() {
    return PenggunaModel(
      id: "1",
      name: "John Doe",
      email: "john@example.com",
      profileImage: "assets/profile.jpg",
      loanHistory: [
        PeminjamanModel(
          bookId: "3",
          bookTitle: "Flutter Masterclass",
          bookImage: "assets/img3.jpeg",
          loanDate: DateTime(2024, 5, 1),
          returnDate: DateTime(2024, 5, 15),
          status: "Dikembalikan",
        ),
        PeminjamanModel(
          bookId: "1",
          bookTitle: "Kebijakan Pendidikan",
          bookImage: "assets/img1.jpeg",
          loanDate: DateTime(2024, 5, 20),
          returnDate: DateTime(2024, 6, 3),
          status: "Dipinjam",
        ),
      ],
    );
  }
}
