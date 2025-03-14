import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:on_mall/core/functions/get_color.dart' show getColors;
import 'package:on_mall/features/favorite/presentation/views/favorite_view.dart';
import 'package:on_mall/features/home/presentation/views/home_view.dart';
import 'package:on_mall/features/profile/presentation/views/profile_view.dart';
import 'package:on_mall/features/stores/presentation/views/stores_view.dart'
    show StoresView;

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> with WidgetsBindingObserver {
  int _currentIndex = 2;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding
        .instance.platformDispatcher.views.first.viewInsets.bottom;
    if (_isKeyboardVisible != (bottomInset > 0)) {
      setState(() {
        _isKeyboardVisible = bottomInset > 0;
      });
    }
  }

  List<Widget> _buildScreens() => [
        const StoresView(),
        const FavoriteView(),
        const HomeView(),
        const ProfileView(),
      ];

  @override
  Widget build(BuildContext context) {
    final screens = _buildScreens();

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: _isKeyboardVisible
          ? null
          : CurvedNavigationBar(
              key: _bottomNavigationKey,
              index: _currentIndex,
              height: 63.0,
              items: [
                Icon(
                  Icons.favorite,
                  size: 30,
                ),
                Icon(Icons.calendar_month, size: 30),
                Icon(
                  Icons.home,
                  size: 30,
                ),
                CustomTaskIcon(
                  icon: Icons.notifications,
                ),
                CustomTaskIcon(
                  icon: Icons.shopping_cart,
                ),
              ],
              color: getColors(context).mainColor!,
              buttonBackgroundColor: const Color(0xFF1FACD1),
              
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 300),
              // onTap: (index) {
              //   setState(() {
              //     _currentIndex = index;
              //   });
              // },
              // letIndexChange: (index) => true,
            ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

class CustomTaskIcon extends StatelessWidget {
  const CustomTaskIcon({
    super.key,
    required this.icon,
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          icon,
          size: 30,
        ),
        Positioned(
          top: 0,
          right: 0,
          child: CircleAvatar(
            radius: 8,
            backgroundColor: Color(0xff9747ff),
            child: Text(
              "6",
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
              ),
            ),
          ),
        )
      ],
    );
  }
}
