import 'package:flutter/material.dart';
import 'package:on_mall/core/common/animation/animate_do.dart';
import 'package:on_mall/core/common/widgets/custom_linear_button.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/translate_word.dart';
import 'package:on_mall/core/language/lang_keys.dart';
import 'package:on_mall/core/styles/helpers/font_weight_helper.dart';
import 'package:on_mall/core/styles/images/app_assets.dart';
import 'package:on_mall/features/on_boarding/views/widgets/custom_lang_dropmenu.dart';
import 'package:on_mall/features/on_boarding/views/widgets/on_boarding_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (int index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: [
                OnboardingPage(
                  imagePath: AppAssets.onboardingImageOne,
                  title: translateWord(context, Langkeys.headline1),
                  subtitle: translateWord(context, Langkeys.subtitle1),
                ),
                OnboardingPage(
                  imagePath: AppAssets.onboardingImageTwo,
                  title: translateWord(context, Langkeys.headline2),
                  subtitle: translateWord(context, Langkeys.subtitle2),
                ),
              ],
            ),
            Positioned(
              top: 10,
              left: !isEnglish(context) ? null : 10,
              right: !isEnglish(context) ? 10 : null,
              child: const CustomLanguageDropmenu(),
            ),
            Positioned(
              top: 10,
              left: !isEnglish(context) ? 10 : null,
              right: !isEnglish(context) ? null : 10,
              child: CustomFadeInLeft(
                duration: 300,
                child: CustomLinearButton(
                  width: 88,
                  onPressed: () {},
                  child: Text(
                    translateWord(context, Langkeys.skip),
                    style: getBodyMediumTextStyle(context).copyWith(
                      color: getColors(context).mainColor,
                      fontWeight: FontWeightHelper.bold,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 25,
              right: !isEnglish(context) ? 20 : null,
              left: !isEnglish(context) ? null : 20,
              child: SmoothPageIndicator(
                controller: pageController,
                count: 2,
                effect: ExpandingDotsEffect(
                  activeDotColor: getColors(context).primaryColor!,
                ),
                onDotClicked: (int index) {
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
              ),
            ),
            Positioned(
              bottom: 15,
              left: !isEnglish(context) ? 15 : null,
              right: !isEnglish(context) ? null : 15,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: getColors(context).mainColor,
                  backgroundColor: getColors(context).primaryColor,
                  shape: const CircleBorder(),
                ),
                onPressed: () {
                  if (currentPage == 1) {
                    // navigateWithoutBack(context, const LoginView());
                  } else {
                    pageController.animateToPage(
                      currentPage + 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
