import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/common/widgets/store_card.dart';

class HorizontalStoresList extends StatelessWidget {
  const HorizontalStoresList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 158.h,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const StoreCard();
        },
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
