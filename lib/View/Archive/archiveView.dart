import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripdraw/View/Archive/storyboardDetailView.dart';
import 'package:tripdraw/View/Archive/tempMyboardView.dart';
import 'package:tripdraw/Widget/storyboardArchiveTile.dart';
import 'package:tripdraw/style.dart' as style;
import 'package:get/get.dart';
import '../../../Widget/goBackWidget.dart';
import '../../Widget/newProjectWidget.dart';
import '../../data/stroyboard_data.dart';
import 'myStoryView.dart';

class ArchiveView extends StatelessWidget {
  const ArchiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 40.h),
            Text(
              "내 아카이브",
              style: style.textTheme.titleMedium,
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: storyboards.isEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "아직 스토리보드가 없습니다",
                          style: style.textTheme.titleMedium,
                        ),
                        NewProjectWidget(),
                      ],
                    )
                  : ListView.builder(
                      itemCount: storyboards.length,

                      itemBuilder: (context, index) {
                        final storyboard = storyboards[index];
                        return StoryBoardArchiveTile(
                          title: storyboard.title,
                          date: storyboard.createdAt,
                          destination: storyboard.destination,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
