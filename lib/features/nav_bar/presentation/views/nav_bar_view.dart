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
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.platformDispatcher.onMetricsChanged = _onMetricsChanged;
  }

  void _onMetricsChanged() {
    final bottomInset = WidgetsBinding.instance.platformDispatcher.views.first.viewInsets.bottom;
    if (_isKeyboardVisible != (bottomInset > 0)) {
      setState(() {
        _isKeyboardVisible = bottomInset > 0;
      });
    }
  }

  List<Widget> _buildScreens() => const [
        HomeView(),
        StoresView(),
        FavoriteView(),
        ProfileView(),
      ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      padding: EdgeInsets.zero,
      navBarHeight: 63,
      isVisible: !_isKeyboardVisible,
      confineToSafeArea: true,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      hideNavigationBarWhenKeyboardAppears: true,
      stateManagement: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      decoration: NavBarDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF7F7F7), Color(0xFFEFEFEF)],
        ),
        borderRadius: BorderRadius.circular(8),
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
    WidgetsBinding.instance.platformDispatcher.onMetricsChanged = null;
    _controller.dispose();
    super.dispose();
  }
}
