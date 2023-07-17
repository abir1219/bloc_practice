import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static pageView(int index, String title, String subtitle, String buttonName,
      String ImageUrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 345.h,
          width: 345.w,
          child: const Center(
            child: Text("ImageUrl"),
          ), //Image.asset(ImageUrl),
        ),
        SizedBox(
            width: 375.w,
            child: Center(
                child: Text(
              title,
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ))),
        SizedBox(
            width: 375.w,
            child: Center(
                child: Text(
              subtitle,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.black.withOpacity(0.5)),
            ))),
        customButton(buttonName)
      ],
    );
  }

  static customButton(String buttonName) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 100.h, left: 25.h, right: 25.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15.0.w),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(1, 2))
          ]),
      child: Text(
        buttonName,
        style: TextStyle(fontSize: 16.sp, color: Colors.white),
      ),
    );
  }

  static showFlutterToastMsg(
      {required String msg,
      Color backgroundColor = Colors.black,
      Color textColor = Colors.white}) {
    return Fluttertoast.showToast(
        msg: msg,
        backgroundColor: backgroundColor,
        textColor: textColor,
        gravity: ToastGravity.TOP,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 14.sp);
  }
}
