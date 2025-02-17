  import 'package:flutter/material.dart';
import 'package:on_mall/core/functions/translate_word.dart';
import 'package:on_mall/core/language/lang_keys.dart';
import 'package:on_mall/features/nav_bar/presentation/views/functions/build_custom_navbar_item.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

List<PersistentBottomNavBarItem> buildNavBarsItems(BuildContext context) {
    return [
      buildCustomNavBarItem(
        context: context,
        icon: Icons.home,
        title: translateWord(context, Langkeys.home),
      ),
      buildCustomNavBarItem(
        
        context: context,
        icon: Icons.store,
        title: translateWord(context, Langkeys.stores),
      ),
      buildCustomNavBarItem(
        context: context,
        icon: Icons.favorite,
        title: translateWord(context, Langkeys.favorite),
      ),
      buildCustomNavBarItem(
        context: context,
        icon: Icons.person,
        title: translateWord(context, Langkeys.profile),
      ),
    ];
  }
