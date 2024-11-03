import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tripdraw/style.dart' as style;

class GoNextWidget extends StatefulWidget {
  final Widget? nextPage; // 다음 페이지 위젯
  final List<String>? getOptions; // 선택된 옵션 목록
  final VoidCallback? onPressed; // 사용자 정의 동작을 위한 콜백

  GoNextWidget({
    this.nextPage,
    this.getOptions,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<GoNextWidget> createState() => _GoNextWidgetState();
}

class _GoNextWidgetState extends State<GoNextWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      child: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: ElevatedButton(
          onPressed: () {
            print("Button clicked");
            if (widget.onPressed != null) {
              widget.onPressed!();
            } else if (widget.nextPage != null) {
              print("Navigating to: ${widget.nextPage}");

              // 현재 페이지의 옵션을 전달하여 다음 페이지로 이동
              Get.to(() => widget.nextPage!, arguments: widget.getOptions);
            }
          },
          child: Text(
            '다음',
            style: style.textTheme.headlineMedium,
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
            ),
          ),
        ),
      ),
    );
  }
}
