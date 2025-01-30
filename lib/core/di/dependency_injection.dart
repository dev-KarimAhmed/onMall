import 'package:get_it/get_it.dart';
import 'package:on_mall/core/app/app_cubit/app_cubit.dart';

final sl = GetIt.instance;


void setupInjection() {
  _initInjection();
}

void _initInjection() {
   sl.registerFactory(AppCubit.new);
}