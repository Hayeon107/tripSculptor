import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tripdraw/NewProject_ver2/inputInfo.dart';
import 'package:tripdraw/View/Storyboard_dynamic/companionView.dart';
import 'package:tripdraw/style.dart' as style;


class NewProjectWidget extends StatelessWidget {
  NewProjectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => CompanionView());
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), // 둥근 모서리 반경 설정
          gradient: const LinearGradient(
            colors: [style.mainGradientColor, style.mainColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight, // 그라데이션 끝 위치
          ),
        ),
        width: ScreenUtil().screenWidth,
        height: 100.h,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_box_rounded,
                size: 30.w,
                color: Colors.white,
              ),
              Text(
                "새 프로젝트",
                style: TextStyle(fontSize: 15.sp, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
