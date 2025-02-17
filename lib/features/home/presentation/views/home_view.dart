import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/common/widgets/custom_container_body.dart';
import 'package:on_mall/core/functions/build_header.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/translate_word.dart';
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
                      Row(
                        children: [
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
                            ? const EdgeInsets.only(left: 4.0)
                            : const EdgeInsets.only(right: 4.0),
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

List<String> images = [
  "https://cdn-icons-png.flaticon.com/128/3275/3275391.png",
  "https://cdn-icons-png.flaticon.com/128/9752/9752768.png",
  "https://cdn-icons-png.flaticon.com/128/7562/7562565.png",
];

class AutoCarouselSlider extends StatefulWidget {
  const AutoCarouselSlider({
    super.key,
  });

  @override
  AutoCarouselSliderState createState() => AutoCarouselSliderState();
}

class AutoCarouselSliderState extends State<AutoCarouselSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            return Image(
              image: NetworkImage(
                images[itemIndex],
              ), // Replace with your actual image path
            );
          },
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.easeInOutSine,
            // height: 200,
            autoPlay: images.length > 1 ? true : false,
            enableInfiniteScroll: images.length > 1 ? true : false,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.map((image) {
            int index = images.indexOf(image);
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 12.0.w,
              height: 5.0.h,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: _currentIndex == index
                    ? getColors(context).primaryColor
                    : getColors(context).greyColor,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
