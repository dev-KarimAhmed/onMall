import 'package:flutter/material.dart';
import 'package:on_mall/core/functions/translate_word.dart';
import 'package:on_mall/core/services/shared_prefs/pref_keys.dart';
import 'package:on_mall/core/services/shared_prefs/shared_pref_service.dart';

class FontFamilyHelper {
  static const String arabicFont = 'Cairo';
  static const String englishFont = 'Poppins';

  static String getFontFamily() {
    final currentLanguage = SharedPref().getString(SharedPrefKeys.langKey);
    if (currentLanguage == 'ar' || currentLanguage == null) {
      return arabicFont;
    } else {
      return englishFont;
    }
  }
}
