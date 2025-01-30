import 'package:flutter/material.dart';
import 'package:on_mall/core/styles/colors/light_colors.dart';


class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.mainColor,
    required this.primaryColor,
    required this.gradientColor,
    required this.redColor,
    required this.blackColor,
    required this.greyColor,
    required this.greenColor,
    required this.cardColor
  });

  final Color? mainColor;
  final Color? primaryColor;
  final Color? gradientColor;
  final Color? redColor;
  final Color? blackColor;
  final Color? greyColor;
  final Color? greenColor;
  final Color? cardColor;


  @override
  ThemeExtension<MyColors> copyWith({
   Color? mainColor,
   Color? primaryColor,
   Color? gradientColor,
   Color? redColor,
   Color? blackColor,
   Color? greyColor,
   Color? greenColor,
   Color? cardColor,
  }) {
    return MyColors(
      mainColor: mainColor,
      primaryColor: primaryColor,
      gradientColor: gradientColor,
      cardColor: cardColor,
      redColor: redColor,
      blackColor: blackColor,
      greyColor: greyColor,
      greenColor: greenColor
    );
  }

  @override
  ThemeExtension<MyColors> lerp(
    covariant ThemeExtension<MyColors>? other,
    double t,
  ) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      mainColor: mainColor,
      primaryColor: primaryColor,
      gradientColor: gradientColor,
      cardColor: cardColor,
      redColor: redColor,
      blackColor: blackColor,
      greyColor: greyColor,
      greenColor: greenColor
    );
  }

  // static const MyColors dark = MyColors(
  //   mainColor: DarkColors.mainColor,
  //   primaryColor: DarkColors.primaryColor,
  //   gradientColor: DarkColors.linearGradient,
  //   cardColor: DarkColors.cardColor,
    
  //   // bluePinkDark: DarkColors.blueDark,
  //   // bluePinkLight: DarkColors.blueLight,
  //   // textColor: DarkColors.white,
  //   // textFormBorder: DarkColors.blueLight,
  //   // navBarbg: DarkColors.navBarDark,
  //   // navBarSelectedTab: DarkColors.white,
  //   // containerShadow1: DarkColors.black1,
  //   // containerShadow2: DarkColors.black2,
  //   // containerLinear1: DarkColors.black1,
  //   // containerLinear2: DarkColors.black2,
  // );

  static const MyColors light = MyColors(
    mainColor: LightColors.mainColor,
    primaryColor: LightColors.primaryColor,
    gradientColor: LightColors.gradientColor,
    blackColor: LightColors.blackColor,
    greyColor: LightColors.greyColor,
    greenColor: LightColors.greenColor,
    redColor: LightColors.redColor,
    cardColor: LightColors.cardColor,
  );
}