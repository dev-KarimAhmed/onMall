
import 'package:flutter/material.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/translate_word.dart';
import 'package:on_mall/core/styles/helpers/font_weight_helper.dart';

class CustomTextBtn extends StatelessWidget {
  const CustomTextBtn({
    super.key, required this.onPressed, required this.text,
  });
  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        translateWord(context, text),
        style: getLargeTextStyle(context).copyWith(
          color: getColors(context).primaryColor,
          fontWeight: FontWeightHelper.bold,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.solid,
          decorationColor: getColors(context).primaryColor,
        ),
      ),
    );
  }
}
