import 'dart:convert';

import 'package:get/get.dart';
import 'package:todo_jango_frontend/constants/exceptions.dart';
import 'package:todo_jango_frontend/pages/login_page/models/login_credentials.dart';
import 'package:todo_jango_frontend/services/https_service.dart';
import 'package:todo_jango_frontend/services/shared_prefs_service.dart';
import 'package:todo_jango_frontend/services/snackbar_service.dart';
import 'package:todo_jango_frontend/shared_controllers/navigation_controller.dart';
import 'package:todo_jango_frontend/shared_widgets/custom_filled_button.dart';
import '../../../constants/shared_prefs_keys.dart';
import 'login_page_form_controller.dart';

class LoginPageController extends GetxController {
  Rx<CustomButtonStatus> buttonStatus = CustomButtonStatus.enabled.obs;
  final LoginPageFormController formController = LoginPageFormController();

  Future<void> login() async {
    if (!formController.validateFields()) {
      return;
    }
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      String userId = await attemptToLogin();
      NavigationController.toHome();
      await saveUserId(userId);
    } on InvalidCredentialsException {
      SnackBarService.showSnackbar(
        'Invalid Login Credentials!',
      );
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }

  Future<String> attemptToLogin() async {
    final LoginCredentials credentials = formController.formalizeCredentials();
    String result = await HttpService.rawPost(
      endPoint: 'login/',
      body: credentials.toMap(),
    );
    var parsedResponse = jsonDecode(result);
    if (parsedResponse == false) {
      throw InvalidCredentialsException();
    }
    return parsedResponse as String;
  }

  Future<void> saveUserId(String userID) async {
    await SharedPrefsService.instance.setString(
      SharedPrefsKeys.userId,
      userID,
    );
  }
}
