import 'package:flutter_easyloading/flutter_easyloading.dart';

class ToastManager {
  static void show(
    String msg, {
    EasyLoadingToastPosition position = EasyLoadingToastPosition.center,
  }) {
    EasyLoading.dismiss();
    EasyLoading.showToast(msg, toastPosition: position, duration: const Duration(seconds: 2));
  }

  static void cancel() {
    EasyLoading.dismiss();
  }
}
