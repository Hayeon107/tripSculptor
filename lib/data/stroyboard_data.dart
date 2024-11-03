// data.dart

class Storyboard {
  final int id;
  final int userId;
  final String title;
  final String destination;
  final String companions;
  final String purpose;
  final DateTime createdAt;
  final DateTime updatedAt;

  Storyboard(this.id, this.userId, this.title, this.destination, this.companions, this.purpose, this.createdAt, this.updatedAt);
}

// 더미 스토리보드 데이터
List<Storyboard> storyboards = [
  Storyboard(1, 1, '제주도 가족여행', '제주도', '가족', '힐링', DateTime(2024, 9, 1, 8, 0), DateTime(2024, 9, 15, 10, 0)),
  Storyboard(2, 2, '가평 MT', '가평군', '친구들', '추억', DateTime(2024, 9, 5, 12, 30), DateTime(2024, 9, 20, 14, 30)),
  // Storyboard(3, 3, 'Adventure in the Alps', 'Switzerland', 'Charlie, Eve', 'Adventure', DateTime(2024, 9, 10, 9, 0), DateTime(2024, 9, 25, 16, 0)),
];
