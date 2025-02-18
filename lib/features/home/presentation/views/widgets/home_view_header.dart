import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/functions/translate_word.dart';
import 'package:on_mall/features/home/presentation/views/widgets/custom_icon.dart';
import 'package:on_mall/features/home/presentation/views/widgets/custom_search_textfield.dart';

import '../../../../../core/functions/get_text_style.dart';
import '../../../../../core/language/lang_keys.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 8,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translateWord(context, Langkeys.welcome),
                    style: getLargeTextStyle(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "UserName",
                    style: getMediumTextStyle(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CustomIconBtn(
                icon: Stack(
                  children: [
                    const Icon(Icons.notifications_none_outlined),
                    Positioned(
                      left: 13,
                      bottom: 15,
                      child: Container(
                        width: 6,
                        height: 6,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ],
          ),
          const RSizedBox(height: 20),
          const CustomSearchTextField(),
        ],
      ),
    );
  }
}
