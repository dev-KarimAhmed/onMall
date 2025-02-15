import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/common/animation/animate_do.dart';
import 'package:on_mall/core/common/widgets/custom_container_body.dart';
import 'package:on_mall/core/common/widgets/custom_linear_button.dart';
import 'package:on_mall/core/common/widgets/custom_text_field.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/translate_word.dart';
import 'package:on_mall/core/language/lang_keys.dart';
import 'package:on_mall/features/authentication/presentation/views/functions/builde_auth_header.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            buildAuthHeader(context),
            CustomContainerBody(
              child: CustomFadeInUp(
                duration: 500,
                child: Column(
                  children: [
                    // const Image(
                    //   image: AssetImage(AppAssets.shoping),
                    //   width: 100,
                    // ),
                    const RSizedBox(height: 15),
                    Text(
                      translateWord(context, Langkeys.forgotPassword),
                      style: getBodyLargeTextStyle(context).copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const RSizedBox(height: 20),
                    CustomTextField(
                      controller: _controller,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email),
                      hintText: translateWord(context, Langkeys.email),
                    ),

                    const RSizedBox(height: 20),
                    CustomLinearButton(
                      width: double.infinity,
                      child: Text(
                        translateWord(context, Langkeys.submit),
                        style: getLargeTextStyle(context).copyWith(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
