import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/common/animation/animate_do.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';

class CustomProfileRow extends StatelessWidget {
  const CustomProfileRow({
    super.key,
    this.onTap,
    required this.icon,
    required this.color,
    required this.text,
    this.subText,
    this.widget, required this.duration,
  });
  final void Function()? onTap;
  final IconData icon;
  final Color color;
  final String text;
  final String? subText;
  final Widget? widget;
  final int duration;
  @override
  Widget build(BuildContext context) {
    return CustomFadeInLeft(
      duration: duration,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          child: RPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 12,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: color.withOpacity(.3),
                  child: Icon(
                    icon,
                    color: color,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  text,
                  style: getMediumTextStyle(context),
                ),
                const Spacer(),
                Row(
                  children: [
                    if (subText != null) ...[
                      Text(subText!, style: const TextStyle(color: Colors.grey)),
                      const SizedBox(width: 10),
                    ],
                    widget ??
                         Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: getColors(context).greyColor,
                        ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}