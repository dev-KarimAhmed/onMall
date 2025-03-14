import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/functions/get_color.dart';
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
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: const NetworkImage(
                      "https://cdn-icons-png.flaticon.com/128/16683/16683419.png",
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
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
                ],
              ),
              const Spacer(),
              IconButton(
                icon: Image.asset('assets/images/icons/icon.png'),
                iconSize: 50,
                onPressed: () {},
              )
            ],
          ),
          const RSizedBox(height: 20),
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      getColors(context).primaryColor!,
                      getColors(context).gradientColor!,
                    ],
                  ),
                ),
                child: IconButton(
                  icon: Image.asset('assets/images/icons/mage_filter.png'),
                  iconSize: 80,
                  onPressed: () {},
                ),
              ),
              SizedBox(width: 10),
              Expanded(child: const CustomSearchTextField()),
            ],
          ),
        ],
      ),
    );
  }
}
