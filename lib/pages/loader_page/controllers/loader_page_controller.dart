import 'package:get/get.dart';
import 'package:todo_jango_frontend/services/shared_prefs_service.dart';
import 'package:todo_jango_frontend/shared_controllers/navigation_controller.dart';

import '../../../constants/shared_prefs_keys.dart';

class LoaderPageController extends GetxController {
  @override
  void onReady() {
    _performInitialLoading();
    super.onReady();
  }

  Future<void> _performInitialLoading() async {
    String? userId = SharedPrefsService.instance.getString(
      SharedPrefsKeys.userId,
    );
    if (userId == null) {
      NavigationController.toLogin();
      return;
    }
    NavigationController.toHome();
  }
}
