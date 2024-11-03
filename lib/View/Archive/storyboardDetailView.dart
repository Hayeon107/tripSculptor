import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/stroyboard_data.dart';

class StoryboardDetailView extends StatelessWidget {
  final Storyboard storyboard;

  const StoryboardDetailView({Key? key, required this.storyboard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(storyboard.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("목적지: ${storyboard.destination}", style: TextStyle(fontSize: 18.sp)),
            SizedBox(height: 10.h),
            Text("동행인: ${storyboard.companions}", style: TextStyle(fontSize: 18.sp)),
            SizedBox(height: 10.h),
            Text("목적: ${storyboard.purpose}", style: TextStyle(fontSize: 18.sp)),
            SizedBox(height: 10.h),
            Text("생성일: ${storyboard.createdAt}", style: TextStyle(fontSize: 18.sp)),
          ],
        ),
      ),
    );
  }
}