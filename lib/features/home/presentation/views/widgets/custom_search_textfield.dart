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
        suffixIcon: Padding(
          padding: !isEnglish(context)
              ? const EdgeInsets.only(
                  left: 2.0,
                  bottom: 2,
                  top: 2,
                )
              : const EdgeInsets.only(
                  right: 2.0,
                  bottom: 2,
                  top: 2,
                ),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: getColors(context).primaryColor,
              foregroundColor: getColors(context).mainColor,
            ),
            onPressed: () {},
            label: const Icon(Icons.filter_list_rounded),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: getColors(context).primaryColor!,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(36),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: getColors(context).primaryColor!,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(36),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: getColors(context).primaryColor!,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(36),
          ),
        ),
      ),
    );
  }
}
