import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/is_portrait.dart';
import 'package:on_mall/core/functions/translate_word.dart';

Widget buildHeader(BuildContext context, List<Widget> children,
    {String? imgUrl}) {
  if (isPortrait(context)) {
    return SafeArea(
      child: Stack(
        children: [
          // Background container with image
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.35,
            decoration: BoxDecoration(
              image: imgUrl != null
                  ? DecorationImage(
                      image: CachedNetworkImageProvider(imgUrl),
                      fit: BoxFit
                          .cover, // Ensures the image covers the entire area
                    )
                  : null,
              gradient: LinearGradient(
                colors: [
                  getColors(context).primaryColor!,
                  getColors(context).gradientColor!,
                ],
              ),
            ),
          ),

          // Positioned back arrow at the top left
          if (imgUrl != null) ...[
            Positioned(
              top: 8.0.h,
              left: !isEnglish(context) ? null : 12.0.w,
              right: !isEnglish(context) ? 12.0.w : null,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: getColors(context).mainColor,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: getColors(context).blackColor,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pop(); // This will go back to the previous screen
                  },
                ),
              ),
            ),
            Positioned(
              top: 8.0.h,
              right: !isEnglish(context) ? null : 12.0.w,
              left: !isEnglish(context) ? 12.0.w : null,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: getColors(context).mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(
                      "Subscribed",
                      style: getSmallTextStyle(context)
                          .copyWith(color: getColors(context).blackColor),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.notifications_active_rounded,
                      color: getColors(context).blackColor,
                      size: 17,
                    ),
                  ],
                ),
              ),
            ),
          ],

          // Any other widgets or content you want to overlay on top of the image
          Column(
            children: children, // Your other widgets or content
          ),
        ],
      ),
    );
  }
  return Container();
}
