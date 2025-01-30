// Ignore the 'depend_on_referenced_packages' lint rule for this file
// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_dotenv/flutter_dotenv.dart';

// Enum to represent different environments (development and production)
// التعداد لتمثيل البيئات المختلفة (التطوير والإنتاج)
enum EnvironmentEnum { dev, prod }

class EnvVariables {
  // Private constructor to ensure singleton instance
  // منشئ خاص لضمان وجود كائن واحد فقط
  EnvVariables._();

  // Singleton instance of EnvVariables
  // كائن فردي لـ EnvVariables
  static final EnvVariables instance = EnvVariables._();
  
  // Variable to hold the environment type
  // متغير لتحديد نوع البيئة
  String envType = '';

  // Asynchronous method to initialize environment variables
  // طريقة غير متزامنة لتهيئة متغيرات البيئة
  Future<void> init({required EnvironmentEnum environment}) async {
    // Load the appropriate .env file based on the environment
    // تحميل الملف المناسب بناءً على البيئة
    switch (environment) {
      case EnvironmentEnum.dev:
        await dotenv.load(fileName: '.env.dev');
      case EnvironmentEnum.prod:
        await dotenv.load(fileName: '.env.prod');
    }
    // Retrieve the environment type from the loaded .env file
    // استرداد نوع البيئة من الملف الذي تم تحميله
    envType = dotenv.get('ENV_TYPE');
  }

  // Getter to check if the current environment is development
  // دالة لاكتشاف ما إذا كانت البيئة الحالية هي بيئة التطوير
  bool get isDev => envType == 'dev';
}