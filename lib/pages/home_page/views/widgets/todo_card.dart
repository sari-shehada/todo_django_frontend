import 'package:flutter/material.dart';

import '../../../../models/todo/todo.dart';

class TODOCard extends StatelessWidget {
  const TODOCard({
    super.key,
    required this.todo,
  });

  final TODO todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      subtitle: Text(todo.details),
      trailing:
          todo.isFinished ? const Icon(Icons.check) : const SizedBox.shrink(),
    );
  }
}
