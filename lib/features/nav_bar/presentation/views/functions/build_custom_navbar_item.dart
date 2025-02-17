import 'package:flutter/material.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/styles/helpers/font_weight_helper.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

PersistentBottomNavBarItem buildCustomNavBarItem({
  required String title,
  required IconData icon,
  required BuildContext context,
}) {
  return PersistentBottomNavBarItem(
    
    textStyle: getLargeTextStyle(context).copyWith(
      fontWeight: FontWeightHelper.bold,
    ),
    icon: Icon(icon),
    title: (title),
    activeColorPrimary: getColors(context).primaryColor!,
    activeColorSecondary: getColors(context).mainColor!,
    inactiveColorPrimary: getColors(context).greyColor,
  );
}
