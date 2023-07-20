import 'package:bloc_01/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  var size = MediaQuery.of(context).size;
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: size.width * .75,
            height: 40.h,
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(color: Colors.grey.withOpacity(0.5), width: 0.8.w),
            ),
            child: TextField(
              decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent
                    )
                  ),
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
            width: size.width * .12,
          height: 40.h,
          child: Image.asset(
            "assets/icons/filter.png",
            fit: BoxFit.cover,
          ),
        )
      ],
    ),
  );
}
