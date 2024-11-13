import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tripdraw/NewProject_ver2/imageDetailView.dart';


class MyStoryView extends StatefulWidget {
  final List<String> titles;
  final List<String> details;

  MyStoryView({required this.titles, required this.details});

  @override
  _MyStoryViewState createState() =>
      _MyStoryViewState();
}

class _MyStoryViewState extends State<MyStoryView> {
  bool isListView = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 50.h, 20.w, 16.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // SizedBox(height: 20.w,),
                Text(
                  '정보를 기반으로\n이미지를 추가합니다',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(isListView ? Icons.grid_view : Icons.list),
                  onPressed: () {
                    setState(() {
                      isListView = !isListView; // 보기 전환
                    });
                  },
                ),

              ],
            ),
            Expanded(
              child: isListView ? buildListView() : buildGridView(),
            ),
            ElevatedButton(
              onPressed: () {
                // 재생성 버튼 기능 구현
              },
              style: ElevatedButton.styleFrom(primary: Colors.orange,minimumSize: const Size(double.infinity, 50),),
              child: Text('재생성'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListView() {
    return ListView.separated(
      itemCount: widget.titles.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            width: 100.w,
            height: 70.h,
            color: Colors.grey,
          ),
          title: Text('#${index + 1}. ${widget.titles[index]}'),
          subtitle: Text(widget.details[index]),
          onTap: () {
            Get.to(
              ImageDetailView(
                index: index,
                title: widget.titles[index],
                detail: widget.details[index],
              ),
            );
          },
        );
      },
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 1.3,
      ),
      itemCount: widget.titles.length,
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
            Text('#${index + 1}. ${widget.titles[index]}'),
          ],
        );
      },
    );
  }
}
