import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripdraw/style.dart' as style;
import 'package:get/get.dart';
import '../../Widget/goBackWidget.dart';
import '../mainView.dart';

class ChooseTitle extends StatelessWidget {
  const ChooseTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 20.h),
        child: Column(
          children: [
            Text("다음 중 어떤 제목의 영상을 만들고 싶나요?")
          ],
        )
      ),
    );
  }
}
