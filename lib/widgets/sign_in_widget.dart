import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/routes/routes.dart';
import '../common/values/colors.dart';

AppBar buildAppBar(String title, [BuildContext? context]) {
  return AppBar(
    leading: title == "Sign Up"
        ? IconButton(
            onPressed: () {
              // Navigator.pushAndRemoveUntil(context!, MaterialPageRoute(builder: (context) =>const SignIn(),),(route) => false,);
              Navigator.of(context!).pushNamedAndRemoveUntil(
                AppRoutes.SIGN_IN,
                (route) => false,
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
              size: 24,
            ),
          )
        : null,
    title: Text(
      title,
      style: TextStyle(
          fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.normal),
    ),
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        height: 1.0,
        color: Colors.grey.withOpacity(0.5),
      ),
    ),
  );
}

Widget buildIconWidget(BuildContext context, String iconTitle) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      height: 35.h,
      width: 35.w,
      child: Image.asset("assets/icons/$iconTitle.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
      margin: EdgeInsets.only(top: 15.h),
      child: Text(text,
          style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey.withOpacity(0.5),
              fontWeight: FontWeight.normal)));
}

Widget forgetPasswordText() {
  return Container(
      margin: EdgeInsets.only(top: 15.h),
      child: Text("Forgot Password",
          style: TextStyle(
              fontSize: 12.sp,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
              decorationThickness: 1.5,
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.normal)));
}

Widget reusableTextField(String hintText, String fieldType, String iconTitle,
    void Function(String value)? func) {
  return Container(
    width: 325.w,
    height: 45.h,
    margin: EdgeInsets.only(top: 5.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        color: Colors.white,
        border: Border.all(color: Colors.black)),
    child: Row(
      children: [
        Container(
            margin: EdgeInsets.only(left: 8.w),
            height: 16.h,
            width: 16.w,
            child: Image.asset("assets/icons/$iconTitle.png")),
        Container(
          padding: EdgeInsets.only(right: 8.w, left: 4.w),
          width: 285.w,
          child: TextField(
            onChanged: (value) => func!(value),
            keyboardType: fieldType == "email"
                ? TextInputType.emailAddress
                : TextInputType.text,
            obscureText: fieldType == "password" ? true : false,
            autocorrect: false,
            style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
                fontWeight: FontWeight.normal),
            decoration: InputDecoration(
              hintText: hintText,
              /*suffixIcon: fieldType == "password" ?IconButton(
                onPressed: () {},
                icon: Icon(fieldType == "password" ? Icons.visibility : null,color: Colors.black,),
                color: Colors.white,
              ):Container(),*/
              hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5), fontSize: 12.sp),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
            ),
          ),
        )
      ],
    ),
  );
}

Widget loginAndRegButton(String btnName, String type, void Function()? func) {
  return GestureDetector(
    onTap: () => func!(),
    child: Container(
      margin: EdgeInsets.only(top: type == "login" ? 30.w : 15.w),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.w),
          border: type == "login"
              ? Border.all(color: Colors.transparent, width: 0.5)
              : Border.all(color: AppColors.primaryText, width: 0.5),
          color: type == "login"
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(1.0, 0.5))
          ]),
      child: Center(
          child: Text(
        btnName,
        style: TextStyle(
            color: type == "login"
                ? AppColors.primaryBackground
                : AppColors.primaryText,
            fontSize: 15.sp,
            fontWeight: FontWeight.normal),
      )),
    ),
  );
}
