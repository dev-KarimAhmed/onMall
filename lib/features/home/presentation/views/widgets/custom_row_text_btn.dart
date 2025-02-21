import 'package:flutter/material.dart';
import 'package:on_mall/core/common/widgets/custom_linear_button.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/translate_word.dart';
import 'package:on_mall/core/language/lang_keys.dart';

class CustomTextRowBttn extends StatelessWidget {
  const CustomTextRowBttn({
    super.key,
    required this.text,
    required this.onpressed,
  });
  final String text;
  final void Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: getMediumTextStyle(context),
        ),
        CustomLinearButton(
          onPressed: onpressed,
          width: MediaQuery.sizeOf(context).width * 0.3,
          height: 36,
          child: Text(
            translateWord(context, Langkeys.showAll),
            style: getMediumTextStyle(context).copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}