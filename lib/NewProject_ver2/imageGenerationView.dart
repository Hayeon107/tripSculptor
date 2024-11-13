import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tripdraw/NewProject_ver2/imageDetailView.dart';
import 'package:tripdraw/Widget/buildListWidget.dart';
import '../View/mainView.dart';
import '../Widget/buildGridWidget.dart';

class ImageGenerationView extends StatefulWidget {
  final List<String> titles;
  final List<String> details;

  ImageGenerationView({required this.titles, required this.details});

  @override
  _ImageGenerationViewState createState() => _ImageGenerationViewState();
}

class _ImageGenerationViewState extends State<ImageGenerationView> {
  bool isListView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 50.h, 20.w, 16.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // SizedBox(height: 20.w,),
                Text(
                  '정보를 기반으로\n이미지를 추가합니다',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(isListView ? Icons.grid_view : Icons.list),
                  onPressed: () {
                    setState(() {
                      isListView = !isListView; // 보기 전환
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: isListView
                  ? BuildListWidget(
                      length: widget.titles.length,
                      titles: widget.titles,
                      details: widget.details)
                  : BuildGridWidget(
                      length: widget.titles.length, titles: widget.titles),
            ),
            ElevatedButton(
              onPressed: () {
                // 재생성 버튼 기능 구현
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text('재생성'),
            ),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
              onPressed: () {
                // 저장하기 버튼 기능 구현
                Get.to(() => MainView());
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text('저장하기'),
            ),
          ],
        ),
      ),
    );
  }
}
