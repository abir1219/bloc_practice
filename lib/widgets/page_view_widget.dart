import 'package:bloc_01/main.dart';
import 'package:bloc_01/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/routes/routes.dart';
import '../screens/sign_in.dart';

class PageViewWidget extends StatelessWidget {
  int index;
  PageController pageController;
  String title, subtitle, imgUrl, buttonName;

  PageViewWidget(
      {Key? key,
      required this.index,
      required this.pageController,
      required this.title,
      required this.subtitle,
      required this.imgUrl,
      required this.buttonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 345.h,
          width: 345.w,
          child: /*const Center(child: Text("ImageUrl"),),*/ Image.asset(
            imgUrl,
            fit: BoxFit.cover,
          ),
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
        CustomButton(
            buttonName: buttonName,
            callback: () {
              // debugPrint("------Clicked------");
              if (index < 3) {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              } else {
                // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SignIn()),(route) => false,);
                Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN,(route) => false,);
              }
            })
      ],
    );
  }
}
