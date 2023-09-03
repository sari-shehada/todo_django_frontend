import 'dart:convert';

import 'package:todo_jango_frontend/models/todo/todo.dart';
import 'package:todo_jango_frontend/services/https_service.dart';

class TODOApiHelper {
  static Future<List<TODO>> getAll() async {
    return await HttpService.parsedGet<List<TODO>>(
      endPoint: '',
      mapper: (response) {
        return (jsonDecode(response) as List)
            .map(
              (e) => TODO.fromMap(e),
            )
            .toList();
      },
    );
  }
}
