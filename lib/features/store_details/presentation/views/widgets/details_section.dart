import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/common/widgets/custom_linear_button.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/translate_word.dart';
import 'package:on_mall/core/language/lang_keys.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .32,
          width: double.infinity,
          child: Card(
            color: getColors(context).cardColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            elevation: 2,
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 16,
                ),
                child: Column(children: [
                  Text(
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    "Lorem ipsum dolor sit amet" * 20,
                    style: getMediumTextStyle(context),
                  ),
                ])),
          ),
        ),
        SizedBox(height: 5.h),
        CustomLinearButton(
          width: double.infinity,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                translateWord(context, Langkeys.openStoreLocation),
                style: getLargeTextStyle(context).copyWith(
                  color: Colors.white,
                ),
              ),
              const Icon(
                Icons.location_on,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
