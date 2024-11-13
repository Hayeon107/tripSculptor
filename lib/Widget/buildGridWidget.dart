
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tripdraw/NewProject_ver2/imageDetailView.dart';

class BuildGridWidget extends StatelessWidget {
  final int length;
  final List<String> titles;
  BuildGridWidget({super.key, required this.length, required this.titles});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 1.3,
      ),
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 75.h,
              color: Colors.grey,
            ),
            SizedBox(height: 4.h),
            Text('#${index + 1}. ${titles[index]}'),
          ],
        );
      },
    );
  }
}
