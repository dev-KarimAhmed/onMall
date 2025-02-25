import 'package:flutter/material.dart';
import 'package:on_mall/core/common/widgets/product_card.dart';

class BrandsList extends StatelessWidget {
  const BrandsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .5,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const CustomProductCard();
        },
        itemCount: 10,
      ),
    );
  }
}
