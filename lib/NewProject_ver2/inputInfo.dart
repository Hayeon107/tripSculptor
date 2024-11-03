import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:tripdraw/style.dart' as style;
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
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(16.w,40.h,16.w,16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('여행 세부 정보', style: style.textTheme.titleLarge,),
              Text(
                '여행 정보를 입력해주세요.\n소중한 개인정보는 보호됩니다. 아무튼 보호됨',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 20),
              Text("여행 목적"),
              DropdownButton<String>(
                value: selectedPurpose,
                isExpanded: true,
                items: [
                  DropdownMenuItem(child: Text('관광'), value: '관광'),
                  DropdownMenuItem(child: Text('업무'), value: '업무'),
                  DropdownMenuItem(child: Text('기타'), value: '기타'),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedPurpose = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: '여행지',
                  suffixIcon: Icon(Icons.arrow_forward_ios),
                ),
              ),
              SizedBox(height: 20),
              Text(
                '여행 기간',
                style: TextStyle(fontSize: 16),
              ),
              SfDateRangePicker(
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,
                initialSelectedRange: PickerDateRange(
                    DateTime.now().subtract(const Duration(days: 4)),
                    DateTime.now().add(const Duration(days: 3))),
              ),

              Row(
                children: [
                  Checkbox(
                    value: isSameDayTrip,
                    onChanged: (value) {
                      setState(() {
                        isSameDayTrip = value ?? false;
                        if (isSameDayTrip) {
                          endDate = null; // Clear end date if same-day trip is checked
                        }
                      });
                    },
                  ),
                  Text('당일여행'),
                ],
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
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
