import 'package:flutter/material.dart';
import 'package:tripdraw/style.dart' as style;
class CustomBottom extends StatefulWidget {
  final int selectIndex;
  final Function(int) onItemTapped;

  const CustomBottom({
    required this.selectIndex,
    required this.onItemTapped,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBottom> createState() => _CustomBottomState();
}

class _CustomBottomState extends State<CustomBottom> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.inbox),
          label: '아카이브',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: '새 프로젝트',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '환경설정',
        ),
      ],
      currentIndex: widget.selectIndex, // 선택된 탭의 인덱스
      selectedItemColor: style.mainColor, // 선택된 아이템 색상
      onTap: widget.onItemTapped, // 탭을 클릭했을 때 실행되는 메서드
    );
  }
}
