 import 'package:flutter/material.dart';
import 'package:on_mall/core/language/app_localization.dart';


String translateWord(BuildContext context, String langKey) {
    return AppLocalizations.of(context)!.translate(langKey).toString();
  }
  