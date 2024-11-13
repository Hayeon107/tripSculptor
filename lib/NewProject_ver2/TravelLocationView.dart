import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tripdraw/style.dart' as style;

class TravelLocationView extends StatefulWidget {
  final List<String> selectedLocations;

  TravelLocationView({required this.selectedLocations});

  @override
  _TravelLocationViewState createState() => _TravelLocationViewState();
}

class _TravelLocationViewState extends State<TravelLocationView> {
  String? selectedCity;
  String? selectedDistrict;
  List<String> attractions = [];
  List<String> selectedAttractions = [];

  @override
  void initState() {
    super.initState();
    selectedAttractions = List.from(widget.selectedLocations);
  }

  void _updateAttractions() {
    if (selectedDistrict == '서귀포') {
      attractions = [
        '정방폭포',
        '아쿠아 플래닛 제주',
        '주상절리',
        '천제연폭포',
        '쇠소깍',
        '서귀포 오일장',
        '용머리 해안'
      ];
    } else {
      attractions = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    _updateAttractions();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 50.h, 20.w, 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '여행 지역',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedCity,
              isExpanded: true,
              hint: Text('광역시/도'),
              items: [
                DropdownMenuItem(child: Text('제주도'), value: '제주도'),
                // Add more cities if needed
              ],
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                  selectedDistrict = null; // Reset district
                  attractions.clear(); // Clear attractions when city changes
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedDistrict,
              isExpanded: true,
              hint: Text('시/군'),
              items: [
                DropdownMenuItem(child: Text('서귀포'), value: '서귀포'),
                // Add more districts if needed
              ],
              onChanged: (value) {
                setState(() {
                  selectedDistrict = value;
                  _updateAttractions();
                });
              },
            ),
            SizedBox(height: 20),
            ...attractions.map((attraction) {
              return CheckboxListTile(
                title: Text(attraction),
                value: selectedAttractions.contains(attraction),
                onChanged: (isSelected) {
                  setState(() {
                    if (isSelected == true) {
                      selectedAttractions.add(attraction);
                    } else {
                      selectedAttractions.remove(attraction);
                    }
                  });
                },
              );
            }).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, selectedAttractions);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('여행지 등록'),
            ),
          ],
        ),
      ),
    );
  }
}