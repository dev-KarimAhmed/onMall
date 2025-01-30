// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:on_mall/core/app/bloc_observer.dart';
import 'package:on_mall/core/di/dependency_injection.dart';
import 'package:on_mall/core/services/shared_prefs/shared_pref_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_mall/on_mall.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Future.wait([
    SharedPref().instantiatePreferences(),
    // EnvVariables.instance.init(environment: EnviromentEnum.development, ),
  ]);

  setupInjection();

  runApp(const OnMall());
}