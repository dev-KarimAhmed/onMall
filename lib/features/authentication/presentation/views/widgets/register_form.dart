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
import 'package:on_mall/features/authentication/presentation/views/widgets/custom_btn_with_image.dart';
import 'package:on_mall/features/authentication/presentation/views/widgets/custom_or_divider.dart';
import 'package:on_mall/features/authentication/presentation/views/widgets/custom_text_btn.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController nameController = TextEditingController();
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
              translateWord(context, Langkeys.register),
              style: getBodyLargeTextStyle(context).copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const RSizedBox(height: 20),
            CustomTextField(
              controller: nameController,
              keyboardType: TextInputType.name,
              prefixIcon: const Icon(Icons.person),
              hintText: translateWord(context, Langkeys.name),
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
              obscureText: true,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() => secureText = !secureText);
                },
                icon: Icon(
                    secureText ? Icons.visibility_off : Icons.remove_red_eye),
              ),
            ),
            const RSizedBox(height: 20),
            CustomLinearButton(
              width: double.infinity,
              child: Text(
                translateWord(context, Langkeys.register),
                style: getLargeTextStyle(context).copyWith(
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
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
                  translateWord(context, Langkeys.haveAnAccount),
                  style: getMediumTextStyle(context),
                ),
                const RSizedBox(width: 5),
                CustomTextBtn(
                  text: Langkeys.login,
                  onPressed: () => context.pop(),
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
    nameController.dispose();
    super.dispose();
  }
}
