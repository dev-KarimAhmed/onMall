import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/is_portrait.dart';

Widget buildAuthHeader(BuildContext context) {
  if (isPortrait(context)) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getColors(context).primaryColor!,
            getColors(context).gradientColor!.withOpacity(.5),
            getColors(context).gradientColor!,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Column(
        children: [
          const RSizedBox(height: 10),
          
          const RSizedBox(height: 10),
          Text(
            "OnMall",
            style: getBodyLargeTextStyle(context).copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
  return Container();
}
