import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_jango_frontend/pages/loader_page/controllers/loader_page_controller.dart';

import '../../../shared_widgets/loading_indicator.dart';
import '../../../shared_widgets/spacing_widgets.dart';

class LoaderPage extends GetView<LoaderPageController> {
  const LoaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AddVerticalSpacing(value: 300.h),
            const LoadingIndicator(),
            AddVerticalSpacing(value: 40.h),
            Text(
              'TODO App',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
