
import 'package:flutter/material.dart';
import 'package:on_mall/core/functions/get_color.dart';


class CustomIconBtn extends StatelessWidget {
  const CustomIconBtn({
    super.key,
    required this.icon,
    this.onTap,
  });
  final Widget icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: getColors(context).mainColor,
        foregroundColor: getColors(context).primaryColor,
      ),
      onPressed: onTap,
      icon: icon,
    );
  }
}