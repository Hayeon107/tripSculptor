import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tripdraw/View/Archive/archiveView.dart';
import 'package:tripdraw/View/boardView.dart';
import 'package:tripdraw/Widget/customBottom.dart';
import 'package:tripdraw/style.dart' as style;

import 'homeView.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    if (_selectedIndex < 1 || _selectedIndex >= _widgetOptions.length) {
      _selectedIndex = 1; // 기본값으로 초기화
    }
  }

  final List<Widget> _widgetOptions = <Widget>[
    ArchiveView(),
    HomeView(),
    BoardView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // 선택된 인덱스 업데이트
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomBottom(
        onItemTapped: _onItemTapped,
        selectIndex: _selectedIndex,
      ),
    );
  }
}
