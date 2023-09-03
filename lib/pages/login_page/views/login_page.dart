import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_jango_frontend/shared_widgets/custom_filled_button.dart';
import 'package:todo_jango_frontend/shared_widgets/spacing_widgets.dart';

import '../../../shared_widgets/custom_text_field.dart';
import '../controllers/login_page_controller.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AddVerticalSpacing(value: 500.h),
              Text(
                'Login',
                style: textTheme.headlineLarge,
              ),
              AddVerticalSpacing(value: 35.h),
              CustomTextField(
                editingController: controller.formController.userNameController,
                hintText: 'User Name',
              ),
              AddVerticalSpacing(value: 20.h),
              CustomTextField(
                editingController: controller.formController.passwordController,
                hintText: 'Password',
              ),
              AddVerticalSpacing(value: 25.h),
              CustomFilledButton(
                onTap: () => controller.login(),
                buttonStatus: controller.buttonStatus,
                child: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
