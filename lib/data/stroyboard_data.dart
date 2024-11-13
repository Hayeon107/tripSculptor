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

List<String> titles = [
  '인트로: 새벽의 바다',
  '강릉역 도착',
  '바다와의 첫 만남',
  '카페에서의 휴식',
  '산책과 자연속에서의 자유',
];

List<String> details = [
  '잔잔한 새벽 바다의 클로즈업으로 시작. 파도가 잔잔히 밀려오는 장면과 함께 서서히 떠오르는 태양이 구도 중심에 위치',
  '기차에서 내려 강릉역을 걸어나오는 장면. 여행 가방을 끌고 나오는 주인공의 뒷모습이 주를 이루며, 역의 간판이 멀리서 살짝 보이는 장면.',
  '해변에 서서 바다를 바라보는 주인공. 주인공의 실루엣이 화면의 중앙에 배치되며 넓게 펄쳐진 바다가 시원하게 보임',
  '창밖을 바라보며 커피를 마시는 주인공의 옆모습. 창문 너머로 보이는 강릉의 거리가 배경으로 흐릿하게 표현됨',
  '소나무 숲 사이의 좁은 오솔길을 혼자 걷는 주인공. 나무 사이로 햇빛이 비치는 장면을 포착.',
];
