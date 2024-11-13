import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tripdraw/Widget/newProjectWidget.dart';
import 'package:tripdraw/style.dart' as style;
import '../../data/stroyboard_data.dart';
import '../Widget/storyboardArchiveTile.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  // 샘플 데이터 생성
  final List<String> items = List<String>.generate(2, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      child: Column(
        children: [
          Expanded(
            child: Lottie.asset(
              'assets/Animation - 1731031590663.json', // 원하는 가로 크기
              height: 500, // 원하는 세로 크기
              fit: BoxFit.fill,
            ),
          ),
          NewProjectWidget(),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "인기 영상",
                  style: style.theme.textTheme.titleLarge,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.w, // 아이템의 최대 너비
                      childAspectRatio: 16 / 9, // 너비 대비 높이 비율
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.grey,
                        child: Center(
                          child: Text(
                            'Item $index',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "내 아카이브",
                  style: style.theme.textTheme.titleMedium,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length, // 항목의 개수를 정의
                    itemBuilder: (context, index) {
                      final storyboard = storyboards[index];
                      return StoryBoardArchiveTile(
                        title: storyboard.title,
                        date: storyboard.createdAt,
                        destination: storyboard.destination,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
