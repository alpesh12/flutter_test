import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/screens/home_page/home_binding.dart';
import 'package:my_profile/screens/home_page/home_view.dart';
import 'package:my_profile/screens/login_screen/login_binding.dart';

import '../screens/login_screen/login_view.dart';
import '../screens/splash_screen/splash_binding.dart';
import '../screens/splash_screen/splash_view.dart';
import 'app_routes.dart';

Duration transitionDuration = const Duration(milliseconds: 400);

class AppPages {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return GetPageRoute(
          routeName: settings.name,
          page: () => const SplashView(),
          binding: SplashBinding(),
          transition: Transition.rightToLeft,
          transitionDuration: transitionDuration,
        );
      case Routes.loginScreen:
        return GetPageRoute(
          routeName: settings.name,
          page: () => const LoginView(),
          binding: LoginBinding(),
          transition: Transition.rightToLeft,
          transitionDuration: transitionDuration,
        );
      case Routes.homeScreen:
        return GetPageRoute(
          routeName: settings.name,
          page: () => const HomeView(),
          binding: HomeBinding(),
          transition: Transition.rightToLeft,
          transitionDuration: transitionDuration,
        );

      default:
        return GetPageRoute(
          page: () => Scaffold(
            body: Center(
              child: Text('No path for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
