import 'package:bloc_01/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/home_page_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myHomePageAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homePageText("Hello,",color: AppColors.primaryThreeElementText,top: 20),
            homePageText("Abir",top: 5),
            SizedBox(height: 10.h,),
            searchView(context),
            SizedBox(height: 10.h),
            sliderView(context),
            Container(
              width: 375.w,
              margin: EdgeInsets.only(top: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Choice your course",style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                  Text("See All",style: TextStyle(fontSize: 10.sp,color: Colors.grey.withOpacity(0.5),fontWeight: FontWeight.bold),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
