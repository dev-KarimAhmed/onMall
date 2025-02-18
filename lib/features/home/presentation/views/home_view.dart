import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/common/widgets/cached_image.dart';
import 'package:on_mall/core/common/widgets/custom_container_body.dart';
import 'package:on_mall/core/functions/build_header.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/translate_word.dart';
import 'package:on_mall/features/home/presentation/views/widgets/custom_carousel.dart';
import 'package:on_mall/features/home/presentation/views/widgets/custom_icon.dart';

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
            Padding(
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
                            "Welcome",
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
                  TextFormField(
                    keyboardType: TextInputType.text,
                    style: getMediumTextStyle(context),
                    cursorColor: getColors(context).blackColor,
                    decoration: InputDecoration(
                      fillColor: getColors(context).mainColor,
                      filled: true,
                      hintText: "Search",
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
                  ),
                ],
              ),
            ),
          ]),
          CustomContainerBody(
            isKeyboardVisibleAgain: isKeyboardVisible,
            height: isKeyboardVisible
                ? MediaQuery.sizeOf(context).height * .30
                : MediaQuery.sizeOf(context).height * .68,
            child: const Column(
              children: [
                RSizedBox(height: 10),
                AutoCarouselSlider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

