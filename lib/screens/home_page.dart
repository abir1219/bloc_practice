import 'package:bloc_01/common/values/colors.dart';
import 'package:bloc_01/widgets/sign_in_widget.dart';
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

          ],
        ),
      ),
    );
  }
}
