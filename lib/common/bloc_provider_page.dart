import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/count_bloc/count_bloc.dart';
import '../bloc/onboarding_bloc/on_boarding_bloc.dart';
import '../bloc/sign_in_bloc/sign_in_bloc.dart';
import '../bloc/signup_bloc/signup_bloc.dart';

class BlocProviderPage{
  static get blocProviders => [
    BlocProvider<CountBloc>(create: (context) => CountBloc()),
    BlocProvider<OnBoardingBloc>(create: (context) => OnBoardingBloc()),
    BlocProvider<SignInBloc>(create: (context) => SignInBloc()),
    BlocProvider<SignUpBloc>(create: (context) => SignUpBloc()),
  ];
}