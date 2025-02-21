import 'package:flutter/material.dart';
import 'package:on_mall/core/common/widgets/product_card.dart';
import 'package:on_mall/core/functions/is_portrait.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    super.key, this.physics,  this.shrinkWrap,
  });
  final ScrollPhysics? physics;
  final bool? shrinkWrap;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: physics ?? const NeverScrollableScrollPhysics(),
      shrinkWrap: shrinkWrap ?? true,
      itemCount: (10 / (isPortrait(context) ? 1 : 2)).ceil(),
      itemBuilder: (context, index) {
        if (isPortrait(context)) {
          return const CustomProductCard();
        } else {
          return Row(
            children: [
              const Expanded(child: CustomProductCard()),
              if (index * 2 + 1 < 10)
                const Expanded(child: CustomProductCard()),
            ],
          );
        }
      },
    );
  }
}
