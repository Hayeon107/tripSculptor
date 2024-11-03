import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tripdraw/View/NewProject/chooseCompanionView.dart';
import 'package:tripdraw/View/NewProject/chooseLocationView3.dart';
import 'package:tripdraw/Widget/goBackWidget.dart';
import 'package:tripdraw/style.dart' as style;

import '../../Widget/goNextWidget.dart';

class ChoosePurposeView extends StatefulWidget {
  @override
  _ChoosePurposeViewState createState() => _ChoosePurposeViewState();
}

class _ChoosePurposeViewState extends State<ChoosePurposeView> {
  // 선택 여부를 저장할 리스트 (Map을 사용하여 목적과 선택 상태 관리)
  Map<String, bool> options = {
    '관광': false,
    '힐링': false,
    '추억여행': false,
    '기념일': false,
    '액티비티': false,
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
                '여행의 목적을 모두 골라주세요',
                style: style.textTheme.titleSmall,
              ),
            ),
            SizedBox(height: 16.h),
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
                GoNextWidget(
                  nextPage: ChooseCompanionView(), // 다음 페이지 설정
                  getOptions: options.entries
                      .where((entry) => entry.value) // 선택된 옵션만 필터링
                      .map((entry) => entry.key)
                      .toList(), // 선택된 옵션의 키(목적)만 리스트로 변환
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}