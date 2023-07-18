import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/values/colors.dart';

Widget buildPage(int index){
  List<Widget> _widget = const [
    Center(child: Text("Home"),),
    Center(child: Text("Search"),),
    Center(child: Text("Course"),),
    Center(child: Text("Chat"),),
    Center(child: Text("Profile"),),
  ];

  return _widget[index];
}

var bottomTabs = [
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
];