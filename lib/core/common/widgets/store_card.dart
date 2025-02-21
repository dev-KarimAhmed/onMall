import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/translate_word.dart';
import 'package:on_mall/core/language/lang_keys.dart';
import 'package:on_mall/core/styles/helpers/font_weight_helper.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 188.w,
      child: Card(
        color: getColors(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_active_rounded,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: CachedNetworkImageProvider(
                      "https://cdn-icons-png.flaticon.com/128/7845/7845240.png",
                    ),
                  ),
                  Text(
                    "Store Name",
                    style: getMediumTextStyle(context).copyWith(
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 20,
                      ),
                      RSizedBox(width: 5.w),
                      Text(
                        translateWord(
                          context,
                          Langkeys.kafrElsheikh,
                        ),
                        style: getMediumTextStyle(context),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "4.5",
                        style: getMediumTextStyle(context),
                      ),
                      SizedBox(width: 1.w),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
