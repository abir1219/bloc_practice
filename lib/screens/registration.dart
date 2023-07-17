import 'package:bloc_01/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/sign_in_widget.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar("Sign Up",context),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: reusableText(
                          "Enter your details below & free signup")),
                  Container(
                    margin: EdgeInsets.only(top: 25.w,left: 20.w,right: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10.w),
                            child: reusableText("User name")),
                        reusableTextField("Enter your username", "email",
                            "user", (value) {}),

                        Container(
                            margin: EdgeInsets.only(left: 10.w),
                            child: reusableText("Email")),
                        reusableTextField("Enter your email address", "email",
                            "user", (value) {}),

                        Container(
                            margin: EdgeInsets.only(left: 10.w),
                            child: reusableText("Password")),
                        reusableTextField("Enter your password", "password",
                            "lock", (value) {}),

                        Container(
                            margin: EdgeInsets.only(left: 10.w),
                            child: reusableText("Confirm Password")),
                        reusableTextField("Enter your confirm password", "password",
                            "lock", (value) {}),

                        const SizedBox(height: 15,),
                        reusableText(
                            "By creating an account you have to agree with our term & condition."),

                        // const SizedBox(height: 25,),
                        loginAndRegButton("Sign Up", "login",() {
                          debugPrint("Sign up Button clicked");
                          RegisterController(context: context).handleEmailRegister();
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const Registration(),));
                        }),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
