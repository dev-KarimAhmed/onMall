import 'package:flutter/material.dart';
import 'package:on_mall/core/styles/colors/light_colors.dart';
import 'package:on_mall/core/styles/helpers/font_family_helper.dart';
import 'package:on_mall/core/styles/theme/app_colors.dart';

class AppTheme {
  static ThemeData lighTheme() {
    return ThemeData(
      extensions: const <ThemeExtension<dynamic>>[MyColors.light],
      scaffoldBackgroundColor: LightColors.mainColor,
      useMaterial3: true,
      textTheme: TextTheme(
        displaySmall: TextStyle(
          color: LightColors.blackColor,
          fontSize: 14,
          fontFamily: FontFamilyHelper.getFontFamily(),
        ),
        displayMedium: TextStyle(
          color: LightColors.blackColor,
          fontSize: 16,
          fontFamily: FontFamilyHelper.getFontFamily(),
        ),
        displayLarge: TextStyle(
          color: LightColors.blackColor,
          fontSize: 20,
          fontFamily: FontFamilyHelper.getFontFamily(),
        ),
        bodyMedium: TextStyle(
          color: LightColors.blackColor,
          fontSize: 22,
          fontFamily: FontFamilyHelper.getFontFamily(),
        ),
        bodyLarge: TextStyle(
          color: LightColors.blackColor,
          fontSize: 26,
          fontFamily: FontFamilyHelper.getFontFamily(),
        ),
      ),
    );
  }

  // static ThemeData darkTheme() {
  //   return ThemeData(
  //     extensions: const <ThemeExtension<dynamic>>[MyColors.dark],
  //     scaffoldBackgroundColor: DarkColors.mainColor,
  //     useMaterial3: true,
  //     textTheme: TextTheme(
  //       displaySmall: TextStyle(
  //         color: LightColors.mainColor,
  //         fontSize: 14,
  //         fontFamily: FontFamilyHelper.getFontFamily(),
  //       ),
  //       displayMedium: TextStyle(
  //         color: LightColors.mainColor,
  //         fontSize: 16,
  //         fontFamily: FontFamilyHelper.getFontFamily(),
  //       ),
  //       displayLarge: TextStyle(
  //         color: LightColors.mainColor,
  //         fontSize: 20,
  //         fontFamily: FontFamilyHelper.getFontFamily(),
  //       ),
  //       bodyMedium: TextStyle(
  //         color: LightColors.mainColor,
  //         fontSize: 22,
  //         fontFamily: FontFamilyHelper.getFontFamily(),
  //       ),
  //       bodyLarge: TextStyle(
  //         color: LightColors.mainColor,
  //         fontSize: 26,
  //         fontFamily: FontFamilyHelper.getFontFamily(),
  //       ),
  //     ),
  //   );
  // }

  static bool isDark(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }
}
