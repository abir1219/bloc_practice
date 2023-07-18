import 'package:bloc_01/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/application_widget.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: buildPage(_index),
          bottomNavigationBar: Container(
            // width: 375.w,
            height: 58.h,

            decoration: BoxDecoration(
              color: AppColors.primaryElement,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.h),
                  topRight: Radius.circular(10.h),
                ),
                boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 1,
                  spreadRadius: 1)
            ]),
            child: BottomNavigationBar(
              currentIndex: _index,
              elevation: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                setState(() {
                  _index = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: SizedBox(
                      height: 15.h,
                      width: 15.w,
                      child: Image.asset("assets/icons/home.png"),
                    ),
                    activeIcon: SizedBox(
                      height: 15.h,
                      width: 15.w,
                      child: Image.asset(
                        "assets/icons/home.png",
                        color: AppColors.primaryElement,
                      ),
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: SizedBox(
                      height: 15.h,
                      width: 15.w,
                      child: Image.asset("assets/icons/search2.png"),
                    ),
                    activeIcon: SizedBox(
                      height: 15.h,
                      width: 15.w,
                      child: Image.asset(
                        "assets/icons/search2.png",
                        color: AppColors.primaryElement,
                      ),
                    ),
                    label: "Search"),
                BottomNavigationBarItem(
                    icon: SizedBox(
                      height: 15.h,
                      width: 15.w,
                      child: Image.asset("assets/icons/play-circle1.png"),
                    ),
                    activeIcon: SizedBox(
                      height: 15.h,
                      width: 15.w,
                      child: Image.asset(
                        "assets/icons/play-circle1.png",
                        color: AppColors.primaryElement,
                      ),
                    ),
                    label: "Course"),
                BottomNavigationBarItem(
                    icon: SizedBox(
                      height: 15.h,
                      width: 15.w,
                      child: Image.asset("assets/icons/message-circle.png"),
                    ),
                    activeIcon: SizedBox(
                      height: 15.h,
                      width: 15.w,
                      child: Image.asset(
                        "assets/icons/message-circle.png",
                        color: AppColors.primaryElement,
                      ),
                    ),
                    label: "Chat"),
                BottomNavigationBarItem(
                    icon: SizedBox(
                      height: 15.h,
                      width: 15.w,
                      child: Image.asset("assets/icons/person2.png"),
                    ),
                    activeIcon: SizedBox(
                      height: 15.h,
                      width: 15.w,
                      child: Image.asset(
                        "assets/icons/person2.png",
                        color: AppColors.primaryElement,
                      ),
                    ),
                    label: "Profile"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
