import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_mall/core/app/app_cubit/app_cubit.dart';
import 'package:on_mall/core/common/animation/animate_do.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/styles/colors/light_colors.dart';

class CustomLanguageDropmenu extends StatelessWidget {
  const CustomLanguageDropmenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<AppCubit>(context);
        return CustomFadeInLeft(
          duration: 300,
          child: DropdownButton(
            dropdownColor:LightColors.mainColor,
            // Initial Value
            value: cubit.currentLanguage,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: <DropdownMenuItem<String>>[
              DropdownMenuItem(
                value: 'ar',
                child: Text(
                  'اللغة العربية',
                  style: getBodyMediumTextStyle(context),
                ),
              ),
              DropdownMenuItem(
                value: 'en',
                child: Text(
                  'English',
                  style: getBodyMediumTextStyle(context),
                ),
              ),
            ],
            onChanged: (String? newValue) {
              newValue == 'ar' ? cubit.toArabic() : cubit.toEnglish();
            },
          ),
        );
      },
    );
  }
}