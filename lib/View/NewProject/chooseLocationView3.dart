import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripdraw/style.dart' as style;
import 'package:get/get.dart';
import '../../Widget/goBackWidget.dart';
import '../mainView.dart';

class ChooseLocationView3 extends StatefulWidget {
  const ChooseLocationView3({super.key});

  @override
  State<ChooseLocationView3> createState() => _ChooseLocationView3State();
}

class _ChooseLocationView3State extends State<ChooseLocationView3> {
  String? selectedRegion;
  String? selectedCity;
  String? selectedPlace;
  bool showCities = false;
  bool showPlaces = false;

  final Map<String, List<String>> regions = {
    '강원도': ['원주군', '춘천시', '강릉시'],
    '전라북도': ['전주시', '익산시', '군산시'],
    '서울특별시': [],
    '부산광역시': [],
  };

  final Map<String, List<String>> places = {
    '강원도': ['오죽헌', '아르떼뮤지엄 강릉', '하슬라아트월드', '경포대'],
    '서울특별시': ['경복궁', '남산타워', '광화문'],
    '전주시': ['한옥마을', '모악산'],
    '익산시': ['미륵사지', '교도소 세트장'],
    '부산광역시': ['해운대', '광안리', '태종대']
  };

  // New Map to store selected options
  Map<String, bool> options = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 첫 번째 Expanded: Dropdown 및 선택 화면
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '여행 장소를 골라주세요',
                    style: style.textTheme.titleSmall,
                  ),
                  DropdownButton<String>(
                    hint: Text('여행 장소는 어디인가요?'),
                    value: selectedRegion,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedRegion = newValue; // 큰 지역 입력
                        selectedCity = null; // 선택된 도시 없음
                        selectedPlace = null; // 선택된 장소 없음
                        showCities =
                            regions[newValue]!.isNotEmpty; // 시/군 화면 표시 여부
                        //시/군이 있으면
                        showPlaces = !showCities; // 시/군이 없으면 바로 장소 선택 화면으로
                      });
                    },
                    items: regions.keys.map((String region) {
                      return DropdownMenuItem<String>(
                        value: region,
                        child: Text(region),
                      );
                    }).toList(),
                  ),
                  if (showCities)
                    Container(
                      child: DropdownButton<String>(
                        hint: Text('시/군을 선택하세요'),
                        value: selectedCity,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCity = newValue;
                            selectedPlace = null; // 선택된 장소 초기화
                            showPlaces = true; // 시/군 선택 후 장소 선택 화면을 보여줌
                          });
                        },
                        items: regions[selectedRegion]!.map((String city) {
                          return DropdownMenuItem<String>(
                            value: city,
                            child: Text(city),
                          );
                        }).toList(),
                      ),
                    ),
                ],
              ),
            ),
            if (showPlaces && selectedRegion != null)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text('방문할 관광지를 골라주세요'),
                    ListView(
                      shrinkWrap: true, // ListView 크기 제한
                      children: (selectedCity != null
                              ? places[selectedCity] ?? []
                              : places[selectedRegion]!)
                          .map((place) {
                        // Initialize the checkbox state if not already set
                        if (!options.containsKey(place)) {
                          options[place] = false;
                        }
                        return Transform.scale(
                          scale: 1.0, // 체크박스 크기 조정
                          child: CheckboxListTile(
                            title: Text(
                              place,
                              style: style.textTheme.bodyMedium,
                            ),
                            value: options[place],
                            onChanged: (bool? value) {
                              setState(() {
                                options[place] = value ?? false; // null 방지
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            visualDensity: VisualDensity(
                              horizontal: -4.0,
                              vertical: -4.0,
                            ), // 간격을 좁힘
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            // 두 번째 Expanded: ListView 사용해 선택할 장소 목록을 표시
            Container(
              height: 200.h,
              // color: Colors.white,
            ),
            // 하단 버튼을 위한 공간
            Column(
              children: [
                GoBackWidget(),
                SizedBox(
                  width: 320.w,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: ElevatedButton(
                      onPressed: () {
                        print("Button clicked");
                        // 현재 페이지의 옵션을 전달하여 다음 페이지로 이동
                        Get.to(
                          () => MainView(),
                        );
                        print('선택한 장소: $selectedPlace');
                      },
                      child: Text(
                        '다음',
                        style: style.textTheme.headlineMedium,
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 12.h),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
