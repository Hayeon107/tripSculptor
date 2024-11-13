import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import './style.dart' as myStyle;
import 'NewProject_ver2/inputInfo.dart';
import 'NewProject_ver2/storyTextGenerationView.dart';
import 'View/Storyboard_dynamic/companionView.dart';
import 'View/mainView.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (BuildContext context, child) => GetMaterialApp(
        title: 'TripSketch',
        debugShowCheckedModeBanner: false,
        theme: myStyle.theme,
        home: MainView(),
      ),
    );
  }
}