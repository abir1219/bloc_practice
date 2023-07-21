import 'package:bloc_01/bloc/application_bloc/application_bloc.dart';
import 'package:bloc_01/bloc/onboarding_bloc/on_boarding_bloc.dart';
import 'package:bloc_01/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:bloc_01/bloc/signup_bloc/signup_bloc.dart';
import 'package:bloc_01/bloc/slider_bloc/slider_bloc.dart';
import 'package:bloc_01/common/routes/routes.dart';
import 'package:bloc_01/screens/home_page.dart';
import 'package:bloc_01/screens/on_boarding_screen.dart';
import 'package:bloc_01/screens/registration.dart';
import 'package:bloc_01/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../global.dart';
import '../../screens/application_page.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const OnBoardingScreen(),
          bloc: BlocProvider(
            create: (_) => OnBoardingBloc(),
          )),
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: const SignIn(),
          bloc: BlocProvider(
            create: (_) => SignInBloc(),
          )),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Registration(),
          bloc: BlocProvider(
            create: (_) => SignUpBloc(),
          )),
      PageEntity(
          route: AppRoutes.APPLICATION,
          page: const ApplicationPage(),
          bloc: BlocProvider(
            create: (_) => ApplicationBloc(),
          )),
      PageEntity(
          route: AppRoutes.HOME_PAGE,
          page: const HomePage(),
          bloc: BlocProvider(
            create: (_) => SliderBloc(),
          )),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute generatePageRoute(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool openDiviceFirstTime = Global.storageService.getDiviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && openDiviceFirstTime) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        debugPrint("First name = ${result.first.page}");
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}
