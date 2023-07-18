import 'package:bloc_01/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:bloc_01/controller/sign_in_controller.dart';
import 'package:bloc_01/screens/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/sign_in_bloc/sign_in_event.dart';
import '../bloc/sign_in_bloc/sign_in_state.dart';
import '../common/routes/routes.dart';
import '../widgets/sign_in_widget.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          width: 325.w,
          // margin: EdgeInsets.only(top: 25.w),
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Log In"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 25.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildIconWidget(context, "google"),
                              buildIconWidget(context, "apple"),
                              buildIconWidget(context, "facebook"),
                            ],
                          ),
                          Center(
                              child: reusableText(
                                  "Or use email account to login")),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(top: 25.w, left: 20.w, right: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 10.w),
                              child: reusableText("Email")),
                          reusableTextField("Enter email address", "email",
                              "user", (value) {
                            context.read<SignInBloc>().add(EmailEvent(value));
                              }),
                          Container(
                              margin: EdgeInsets.only(left: 10.w, top: 10.w),
                              child: reusableText("Password")),
                          reusableTextField(
                              "Enter password", "password", "lock", (value) {
                            context.read<SignInBloc>().add(PasswordEvent(value));
                          }),
                          forgetPasswordText(),
                          loginAndRegButton("Log In", "login",() {
                            debugPrint("Login Button clicked");
                            SignInController(context: context).handleSignIn("email");
                          }),
                          loginAndRegButton("Sign Up", "reg",() {
                            debugPrint("Sign up Button clicked");
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => const Registration(),));
                            Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.REGISTER,(route) => false,);
                          }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
