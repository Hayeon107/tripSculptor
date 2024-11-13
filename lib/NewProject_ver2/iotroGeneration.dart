import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tripdraw/NewProject_ver2/generateStoryboard.dart';
import 'package:tripdraw/NewProject_ver2/storyTextGenerationView.dart';
import 'package:tripdraw/style.dart' as style;

class IotroGenration extends StatefulWidget {
  @override
  _IotroGenrationState createState() => _IotroGenrationState();
}

class _IotroGenrationState extends State<IotroGenration> {
  String? selectedIntro;
  List<String> Intros = [
    "제주 가족 여행: 우도, 민장굴, 테지움 탐험기",
    "제주에서 만난 자연과 모험: 가족과 함께하는 추억 여행",
    "우도에서 테지움까지: 가족과 떠난 제주 힐링 여행",
    "민장굴의 신비와 테지움의 즐거움: 우리 가족의 제주 이야기",
    "제주도에서 만난 자연과 예술: 가족과 함께한 특별한 하루"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 50.h, 20.w, 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '스토리보드 생성',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '원하는 정보를 선택해주세요',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '인트로',
                    style: style.textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: 200.h, // Adjust the height as needed
                    child: ListView(
                      padding: EdgeInsets.zero, // Remove the top padding
                      children: Intros.map((title) {
                        return RadioListTile<String>(
                          title: Text(title, style: style.textTheme.bodySmall,),
                          value: title,
                          groupValue: selectedIntro,
                          onChanged: (value) {
                            setState(() {
                              selectedIntro = value;
                            });
                          },
                          dense: true, // Makes the RadioListTile more compact
                          contentPadding: EdgeInsets.zero, // Removes default padding

                        );
                      }).toList(),
                    ),
                  ),

                  Text(
                    '아웃트로',
                    style: style.textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: 200.h, // Adjust the height as needed
                    child: ListView(
                      padding: EdgeInsets.zero, // Remove the top padding
                      children: Intros.map((title) {
                        return RadioListTile<String>(
                          title: Text(title,style: style.textTheme.bodySmall,),
                          value: title,
                          groupValue: selectedIntro,
                          onChanged: (value) {
                            setState(() {
                              selectedIntro = value;
                            });
                          },
                          dense: true, // Makes the RadioListTile more compact
                          contentPadding: EdgeInsets.zero, // Removes default padding
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                // Action for reloading or regenerating titles
              },
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () {
                Get.to(() => StoryTextGenerationView());
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text('스토리보드 생성'),
            ),
          ],
        ),
      ),
    );
  }
}
