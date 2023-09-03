import 'package:flutter/material.dart';
import 'package:todo_jango_frontend/services/snackbar_service.dart';

import '../models/login_credentials.dart';

class LoginPageFormController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? getValidationMessage() {
    if (userNameController.text.isEmpty) {
      return 'Please fill "User Name" Field';
    }
    if (passwordController.text.isEmpty) {
      return 'Please fill "Password" Field';
    }
    return null;
  }

  bool validateFields() {
    String? validationMessage = getValidationMessage();
    if (validationMessage != null) {
      displayErrorMessageSnackbar(validationMessage);
      return false;
    }
    return true;
  }

  LoginCredentials formalizeCredentials() {
    return LoginCredentials(
      userName: userNameController.text,
      password: passwordController.text,
    );
  }

  void displayErrorMessageSnackbar(String message) {
    SnackBarService.showSnackbar(message);
  }
}
