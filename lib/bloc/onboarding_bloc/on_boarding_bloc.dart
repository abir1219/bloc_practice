import 'package:bloc_01/bloc/onboarding_bloc/on_boarding_event.dart';
import 'package:bloc_01/bloc/onboarding_bloc/on_boarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc() : super(OnBoardingState()) {
    on<OnBoardingEvent>((event, emit) {
      emit(OnBoardingState(index: state.index));
    });
  }
}
