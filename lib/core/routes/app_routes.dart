import 'package:flutter/material.dart';
import 'package:on_mall/core/common/screens/under_builder_screen.dart';
import 'package:on_mall/core/routes/based_route.dart';
import 'package:on_mall/features/authentication/presentation/views/forgot_password_view.dart';
import 'package:on_mall/features/authentication/presentation/views/login_view.dart';
import 'package:on_mall/features/authentication/presentation/views/register_view.dart';
import 'package:on_mall/features/on_boarding/presentation/views/on_boarding_view.dart';


class AppRoutes {
  static const String onboardingScreen = 'onboarding';
  static const String loginScreen = 'login';
  static const String registerScreen = 'register';
  static const String forgotPasswordScreen = 'forgotPasswordScreen';


  static Route<void> onGenerateRout(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case onboardingScreen:
        return BaseRoute(page: const OnboardingView());
      case loginScreen:
        return BaseRoute(page: const LoginView());  
      case registerScreen:
        return BaseRoute(page: const RegisterView());  
      case forgotPasswordScreen:
        return BaseRoute(page:  ForgotPasswordView());
      default:
        return BaseRoute(page: const UnderBuilderScreen());
    }
  }
}