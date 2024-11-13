import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripdraw/style.dart' as style;
class GoalView extends StatefulWidget {
  @override
  _GoalViewState createState() => _GoalViewState();
}

class _GoalViewState extends State<GoalView>
    with TickerProviderStateMixin {
  List<bool> isSelected = [false, false, false, false, false, false];
  List<bool> isVisible = [false, false, false, false, false, false];

  @override
  void initState() {
    super.initState();

    // Trigger the fade-in animation for each card on screen load
    Future.delayed(Duration(milliseconds: 5), () {
      setState(() {
        isVisible = [true, true, true, true, true, true];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final services = [
      {'name': '힐링', 'icon': Icons.healing},
      {'name': '액티비티', 'icon': Icons.sports_handball_rounded},
      {'name': '추억', 'icon': Icons.memory},
      {'name': '맛집탐방', 'icon': Icons.fastfood},
      {'name': '팬투어', 'icon': Icons.tour},
      {'name': '출장', 'icon': Icons.work},
    ];

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 50.h, 20.w, 16.h),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '여행 목적',
                style: style.textTheme.titleSmall,
              ),
              Text(
                '이번 여행을 가는 이유는 무엇인가요?\n스토리보드 생성에 반영됩니다',
                style: style.textTheme.displayMedium,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    return AnimatedOpacity(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeOut,
                      opacity: isVisible[index] ? 1.0 : 0.0,
                      child: AnimatedSlide(
                        duration: Duration(milliseconds: 500),
                        offset: isVisible[index] ? Offset(0, 0) : Offset(0, 0.2),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected[index] = !isSelected[index];
                            });
                          },
                          child: TweenAnimationBuilder(
                            duration: Duration(milliseconds: 100),
                            tween: Tween<double>(
                                begin: 1.0, end: isSelected[index] ? 1.05 : 1.0),
                            builder: (context, double scale, child) {
                              return Transform.scale(
                                scale: scale,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isSelected[index]
                                        ? Colors.blue[50]
                                        : Colors.grey[200],
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: isSelected[index]
                                          ? Colors.blue
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(services[index]['icon'] as IconData?,
                                          size: 40, color: Colors.blue),
                                      SizedBox(height: 8),
                                      Text(
                                        services[index]['name'].toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ]),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous screen
            },
            child: Icon(Icons.arrow_back),
            backgroundColor: Colors.grey,
          ),
          SizedBox(width: 16.w), // Space between the buttons
          FloatingActionButton(
            onPressed: () {
              // Action for the forward button
            },
            child: Icon(Icons.arrow_forward),
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
