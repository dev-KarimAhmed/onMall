import 'package:flutter/material.dart';
import 'package:on_mall/core/functions/get_color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return  Divider(
      color: getColors(context).primaryColor,
      thickness: 1.5,
      indent: 35,
      endIndent: 35,
    );
  }
}