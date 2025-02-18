import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/common/widgets/custom_container_body.dart';
import 'package:on_mall/core/common/widgets/custom_linear_button.dart';
import 'package:on_mall/core/functions/build_header.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/translate_word.dart';
import 'package:on_mall/core/language/lang_keys.dart';
import 'package:on_mall/core/styles/helpers/font_weight_helper.dart';
import 'package:on_mall/features/home/presentation/views/widgets/categories_list.dart';
import 'package:on_mall/features/home/presentation/views/widgets/custom_carousel.dart';
import 'package:on_mall/features/home/presentation/views/widgets/home_view_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver {
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding
        .instance.platformDispatcher.views.first.viewInsets.bottom;
    setState(() {
      isKeyboardVisible = bottomInset > 0;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          buildHeader(context, [
            const HomeViewHeader(),
          ]),
          CustomContainerBody(
            isKeyboardVisibleAgain: isKeyboardVisible,
            height: isKeyboardVisible
                ? MediaQuery.sizeOf(context).height * .30
                : MediaQuery.sizeOf(context).height * .68,
            child: Column(
              children: [
                const RSizedBox(height: 10),
                const AutoCarouselSlider(),
                const RSizedBox(height: 10),
                const RSizedBox(height: 10),
                const CategoriesList(),
                const RSizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      translateWord(context, Langkeys.subscribed),
                      style: getMediumTextStyle(context),
                    ),
                    CustomLinearButton(
                      onPressed: () {},
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      height: 36,
                      child: Text(
                        translateWord(context, Langkeys.showAll),
                        style: getMediumTextStyle(context).copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const RSizedBox(height: 10),
                SizedBox(
                  height: 158.h,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                        "https://cdn-icons-png.flaticon.com/128/7845/7845240.png",
                                      ),
                                    ),
                                    Text(
                                      "Store Name",
                                      style:
                                          getMediumTextStyle(context).copyWith(
                                        fontWeight: FontWeightHelper.medium,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on_outlined,
                                          size: 20,
                                        ),
                                        RSizedBox(width: 5.w),
                                        Text(
                                          "Sohag",
                                          style: getLargeTextStyle(context),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "4.5",
                                          style: getLargeTextStyle(context),
                                        ),
                                        SizedBox(width: 5.w),
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          // size: 15,
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
                    },
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
