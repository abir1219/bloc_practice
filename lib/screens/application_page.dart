import 'package:bloc_01/bloc/application_bloc/application_bloc.dart';
import 'package:bloc_01/bloc/application_bloc/application_event.dart';
import 'package:bloc_01/bloc/application_bloc/application_state.dart';
import 'package:bloc_01/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/application_widget.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: BlocBuilder<ApplicationBloc,ApplicationState>(builder: (BuildContext context, state){
          return Scaffold(
            backgroundColor: Colors.white,
            body: buildPage(state.index),
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
                currentIndex: state.index,
                elevation: 0,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  // setState(() {
                  //   _index = value;
                  // });
                  context.read<ApplicationBloc>().add(TriggerAppEvent(value));
                },
                items: bottomTabs,
              ),
            ),
          );
        }
        ),
      ),
    );
  }
}
