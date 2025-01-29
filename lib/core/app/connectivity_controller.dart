import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

// Class to manage connectivity status
// فئة لإدارة حالة الاتصال
class ConnectivityController {
  // Private constructor to ensure singleton instance
  // منشئ خاص لضمان وجود كائن واحد فقط
  ConnectivityController._();

  // Singleton instance of ConnectivityController
  // كائن فردي لـ ConnectivityController
  static final instance = ConnectivityController._();
  
  // Notifier to track connectivity status
  // Notifier لتعقب حالة الاتصال
  ValueNotifier<bool> isConnectedNotifier = ValueNotifier(true);

  // Asynchronous method to initialize connectivity monitoring
  // طريقة غير متزامنة لتهيئة مراقبة الاتصال
  Future<void> init() async {
    // Check the current connectivity status
    // تحقق من حالة الاتصال الحالية
    final result = await Connectivity().checkConnectivity();

    // Update connectivity status
    // تحديث حالة الاتصال
    isConnected(result);

    // Listen for connectivity status changes
    // الاستماع لتغييرات حالة الاتصال
    Connectivity().onConnectivityChanged.listen(isConnected);
  }

  // Method to determine and update connectivity status
  // طريقة لتحديد وتحديث حالة الاتصال
  bool isConnected(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.none)) {
      // No connectivity
      // لا يوجد اتصال
      isConnectedNotifier.value = false;
      return false;
    } else if (result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile)) {
      // Connected via WiFi or mobile network
      // متصل عبر WiFi أو شبكة الهاتف المحمول
      isConnectedNotifier.value = true;
      return true;
    }
    return false;
  }
}