import 'package:bloc_01/bloc/sign_in_bloc/sign_in_event.dart';
import 'package:bloc_01/bloc/sign_in_bloc/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<EmailEvent>((event, emit) {
      // debugPrint("My email is ${event.email}");
      emit(state.copyWith(email: event.email));
    });

    on<PasswordEvent>((event, emit) {
      // debugPrint("My password is ${event.password}");
      emit(state.copyWith(password: event.password));
    });

    on<PasswordVisibility>((event, emit) =>
    (event, emit) {
      emit(SignInState(passwordVisible: !state.passwordVisible));
    });
  }
}