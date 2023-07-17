import 'package:bloc_01/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/utils.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {

    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;

        String emailAddress = state.email;
        String password = state.password;

        debugPrint("STATE-->Email:${state.email} & Password: ${state.password}");

        if (emailAddress.isEmpty) {
          // debugPrint("Email is empty");
          Utils.showFlutterToastMsg(msg:"Email is empty");
          return;
        }else{
          debugPrint("Email is: $emailAddress");
          Utils.showFlutterToastMsg(msg:"Email is: $emailAddress");
          return;
        }
        if (password.isEmpty) {
          debugPrint("Password is empty");
          Utils.showFlutterToastMsg(msg:"Password is empty");
          return;
        }else{
          debugPrint("Password is: $password");
          Utils.showFlutterToastMsg(msg:"Password is: $password");
          return;
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          if (credential.user == null) {
            debugPrint("User does not exist");
            Utils.showFlutterToastMsg(msg:"User does not exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            debugPrint("User email is not verified");
            Utils.showFlutterToastMsg(msg:"User email is not verified");
            return;
          }

          var user = credential.user;
          if (user != null) {
            // we got verified user from firebase
            debugPrint("User exist");
            Utils.showFlutterToastMsg(msg:"User exist");
            return;
          } else {
            // we have error getting user from firebase
            debugPrint("User does not exist");
            Utils.showFlutterToastMsg(msg:"User does not exist");
            return;
          }
        }on FirebaseAuthException catch (e) {
          if(e.code=="user-not-found"){
            debugPrint("No user found for this email");
            Utils.showFlutterToastMsg(msg:"No user found for this email");
            return;
          }else if(e.code=="wrong-password"){
            debugPrint("Wrong password provided for this user");
            Utils.showFlutterToastMsg(msg:"Wrong password provided for this user");
            return;
          }else if(e.code=="invalid-email"){
            debugPrint("invalid email");
            Utils.showFlutterToastMsg(msg:"invalid email");
            return;
          }
        }
      }
    } catch (e) {}
  }
}
