import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../data/stroyboard_data.dart';
import 'package:tripdraw/NewProject_ver2/imageGenerationView.dart';
import 'package:tripdraw/NewProject_ver2/storyTextDetailView.dart';
import 'package:tripdraw/style.dart' as style;

class StoryTextGenerationView extends StatefulWidget {
  @override
  _StoryTextGenerationViewState createState() =>
      _StoryTextGenerationViewState();
}

class _StoryTextGenerationViewState extends State<StoryTextGenerationView> {
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 50.h, 20.w, 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '정보를 기반으로\n생성된 스토리보드',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '터치하면 수정가능합니다',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: titles.length,
                separatorBuilder: (context, index) => Divider(), // Divider 추가
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      '#${index + 1}. ${titles[index]}',
                      style: style.textTheme.bodyMedium,
                    ),
                    subtitle: Text(details[index]),
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        Get.to(
                          StoryTextDetailView(
                            index: selectedIndex,
                            title: titles[selectedIndex],
                            detail: details[selectedIndex],
                          ),
                        );
                      },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => ImageGenerationView(titles: titles, details: details,));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text('이미지 생성'),
            ),
          ],
        ),
      ),
    );
  }
}
