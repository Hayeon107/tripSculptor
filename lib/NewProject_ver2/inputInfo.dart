import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tripdraw/NewProject_ver2/titleGeneration.dart';
import 'package:tripdraw/style.dart' as style;
import 'TravelLocationView.dart';

class InputInfoView extends StatefulWidget {
  @override
  State<InputInfoView> createState() => _InputInfoViewState();
}

class _InputInfoViewState extends State<InputInfoView> {
  String? selectedCompanion;
  String? selectedPurpose;
  DateTime? startDate;
  DateTime? endDate;
  bool isSameDayTrip = false;
  List<String> selectedTouristLocations = [];

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    DateTime initialDate = isStartDate
        ? (startDate ?? DateTime.now())
        : (endDate ?? DateTime.now());
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          startDate = pickedDate;
          if (isSameDayTrip) {
            endDate = null;
          }
        } else {
          endDate = pickedDate;
        }
      });
    }
  }

  Future<void> _selectTouristLocations() async {
    final result = await Get.to(() => TravelLocationView(
      selectedLocations: selectedTouristLocations,
    ));

    if (result != null && result is List<String>) {
      setState(() {
        selectedTouristLocations = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 50.h, 20.w, 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '여행 세부 정보',
              style: style.textTheme.titleSmall,
            ),
            Text(
              '여행 정보를 입력해주세요.\n소중한 개인정보는 보호됩니다. 아무튼 보호됨',
              style: style.textTheme.displaySmall,
            ),
            SizedBox(height: 20.h),
            Text("동행인"),
            DropdownButton<String>(
              value: selectedCompanion,
              isExpanded: true,
              items: [
                DropdownMenuItem(child: Text('친구'), value: '친구'),
                DropdownMenuItem(child: Text('가족'), value: '가족'),
                DropdownMenuItem(child: Text('혼자'), value: '혼자'),
              ],
              onChanged: (value) {
                setState(() {
                  selectedCompanion = value;
                });
              },
            ),
            SizedBox(height: 20.h),
            Text("여행 목적"),
            DropdownButton<String>(
              value: selectedPurpose,
              isExpanded: true,
              items: [
                DropdownMenuItem(child: Text('관광'), value: '관광'),
                DropdownMenuItem(child: Text('힐링'), value: '힐링'),
                DropdownMenuItem(child: Text('액티비티'), value: '액티비티'),
              ],
              onChanged: (value) {
                setState(() {
                  selectedPurpose = value;
                });
              },
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () => _selectTouristLocations(),
              child: TextField(
                decoration: InputDecoration(
                  labelText: selectedTouristLocations.isNotEmpty
                      ? selectedTouristLocations.join(', ')
                      : '여행지',
                  suffixIcon: Icon(Icons.arrow_forward_ios),
                ),
                enabled: false,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              '여행 기간',
              style: TextStyle(fontSize: 16),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, true),
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: startDate != null
                              ? '출발일: ${DateFormat('yyyy-MM-dd').format(startDate!)}'
                              : '출발일',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.h),
                if (!isSameDayTrip)
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context, false),
                      child: AbsorbPointer(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: endDate != null
                                ? '도착일: ${DateFormat('yyyy-MM-dd').format(endDate!)}'
                                : '도착일',
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Checkbox(
                  value: isSameDayTrip,
                  onChanged: (value) {
                    setState(() {
                      isSameDayTrip = value ?? false;
                      if (isSameDayTrip) {
                        endDate = null;
                      }
                    });
                  },
                ),
                Text('당일여행'),
              ],
            ),
            SizedBox(height: 170.h),
            ElevatedButton(
              onPressed: (startDate != null && endDate != null)
                  ? () {
                // Use Get.to() and pass parameters
                Get.to(() => TitleGeneration(), arguments: {
                  'selectedCompanion': selectedCompanion,
                  'selectedPurpose': selectedPurpose,
                  'selectedTouristLocations': selectedTouristLocations,
                  'startDate': startDate,
                  'endDate': endDate,
                });
              }
                  : null, // Disable button if dates are not selected
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('제목 만들기'),
            ),
          ],
        ),
      ),
    );
  }
}
