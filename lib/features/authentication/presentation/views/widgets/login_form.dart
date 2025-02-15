import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/common/widgets/custom_container_body.dart';
import 'package:on_mall/core/common/widgets/custom_linear_button.dart';
import 'package:on_mall/core/common/widgets/custom_text_field.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/translate_word.dart';
import 'package:on_mall/core/language/lang_keys.dart';
import 'package:on_mall/core/styles/helpers/font_weight_helper.dart';
import 'package:on_mall/features/authentication/presentation/views/widgets/custom_divider.dart';

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
  @override
  Widget build(BuildContext context) {
    return CustomContainerBody(
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
            obscureText: true,
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
                onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
          ),
          const RSizedBox(height: 15),
          InkWell(
            onTap: () {},
            child: Text(
              translateWord(context, Langkeys.forgotPassword),
              style: const TextStyle(
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ),
          const RSizedBox(height: 20),
          CustomLinearButton(
            width: double.infinity,
            child: Text(
              translateWord(context, Langkeys.login),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
          const RSizedBox(height: 15),
          Row(
            children: [
              const Expanded(
                child: Divider(
                  thickness: 2,
                  indent: 10,
                  endIndent: 10, // Adjust spacing
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0), // Add spacing
                child: Text(
                  translateWord(context, Langkeys.or),
                  style: getBodyMediumTextStyle(context),
                ),
              ),
              const Expanded(
                child: Divider(
                  thickness: 2,
                  indent: 10, // Adjust spacing
                  endIndent: 10,
                ),
              ),
            ],
          )

          // CustomEBtn(
          //   width: double.infinity,
          //   text: translate(context).loginButton,
          //   onTap: () {
          //     navigateTo(context, MainHomeView());
          //   },
          // ),
          // const RSizedBox(height: 15),
          // CustomDivider(
          //   text: translate(context).or,
          // ),
          // const RSizedBox(height: 15),
          // CustomEBtn(
          //   bgColor: const Color.fromARGB(68, 146, 146, 146),
          //   frColor: isDarkTheme(context)
          //       ? AppColors.whiteColor
          //       : AppColors.blackColor,
          //   width: double.infinity,
          //   text: '',
          //   onTap: () {},
          //   mainWidget: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text(
          //         translate(context).orLoginWith,
          //         style: FontTheme.subHeading,
          //       ),
          //       const RSizedBox(width: 10),
          //       const Image(
          //         image: AssetImage(AssetsData.google),
          //         width: 20,
          //       ),
          //     ],
          //   ),
          // ),
          // const RSizedBox(height: 15),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       translate(context).dontHaveAccount,
          //       style: FontTheme.subHeading,
          //     ),
          //     CustomTextButton(
          //       color: isDarkTheme(context)
          //           ? AppColors.darkPrimaryColor
          //           : AppColors.lightPrimaryColor,
          //       text: translate(context).signUp,
          //       onTap: () => navigateTo(context,  const RegisterView()),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
