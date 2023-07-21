import 'package:bloc_01/bloc/slider_bloc/slider_event.dart';
import 'package:bloc_01/bloc/slider_bloc/slider_state.dart';
import 'package:bloc_01/common/values/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/slider_bloc/slider_bloc.dart';

AppBar myHomePageAppBar() {
  return AppBar(
    elevation: 0,
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15.h,
            width: 15.w,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              child: Icon(
                Icons.person,
                size: 22,
              ),
              radius: 20,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget searchView(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
          width: 300,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border:
                Border.all(color: Colors.grey.withOpacity(0.5), width: 0.8.w),
          ),
          child: TextField(
            decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                hintText: "Search your course...",
                hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.5), fontSize: 12.sp),
                enabledBorder: InputBorder.none,
                focusColor: Colors.transparent,
                disabledBorder: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.withOpacity(0.5),
                  size: 20,
                )),
          )),
      SizedBox(
        width: 40.w,
        height: 40.h,
        child: Image.asset(
          "assets/icons/filter.png",
          fit: BoxFit.cover,
        ),
      )
    ],
  );
}

Widget sliderView(BuildContext context) {
  int index = 0;
  return BlocBuilder<SliderBloc,SliderState>(builder: (context, state) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h),
          width: 375.w,
          height: 180.h,
          child: PageView(
            onPageChanged: (value) {
              state.index = value;
              BlocProvider.of<SliderBloc>(context).add(SlideEvent(value));
            },
            children: [
              reusableImageSlider("art"),
              reusableImageSlider("image_1"),
              reusableImageSlider("image_2"),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
              activeColor: AppColors.primaryElement,
              color: Colors.grey.withOpacity(0.5),
              activeSize: const Size(16.0, 5.0),
              size: const Size.square(5.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )),
        )
      ],
    );
  },
  );
}

Widget reusableImageSlider(String iconName) {
  return Container(
    width: 375.w,
    height: 180.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.h),
        image: DecorationImage(
          image: AssetImage("assets/icons/$iconName.png"),
          fit: BoxFit.fill,
          // filterQuality: FilterQuality.high
        )),
  );
}
