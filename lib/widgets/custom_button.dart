import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/values/colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback callback;
  CustomButton({Key? key,required this.buttonName,required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // debugPrint("------Clickedsdd------");
        callback();
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 100.h,left: 25.h,right: 25.h),
        width: 325.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(15.0.w),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(1,2)
              )
            ]
        ),
        child: Text(buttonName,style: TextStyle(fontSize: 16.sp,color: Colors.white),),
      ),
    );
  }
}
