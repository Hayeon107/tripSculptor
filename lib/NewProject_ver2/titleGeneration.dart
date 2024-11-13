import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tripdraw/NewProject_ver2/iotroGeneration.dart';
class TitleGeneration extends StatefulWidget {
  @override
  _TitleGenerationState createState() =>
      _TitleGenerationState();
}

class _TitleGenerationState extends State<TitleGeneration> {
  String? selectedTitle;
  List<String> titles = [
    "제주 가족 여행: 우도, 민장굴, 테지움 탐험기",
    "제주에서 만난 자연과 모험: 가족과 함께하는 추억 여행",
    "우도에서 테지움까지: 가족과 떠난 제주 힐링 여행",
    "민장굴의 신비와 테지움의 즐거움: 우리 가족의 제주 이야기",
    "제주도에서 만난 자연과 예술: 가족과 함께한 특별한 하루"
  ];

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    final selectedCompanion = arguments['selectedCompanion'];
    final selectedPurpose = arguments['selectedPurpose'];
    final selectedTouristLocations = arguments['selectedTouristLocations'];
    final startDate = arguments['startDate'];
    final endDate = arguments['endDate'];

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
            SizedBox(height: 20),
            Text(
              '제목',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: titles.map((title) {
                  return RadioListTile<String>(
                    title: Text(title),
                    value: title,
                    groupValue: selectedTitle,
                    onChanged: (value) {
                      setState(() {
                        selectedTitle = value;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                // Action for reloading or regenerating titles
              },
            ),
            Text('동행인: $selectedCompanion'),
            Text('여행 목적: $selectedPurpose'),
            Text('여행지: ${selectedTouristLocations.join(', ')}'),
            Text('출발일: ${DateFormat('yyyy-MM-dd').format(startDate)}'),
            Text('도착일: ${DateFormat('yyyy-MM-dd').format(endDate)}'),
            SizedBox(height: 20.h),

            ElevatedButton(
              onPressed: (startDate != null && endDate != null)
                  ? () {
                // Use Get.to() and pass parameters
                Get.to(() => IotroGenration());
              }
                  : null, // Disable button if dates are not selected
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('인트로/아웃트로 생성'),
            ),
          ],
        ),
      ),
    );
  }
}