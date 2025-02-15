
import 'package:flutter/material.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/translate_word.dart';
import 'package:on_mall/core/language/lang_keys.dart';

class CustomORDivider extends StatelessWidget {
  const CustomORDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 2,
            indent: 10,
            endIndent: 10, // Adjust spacing
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add spacing
          child: Text(
            translateWord(context, Langkeys.or),
            style: getBodyMediumTextStyle(context),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 2,
            indent: 10, // Adjust spacing
            endIndent: 10,
          ),
        ),
      ],
    );
  }
}
