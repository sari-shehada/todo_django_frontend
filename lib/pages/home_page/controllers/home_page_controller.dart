import 'package:get/get.dart';
import 'package:todo_jango_frontend/constants/shared_prefs_keys.dart';
import 'package:todo_jango_frontend/models/todo/todo_api_helper.dart';
import 'package:todo_jango_frontend/models/todo/todo_post_dto.dart';
import 'package:todo_jango_frontend/services/https_service.dart';
import 'package:todo_jango_frontend/services/shared_prefs_service.dart';

import '../../../models/todo/todo.dart';

class HomePageController extends GetxController {
  late Rx<Future<List<TODO>>> todos;

  @override
  void onInit() {
    todos = getTODOs().obs;
    super.onInit();
  }

  Future<List<TODO>> getTODOs() async {
    return TODOApiHelper.getAll();
  }

  Future<void> addTODO() async {
    String myId =
        SharedPrefsService.instance.getString(SharedPrefsKeys.userId)!;
    int finalCount = await todos.value.then((value) => value.length);
    TODOPostDTO dto = TODOPostDTO(
      title: 'TODO ${++finalCount}',
      details: 'Details',
      isFinished: false,
      postedBy: myId,
    );
    await HttpService.rawPost(
      endPoint: 'post/',
      body: dto.toMap(),
    );
    refreshList();
  }

  void refreshList() => todos.value = getTODOs();
}
