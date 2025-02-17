import 'package:flutter/material.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/features/favorite/presentation/views/favorite_view.dart';
import 'package:on_mall/features/home/presentation/views/home_view.dart';
import 'package:on_mall/features/nav_bar/presentation/views/functions/build_nav_bar_items.dart';
import 'package:on_mall/features/profile/presentation/views/profile_view.dart';
import 'package:on_mall/features/stores/presentation/views/stores_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<StatefulWidget> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const StoresView(),
      const FavoriteView(),
      const ProfileView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      padding: const EdgeInsets.all(0),
      navBarHeight: 63,
      isVisible: true,
      confineToSafeArea: true,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: false,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      // hideOnScrollSettings: const HideOnScrollSettings(
      //   hideNavBarOnScroll: true,
      //   scrollControllers:
      // ),
      decoration: NavBarDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 247, 247, 247),
            Color.fromARGB(255, 239, 239, 239),
          ],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        colorBehindNavBar: getColors(context).mainColor!,
      ),

      context,
      controller: _controller,
      screens: _buildScreens(),
      items: buildNavBarsItems(context),
      navBarStyle: NavBarStyle.style7,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
