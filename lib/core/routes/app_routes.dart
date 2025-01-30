import 'package:flutter/material.dart';
import 'package:on_mall/core/common/screens/under_builder_screen.dart';
import 'package:on_mall/core/routes/based_route.dart';
import 'package:on_mall/features/on_boarding/views/on_boarding_view.dart';


class AppRoutes {
  static const String onboardingScreen = 'onboarding';
  static const String loginScreen = 'login';


  static Route<void> onGenerateRout(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case onboardingScreen:
        return BaseRoute(page: const OnboardingView());
      default:
        return BaseRoute(page: const UnderBuilderScreen());
    }
  }
}