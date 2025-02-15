
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/common/widgets/custom_linear_button.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/translate_word.dart';

class CustomButtonWithImage extends StatelessWidget {
  const CustomButtonWithImage({
    super.key,
    required this.onPressed,
    required this.imagePath,
    required this.text,
  });
  final void Function() onPressed;
  final String imagePath;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomLinearButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const RSizedBox(width: 5),
            Text(
              translateWord(context, text),
              style: getMediumTextStyle(context).copyWith(
                color: Colors.white,
                fontSize: 12.sp,
              ),
            ),
            const RSizedBox(width: 5),
            Image(
              image: AssetImage(imagePath),
              width: 20,
            ),
            const RSizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
