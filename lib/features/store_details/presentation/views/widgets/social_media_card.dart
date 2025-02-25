import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/common/widgets/cached_image.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/styles/helpers/font_weight_helper.dart';

class SocialMediaPostCard extends StatelessWidget {
  const SocialMediaPostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: getColors(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.all(12.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User info row
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    backgroundImage: const NetworkImage(
                      "https://static.independent.co.uk/2022/05/14/16/newFile.jpg",
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    "Store Name",
                    style: getMediumTextStyle(context).copyWith(
                      fontWeight: FontWeightHelper.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),

              // Caption
              Text(
                "Enjoying the beautiful Brands!",
                style: getSmallTextStyle(context),
              ),
              SizedBox(height: 10.h),

              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedImage(
                  imageUrl:
                      "https://static.independent.co.uk/2022/05/14/16/newFile.jpg",
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10.h),

              // Interaction buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {},
                      ),
                      Text(
                        "12",
                        style: getSmallTextStyle(context),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.comment_outlined),
                        onPressed: () {},
                      ),
                      Text(
                        "3",
                        style: getSmallTextStyle(context),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
