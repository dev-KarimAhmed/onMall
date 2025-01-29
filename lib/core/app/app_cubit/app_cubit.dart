import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'app_state.dart';
part 'app_cubit.freezed.dart';
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());

  bool isDark = true;
  String currentLanguage = 'en';
  Future<void> changeThemeMode({bool? sharedmode}) async {
    if (sharedmode != null) {
      isDark = sharedmode;
      emit(AppState.themeChangeMode(isDark: isDark));
    } else {
      isDark = !isDark;
      // await SharedPref().setBoolean(SharedPrefKeys.mode, isDark);
      emit(AppState.themeChangeMode(isDark: isDark));
    }
  }

  void getSavedLanguage() {
    final hasLanguage = SharedPref().containPreference(SharedPrefKeys.langKey);
    if (hasLanguage) {
      // currentLanguage = SharedPref().getString(SharedPrefKeys.langKey) ?? 'en';
      emit(AppState.languageChange(locale: Locale(currentLanguage)));
    } else {
      emit(const AppState.languageChange(locale: Locale('en')));
    }
  }

  Future<void> _changeLanguage({required String lang}) async {
    await SharedPref().setString(SharedPrefKeys.langKey, lang);
    currentLanguage = lang;
    emit(AppState.languageChange(locale: Locale(lang)));
  }

  void toArabic() => _changeLanguage(lang: 'ar');
  void toEnglish() => _changeLanguage(lang: 'en');
}