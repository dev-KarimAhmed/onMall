import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/common/widgets/cached_image.dart';
import 'package:on_mall/core/common/widgets/custom_linear_button.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/navigations.dart';
import 'package:on_mall/core/styles/helpers/font_weight_helper.dart';
import 'package:on_mall/features/product_details/presentation/views/product_details.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateTo(context, const ProductDetailsView()),
      child: Stack(
        children: [
          Card(
            color: getColors(context).cardColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                  child: CachedImage(
                    width: double.infinity,
                    fit: BoxFit.fill,
                    height: 180.h,
                    imageUrl:
                        "https://img.freepik.com/premium-photo/person-who-attends-online-lessons-digital-screen_1193033-98.jpg?w=740",
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Product Name",
                            style: getLargeTextStyle(context),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.share,
                                  color: getColors(context).greyColor,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite,
                                  color: getColors(context).greyColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        "Lorem ipsum dolor sit amet consectetur adipiscing elit" *
                            3,
                        style: getSmallTextStyle(context),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Installment Available",
                        style: getSmallTextStyle(context).copyWith(
                          color: getColors(context).greenColor,
                          fontWeight: FontWeightHelper.bold,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "4.5 ",
                                    style: getMediumTextStyle(context),
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),
                                ],
                              ),
                              SizedBox(width: 4.w),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.store),
                              SizedBox(width: 4.w),
                              Text(
                                "Store Name",
                                style: getMediumTextStyle(context),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("25 LE",
                                  style: getMediumTextStyle(context).copyWith(
                                    fontWeight: FontWeightHelper.bold,
                                  )),
                              Text(
                                "50 LE",
                                style: getSmallTextStyle(context).copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  color: getColors(context).greyColor,
                                ),
                              ),
                            ],
                          ),
                          CustomLinearButton(
                            width: 88.w,
                            child: Text(
                              "Details",
                              style: getMediumTextStyle(context).copyWith(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 4,
            left: 4,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: getColors(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Text(
                "50% Off",
                style: getSmallTextStyle(context).copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
