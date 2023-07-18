import 'package:bloc_01/bloc/onboarding_bloc/on_boarding_bloc.dart';
import 'package:bloc_01/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:bloc_01/bloc/signup_bloc/signup_bloc.dart';
import 'package:bloc_01/common/routes/routes.dart';
import 'package:bloc_01/screens/application_page.dart';
import 'package:bloc_01/screens/on_boarding_screen.dart';
import 'package:bloc_01/screens/registration.dart';
import 'package:bloc_01/screens/sign_in.dart';
import 'package:flutter/cupertino.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const OnBoardingScreen(),
          bloc: OnBoardingBloc),
      PageEntity(
          route: AppRoutes.SIGN_IN, page: const SignIn(), bloc: SignInBloc),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Registration(),
          bloc: SignUpBloc),
      PageEntity(route: AppRoutes.APPLICATION, page: const ApplicationPage()),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
