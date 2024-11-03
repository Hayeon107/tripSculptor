import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tripdraw/style.dart' as style;

class StoryboardDetailView extends StatelessWidget {
  StoryboardDetailView({super.key});

  // Sample data for storyboard items
  final List<Map<String, String>> storyboardItems = [
    {
      'title': '인트로: 새벽의 바다',
      'time': '0:00-0:20',
      'description': '잔잔한 새벽 바다의 물결로 시작...'
    },
    {
      'title': '강릉역 도착',
      'time': '0:20-0:40',
      'description': '기차에서 내려 강릉역을 걸어나오는 장면...'
    },
    {
      'title': '바다와의 첫 만남',
      'time': '0:40-1:10',
      'description': '해변에 서서 바다를 바라보는 주인공...'
    },
    {
      'title': '카페에서의 휴식',
      'time': '1:10-1:40',
      'description': '창밖을 바라보며 커피를 마시는 주인공...'
    },
    {
      'title': '산책과 자연 속의 자유',
      'time': '1:40-2:10',
      'description': '신발을 벗고 바닷가를 거닐며 자연과 교감하는 주인공...'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.w, 40.h, 10.w, 10.h),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Text(
                      "정보를 기반으로 생성된 스토리보드 텍스트 입니다",
                      style: style.textTheme.titleMedium,
                      overflow: TextOverflow.visible,
                      maxLines: 2, // Optional: limits to a single line with ellipsis if overflowed

                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.list),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.square),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: storyboardItems.length,
                itemBuilder: (context, index) {
                  final item = storyboardItems[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${index + 1}. ${item['title']}",
                          style: style.textTheme.bodyLarge,
                        ),
                        Text(
                          item['time']!,
                          style: style.textTheme.bodyMedium,
                        ),
                        Text(
                          item['description']!,
                          style: style.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
