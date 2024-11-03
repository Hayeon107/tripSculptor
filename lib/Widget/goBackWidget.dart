import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tripdraw/style.dart' as style;

class GoBackWidget extends StatelessWidget {
  const GoBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      child: ElevatedButton(
        onPressed: () {
          // 이전 화면으로 이동
          Navigator.pop(context);
        },
        child: Text('이전으로', style: style.textTheme.headlineMedium,),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
          ),
        ),
      ),
    );
  }
}
