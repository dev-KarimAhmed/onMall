import 'package:flutter/material.dart';

class BaseRoute extends PageRouteBuilder<dynamic> {
  final Widget page;

  BaseRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              Stack(children: [page]),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            final fadeAnimation = animation.drive(
              CurveTween(curve: Curves.easeInOut),
            );

            return FadeTransition(
              opacity: fadeAnimation,
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.9, end: 1.0).animate(fadeAnimation),
                child: child,
              ),
            );
          },
        );
}