import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/styles/images/app_assets.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: getColors(context).primaryColor,
                    foregroundColor: getColors(context).mainColor,
                    child: categories[index].icon,
                  ),
                  const RSizedBox(height: 5),
                  Text(
                    categories[index].text,
                    style: getMediumTextStyle(context),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


//TODO : Translate them
List<Category> categories = [
  Category(
      icon: const ImageIcon(

        AssetImage(
          AppAssets.tshirt,
        ),
      ),
      text: "T-Shirt"),
  Category(
      icon: const ImageIcon(AssetImage(AppAssets.jackets)), text: "Jacket"),
  Category(icon: const ImageIcon(AssetImage(AppAssets.pants)), text: "Pants"),
  Category(icon: const ImageIcon(AssetImage(AppAssets.shoes)), text: "Shoes"),
  Category(
      icon: const ImageIcon(AssetImage(AppAssets.underwear)),
      text: "Men-Underwear"),
];

class Category {
  final Widget icon;
  final String text;

  Category({required this.icon, required this.text});
}
