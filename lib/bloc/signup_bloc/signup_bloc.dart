import 'package:bloc_01/bloc/signup_bloc/signup_event.dart';
import 'package:bloc_01/bloc/signup_bloc/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<UsernameEvent>(
        (event, emit) => emit(state.copyWith(username: event.username)));
    on<EmailEvent>((event, emit) => emit(state.copyWith(email: event.email)));
    on<PasswordEvent>(
        (event, emit) => emit(state.copyWith(password: event.password)));
    on<ConfirmPasswordEvent>(
        (event, emit) => emit(state.copyWith(repassword: event.repassword)));
  }
}
