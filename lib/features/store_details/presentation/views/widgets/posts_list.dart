
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/features/store_details/presentation/views/widgets/social_media_card.dart';

class PostsList extends StatelessWidget {
  const PostsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const SocialMediaPostCard();
        },
        itemCount: 10,
      ),
    );
  }
}

