import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:on_mall/core/functions/get_color.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 90,
        width: 90,
        child: LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,
          colors: [
            getColors(context).primaryColor!,
          ],
        ),
      ),
    );
  }
}
