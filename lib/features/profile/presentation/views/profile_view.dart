import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/app/app_cubit/app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_mall/core/common/widgets/custom_container_body.dart';
import 'package:on_mall/core/common/widgets/custom_person_avatar.dart';
import 'package:on_mall/core/functions/build_header.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/is_portrait.dart';
import 'package:on_mall/core/functions/translate_word.dart';
import 'package:on_mall/core/language/lang_keys.dart';
import 'package:on_mall/features/authentication/presentation/views/widgets/custom_divider.dart';
import 'package:on_mall/features/profile/presentation/views/widgets/custom_profile_row.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        AppCubit appCubit = context.read<AppCubit>();
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            buildHeader(context, []),
            CustomContainerBody(
              child: Column(
                children: [
                  const RSizedBox(height: 50),
                  Text(
                    "Karim Ahmed",
                    style: getMediumTextStyle(context),
                  ),
                  const RSizedBox(height: 20),
                  CustomProfileRow(
                    duration: 300,
                    onTap: () {},
                    color: const Color.fromRGBO(0, 167, 255, 1),
                    text: translateWord(context, Langkeys.editProfile),
                    icon: Icons.edit_rounded,
                  ),
                  const CustomDivider(),
                  CustomProfileRow(
                    duration: 350,
                    color: getColors(context).gradientColor!,
                    text: translateWord(context, Langkeys.language),
                    icon: Icons.translate_rounded,
                    subText: appCubit.currentLanguage == "ar"
                        ? "اللغة العربية"
                        : "English",
                    widget: Switch(
                      activeColor: getColors(context).primaryColor,
                      value: appCubit.currentLanguage == "ar",
                      onChanged: (value) {
                        if (value) {
                          appCubit.toArabic();
                        } else {
                          appCubit.toEnglish();
                        }
                      },
                    ),
                  ),
                  const CustomDivider(),
                  CustomProfileRow(
                    duration: 400,
                    color: getColors(context).primaryColor!.withOpacity(0.7),
                    text: translateWord(context, Langkeys.privacyPolicy),
                    icon: Icons.privacy_tip,
                  ),
                  const CustomDivider(),
                  CustomProfileRow(
                    duration: 450,
                    color: Colors.teal,
                    text: translateWord(context, Langkeys.aboutUs),
                    icon: Icons.info_rounded,
                  ),
                  const CustomDivider(),
                  CustomProfileRow(
                    duration: 500,
                    color: getColors(context).redColor!,
                    text: translateWord(context, Langkeys.logout),
                    icon: Icons.logout_rounded,
                  ),
                ],
              ),
            ),
            if (isPortrait(context)) ...[
              const Positioned(
                top: 70,
                child: CustomPersonAvatar(
                  raduis: 50,
                ),
              ),
            ]
          ],
        );
      },
    );
  }
}
