import 'package:get/get.dart';

class SnackBarService {
  static Future<void> showSnackbar(String message) async {
    Get.rawSnackbar(
      message: message,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
    );
  }
}
