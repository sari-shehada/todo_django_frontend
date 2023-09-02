import 'package:get/get.dart';

import 'loader_page_controller.dart';

class LoaderPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      LoaderPageController(),
    );
  }
}
