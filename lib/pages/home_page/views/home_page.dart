import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_jango_frontend/pages/home_page/controllers/home_page_controller.dart';
import 'package:todo_jango_frontend/pages/home_page/views/widgets/todo_card.dart';
import 'package:todo_jango_frontend/shared_widgets/loading_indicator.dart';

import '../../../models/todo/todo.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addTODO(),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          'TODO App',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: SizedBox.expand(
        child: Obx(
          () => FutureBuilder(
            future: controller.todos.value,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: LoadingIndicator(),
                );
              }
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                List<TODO> todos = snapshot.data!;
                return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    TODO todo = todos[index];
                    return TODOCard(todo: todo);
                  },
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text("error"),
                );
              }
              return const Center(
                child: Text('No Data'),
              );
            },
          ),
        ),
      ),
    );
  }
}
