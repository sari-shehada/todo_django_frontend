import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_jango_frontend/pages/loader_page/controllers/loader_page_binding.dart';
import 'package:todo_jango_frontend/pages/loader_page/views/loader_page.dart';
import 'package:todo_jango_frontend/services/shared_prefs_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsService.init();
  runApp(const Wrapper());
}

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      designSize: const Size(390, 844),
      child: GetMaterialApp(
        title: 'TODO App',
        home: const LoaderPage(),
        initialBinding: LoaderPageBindings(),
      ),
    );
  }
}
