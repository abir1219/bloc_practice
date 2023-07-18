import 'package:bloc_01/bloc/signup_bloc/signup_bloc.dart';
import 'package:bloc_01/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context
        .read<SignUpBloc>()
        .state;
    String username = state.username;
    String email = state.email;
    String password = state.password;
    String rePassword = state.repassword;

    if (username.isEmpty) {
      Utils.showFlutterToastMsg(msg: "Username can not be empty");
      
    }

    if (email.isEmpty) {
      Utils.showFlutterToastMsg(msg: "email can not be empty");
      
    }

    if (password.isEmpty) {
      Utils.showFlutterToastMsg(msg: "Password can not be empty");
      
    }

    if (rePassword.isEmpty) {
      Utils.showFlutterToastMsg(msg: "Confirm password can not be empty");
      
    }

    // debugPrint("Password: $password & Confirm Password: $rePassword");

    if (password != rePassword) {
      Utils.showFlutterToastMsg(msg: "Password mismatch");
      
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);

        Utils.showFlutterToastMsg(
            msg: "An email has been sent to your registered email. To activate it please check your email and click on the link");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        Utils.showFlutterToastMsg(msg: "invalid email");
      } else if (e.code == "email-already-in-use") {
        Utils.showFlutterToastMsg(msg: "The email is already in use");
      } else if (e.code == "weak-password") {
        Utils.showFlutterToastMsg(msg: "The password provided is too weak");
      } /*else if(e.code=="invalid-email"){
        Utils.showFlutterToastMsg(msg: "invalid email");
      }*/
    }
  }
}
