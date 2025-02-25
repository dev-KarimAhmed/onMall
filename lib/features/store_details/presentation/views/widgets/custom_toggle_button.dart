import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/translate_word.dart';
import 'package:on_mall/core/language/lang_keys.dart';

class CustomButtonToggle extends StatelessWidget {
  const CustomButtonToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final int value;
  final void Function(int value) onChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<int>.size(
      borderWidth: 0,
      animationDuration: const Duration(milliseconds: 300),
      inactiveOpacity: 1,
      current: value,
      values: const [0, 1, 2],
      onChanged: (i) => onChanged(i),
      indicatorSize: Size(160.0.w, 175.0.w),
      iconBuilder: (localValue) {
        return RPadding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            localValue == 0
                ? translateWord(context, Langkeys.products)
                : localValue == 1
                    ? translateWord(context, Langkeys.storeInfo)
                    : translateWord(context, Langkeys.posts),
            style: getMediumTextStyle(context).copyWith(
              fontSize: localValue == 1 ? 12 : null,
              color: value == localValue
                  ? getColors(context).mainColor
                  : getColors(context).blackColor,
            ),
          ),
        );
      },
      style: ToggleStyle(
        indicatorGradient: LinearGradient(
          colors: [
            getColors(context).primaryColor!,
            getColors(context).gradientColor!,
          ],
        ),
        backgroundColor: getColors(context).cardColor,
      ),
    );
  }
}
