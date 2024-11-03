import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tripdraw/View/NewProject/chooseLocationView3.dart';
import 'package:tripdraw/View/NewProject/choosePurpose.dart';
import 'package:tripdraw/Widget/goBackWidget.dart';
import 'package:tripdraw/style.dart' as style;

import '../../Widget/goNextWidget.dart';


class ChooseCompanionView extends StatefulWidget {
  @override
  _ChooseCompanionViewState createState() => _ChooseCompanionViewState();
}

class _ChooseCompanionViewState extends State<ChooseCompanionView> {
  // 선택 여부를 저장할 리스트
  Map<String, bool> options = {
    '가족': false,
    '반려동물': false,
    '친구': false,
    '애인': false,
    '혼자': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                '함께 여행을 가는 상대는 누구인가요?',
                style: style.textTheme.titleSmall,
              ),
            ),
            Expanded(
              child: ListView(
                children: options.keys.map((String key) {
                  return Transform.scale(
                    scale: 1.0, // 체크박스 크기 조정
                    child: CheckboxListTile(
                      title: Text(
                        key,
                        style: style.textTheme.bodyMedium,
                      ),
                      value: options[key],
                      onChanged: (bool? value) {
                        setState(() {
                          options[key] = value ?? false; // null 방지
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      visualDensity: VisualDensity(
                        horizontal: -4.0,
                        vertical: -4.0,
                      ), // 간격을 좁힘
                    ),
                  );
                }).toList(),
              ),
            ),
            Spacer(),
            Column(
              children: [
                GoBackWidget(), // 이전 페이지로 돌아가기 버튼
                SizedBox(
                  width: 320.w,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: ElevatedButton(
                      onPressed: () {
                        print("Button clicked");
                        // 현재 페이지의 옵션을 전달하여 다음 페이지로 이동
                        Get.to(
                              () => ChooseLocationView3(),
                        );
                      },
                      child: Text(
                        '다음',
                        style: style.textTheme.headlineMedium,
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 12.h),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}