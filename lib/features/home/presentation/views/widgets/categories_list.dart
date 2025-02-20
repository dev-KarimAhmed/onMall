import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/translate_word.dart';
import 'package:on_mall/core/language/lang_keys.dart';
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
        itemCount: categories(context).length,
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
                    child: categories(context)[index].icon,
                  ),
                  const RSizedBox(height: 5),
                  Text(
                    categories(context)[index].text,
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

List<Category> categories(BuildContext context) => [
      Category(
          icon: const ImageIcon(
            AssetImage(
              AppAssets.tshirt,
            ),
          ),
          text: translateWord(context, Langkeys.tshirt)),
      Category(
          icon: const ImageIcon(
            AssetImage(AppAssets.jackets),
          ),
          text: translateWord(context, Langkeys.jackets)),
      Category(
          icon: const ImageIcon(
            AssetImage(AppAssets.pants),
          ),
          text: translateWord(context, Langkeys.pants)),
      Category(
          icon: const ImageIcon(
            AssetImage(AppAssets.shoes),
          ),
          text: translateWord(context, Langkeys.shoes)),
      Category(
          icon: const ImageIcon(
            AssetImage(AppAssets.underwear),
          ),
          text: translateWord(context, Langkeys.menUnderwear)),
      Category(
          icon: const ImageIcon(
            AssetImage(AppAssets.hoodie),
          ),
          text: translateWord(context, Langkeys.hoodie)),
      Category(
          icon: const ImageIcon(
            AssetImage(AppAssets.sweater),
          ),
          text: translateWord(context, Langkeys.sweater)),
      Category(
          icon: const ImageIcon(
            AssetImage(AppAssets.cap),
          ),
          text: translateWord(
              context, Langkeys.hat)), // Changed from "Cap" to "Hat"
      Category(
          icon: const ImageIcon(
            AssetImage(AppAssets.dress),
          ),
          text: translateWord(context, Langkeys.dress)),
      Category(
          icon: const ImageIcon(
            AssetImage(AppAssets.shorts),
          ),
          text: translateWord(context, Langkeys.shorts)),
      Category(
          icon: const ImageIcon(
            AssetImage(AppAssets.skirt),
          ),
          text: translateWord(context, Langkeys.skirt)),
      Category(
          icon: const ImageIcon(
            AssetImage(AppAssets.socks),
          ),
          text: translateWord(context, Langkeys.socks)),
      Category(
          icon: const ImageIcon(
            AssetImage(AppAssets.suit),
          ),
          text: translateWord(context, Langkeys.suit)),
    ];

class Category {
  final Widget icon;
  final String text;

  Category({required this.icon, required this.text});
}
