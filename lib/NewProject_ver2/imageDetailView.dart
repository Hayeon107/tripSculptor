import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ImageDetailView extends StatelessWidget {
  final String title;
  final String detail;
  final int index;

  ImageDetailView(
      {required this.index, required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 50.h, 20.w, 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // 뒤로가기 버튼 기능 구현
                  },
                  child: Text(
                    '뒤로가기',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // 저장하기 버튼 기능 구현
                  },
                  child: Text(
                    '저장하기',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                height: 120.h,
                width: 200.w,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10.h,),
            Text(
              '#${index + 1}. $title',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              '영상',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              detail,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '화각',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '초광각 렌즈로 넓게 펼쳐진 바다를 담으며...',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '카메라 무빙',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '고정 카메라로 파도가 천천히 밀려오는 것을...',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '구도',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '바다와 하늘이 수평선에 맞춰 분할되며...',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
