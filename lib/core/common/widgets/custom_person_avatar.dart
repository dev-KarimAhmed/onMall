import 'package:flutter/material.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/styles/images/app_assets.dart';

class CustomPersonAvatar extends StatelessWidget {
  const CustomPersonAvatar({
    super.key,
    required this.raduis,
    this.onPressed,
  });
  final double raduis;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: raduis,
      backgroundColor: getColors(context).mainColor,
      child: IconButton(
        onPressed: onPressed,
        icon: const Image(
          image: AssetImage(AppAssets.user),
        ),
      ),
    );
  }
}
