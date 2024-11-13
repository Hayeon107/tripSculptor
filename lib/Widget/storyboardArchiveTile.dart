import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../View/Archive/tempMyboardView.dart';
import '../../data/stroyboard_data.dart';
class StoryBoardArchiveTile extends StatelessWidget {
  String title;
  DateTime date;
  String destination;

  StoryBoardArchiveTile(
      {super.key,
      required this.title,
      required this.date,
      required this.destination});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          // MyStoryView(
          //   title: titles,
          //   detail: details,
          // ),
            TempMyboardView(titles: titles, details: details)
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            Container(
              width: 90.w,
              height: 50.h,
              color: Colors.grey,
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(title),
                Text(date.toString()),
                Text("여행 장소 : "+destination),
              ],
            )
          ],
        ),
      ),
    );
  }
}
