import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/common/animation/animate_do.dart';
import 'package:on_mall/core/common/widgets/custom_container_body.dart';
import 'package:on_mall/core/common/widgets/custom_linear_button.dart';
import 'package:on_mall/core/common/widgets/custom_text_field.dart';
import 'package:on_mall/core/extensions/context_extension.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/translate_word.dart';
import 'package:on_mall/core/language/lang_keys.dart';
import 'package:on_mall/core/routes/app_routes.dart';
import 'package:on_mall/core/styles/helpers/font_weight_helper.dart';
import 'package:on_mall/features/authentication/presentation/views/widgets/custom_btn_with_image.dart';
import 'package:on_mall/features/authentication/presentation/views/widgets/custom_or_divider.dart';
import 'package:on_mall/features/authentication/presentation/views/widgets/custom_text_btn.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool secureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomContainerBody(
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
              translateWord(context, Langkeys.login),
              style: getBodyLargeTextStyle(context).copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const RSizedBox(height: 20),
            CustomTextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email),
              hintText: translateWord(context, Langkeys.email),
            ),
            const RSizedBox(height: 15),
            CustomTextField(
              controller: passwordController,
              hintText: translateWord(context, Langkeys.password),
              keyboardType: TextInputType.visiblePassword,
              obscureText: secureText,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() => secureText = !secureText);
                  },
                  icon: Icon(secureText
                      ? Icons.visibility_off
                      : Icons.remove_red_eye)),
            ),
            const RSizedBox(height: 20),
            InkWell(
              onTap: () => context.pushNamed(AppRoutes.forgotPasswordScreen),
              child: Text(
                translateWord(context, Langkeys.forgotPassword),
                style: getLargeTextStyle(context).copyWith(
                  fontWeight: FontWeightHelper.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const RSizedBox(height: 20),
            CustomLinearButton(
              width: double.infinity,
              child: Text(
                translateWord(context, Langkeys.login),
                style: getLargeTextStyle(context).copyWith(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                context.pushNamed(AppRoutes.navBarView);
              },
            ),
            const RSizedBox(height: 15),
            const CustomORDivider(),
            const RSizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonWithImage(
                  imagePath: 'assets/images/core/google.png',
                  text: Langkeys.signInWithGoogle,
                  onPressed: () {},
                ),
                const RSizedBox(width: 5),
                CustomButtonWithImage(
                  imagePath: 'assets/images/core/hacker.png',
                  text: Langkeys.signInAnonymously,
                  onPressed: () {},
                ),
              ],
            ),
            const RSizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  translateWord(context, Langkeys.dontHaveAnAccount),
                  style: getMediumTextStyle(context),
                ),
                const RSizedBox(width: 5),
                CustomTextBtn(
                  text: Langkeys.register,
                  onPressed: () => context.pushNamed(AppRoutes.registerScreen),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
