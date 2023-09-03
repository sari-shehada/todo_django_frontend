import 'package:get/get.dart';
import 'package:todo_jango_frontend/pages/home_page/controllers/home_page_controller.dart';
import 'package:todo_jango_frontend/pages/home_page/views/home_page.dart';
import 'package:todo_jango_frontend/pages/login_page/controllers/login_page_controller.dart';

import '../pages/login_page/views/login_page.dart';

class NavigationController {
  static void toHome({
    bool closeOtherPages = true,
  }) {
    if (closeOtherPages) {
      Get.offAll(
        () => const HomePage(),
        binding: BindingsBuilder.put(
          () => HomePageController(),
        ),
      );
      return;
    }
    Get.to(
      () => const HomePage(),
      binding: BindingsBuilder.put(
        () => HomePageController(),
      ),
    );
  }

  static void toLogin() {
    Get.offAll(
      () => const LoginPage(),
      binding: BindingsBuilder.put(
        () => LoginPageController(),
      ),
    );
  }
}
