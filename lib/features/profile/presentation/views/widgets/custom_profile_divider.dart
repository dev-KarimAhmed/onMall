
import 'package:flutter/material.dart';
import 'package:on_mall/core/functions/get_color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Divider(
      color: getColors(context).greyColor,
      thickness: .2,
      height: .5,
      indent: 8, // Adds some spacing between the divider and the "OR" text
    );
  }
}