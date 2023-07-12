import 'package:bloc_01/bloc/onboarding_bloc/on_boarding_bloc.dart';
import 'package:bloc_01/bloc/onboarding_bloc/on_boarding_event.dart';
import 'package:bloc_01/widgets/page_view_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/onboarding_bloc/on_boarding_state.dart';
import '../common/values/colors.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    PageController pageController = PageController(initialPage: 0);

    return Container(
      color: Colors.white,
      child: Scaffold(
        body: SizedBox(
          width: 375.w,
          //margin: EdgeInsets.only(top: 34.h),
          child: BlocBuilder<OnBoardingBloc,OnBoardingState>(
            builder: (context, state) => Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.index = index;
                    BlocProvider.of<OnBoardingBloc>(context).add(OnBoardingEvent());
                  },
                  children: [
                    PageViewWidget(index:1,pageController: pageController,title: "title1",subtitle: "subtitle1",buttonName: "Next",imgUrl: "assets/images/reading.png",),
                    PageViewWidget(index:2,pageController: pageController,title: "title2",subtitle: "subtitle2",buttonName: "Next",imgUrl: "assets/images/boy.png"),
                    PageViewWidget(index:3,pageController: pageController,title: "title3",subtitle: "subtitle3",buttonName: "Get Started",imgUrl: "assets/images/man.png"),
                  ],
                ),
                Positioned(
                  bottom: 15,
                  child: DotsIndicator(dotsCount: 3,
                    position: state.index,
                    decorator:  DotsDecorator(
                      color: Colors.grey,
                      activeColor: AppColors.primaryElement,
                      activeSize:const Size(18.0,8.0),
                      size:const Size(8.0,8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      )
                    ),),
                )
              ],
            ),
          ),

        ),
      ),
    );
  }

}
