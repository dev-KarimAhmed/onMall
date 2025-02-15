import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/app/app_cubit/app_cubit.dart';
import 'package:on_mall/core/app/connectivity_controller.dart';
import 'package:on_mall/core/app/env_varibles.dart';
import 'package:on_mall/core/common/screens/no_network_screen.dart';
import 'package:on_mall/core/di/dependency_injection.dart';
import 'package:on_mall/core/language/app_localization_setup.dart';
import 'package:on_mall/core/routes/app_routes.dart';
import 'package:on_mall/core/styles/theme/app_theme.dart';

class OnMall extends StatelessWidget {
  const OnMall({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnectedNotifier,
      builder: (_, value, __) {
        if (value) {
          return BlocProvider(
            create: (context) => sl<AppCubit>()..getSavedLanguage(),
            child: BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                final cubit = BlocProvider.of<AppCubit>(context);
                return ScreenUtilInit(
                  designSize: const Size(360, 690),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  child: MaterialApp(
                    locale: Locale(cubit.currentLanguage),
                    supportedLocales: AppLocalizationsSetup.supportedLocales,
                    localeResolutionCallback:
                        AppLocalizationsSetup.localeResolutionCallback,
                    localizationsDelegates:
                        AppLocalizationsSetup.localizationsDelegates,
                    theme: AppTheme.lighTheme(),
                    initialRoute: AppRoutes.onboardingScreen,
                    onGenerateRoute: AppRoutes.onGenerateRout,
                    builder: (context, child) {
                      return GestureDetector(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: Scaffold(
                          body: Builder(builder: (context) {
                            ConnectivityController.instance.init();
                            return child!;
                          }),
                        ),
                      );
                    },
                    debugShowCheckedModeBanner: EnvVariables.instance.isDev,
                    title: 'OnMall',
                  ),
                );
              },
            ),
          );
        } else {
          return MaterialApp(
            title: 'No Network',
            debugShowCheckedModeBanner: EnvVariables.instance.isDev,
            home: const NoNetworkScreen(),
          );
        }
      },
    );
  }
}
