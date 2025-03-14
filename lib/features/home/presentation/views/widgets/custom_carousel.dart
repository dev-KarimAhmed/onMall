import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/common/widgets/cached_image.dart';
import 'package:on_mall/core/functions/get_color.dart';

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
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedImage(
                imageUrl: images[itemIndex],
                fit: BoxFit.contain,
              ),
            );
          },
          options: CarouselOptions(
            height: 135.h,
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

List<String> images = [
  "https://cdn-icons-png.flaticon.com/128/3275/3275391.png",
  "https://cdn-icons-png.flaticon.com/128/9752/9752768.png",
  "https://cdn-icons-png.flaticon.com/128/7562/7562565.png",
];
