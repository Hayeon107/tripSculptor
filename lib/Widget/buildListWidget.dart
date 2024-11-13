
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tripdraw/NewProject_ver2/imageDetailView.dart';

class BuildListWidget extends StatelessWidget {
  final int length;
  final List<String> titles;
  final List<String> details;
  BuildListWidget({super.key, required this.length, required this.titles, required this.details});

  @override
  Widget build(BuildContext context) {
      return ListView.separated(
        itemCount: length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 100.w,
              height: 70.h,
              color: Colors.grey,
            ),
            title: Text('#${index + 1}. ${titles[index]}'),
            subtitle: Text(details[index]),
            onTap: () {
              Get.to(
                ImageDetailView(
                  index: index,
                  title: titles[index],
                  detail: details[index],
                ),
              );
            },
          );
        },
      );
  }
}
