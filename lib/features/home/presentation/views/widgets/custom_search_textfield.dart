import 'package:flutter/material.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/language/lang_keys.dart';

import '../../../../../core/functions/translate_word.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      style: getMediumTextStyle(context),
      cursorColor: getColors(context).blackColor,
      decoration: InputDecoration(
        fillColor: getColors(context).mainColor,
        filled: true,
        hintText: translateWord(context, Langkeys.search),
        hintStyle: getSmallTextStyle(context).copyWith(
          color: getColors(context).greyColor,
        ),
        prefixIcon: const Icon(Icons.search_rounded),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: getColors(context).primaryColor!,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: getColors(context).primaryColor!,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: getColors(context).primaryColor!,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
        ),
      ),
    );
  }
}
