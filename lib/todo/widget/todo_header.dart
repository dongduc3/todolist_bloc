import 'package:flutter/material.dart';
import 'package:todolist_bloc/bloc/todo_bloc.dart';
import 'package:provider/provider.dart';

import '../event/add_todo.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final bloc = Provider.of<TodoBloc>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: "Add Todo",
                hintText: "Add Todo",
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              bloc.event.add(AddTodo(textController.text));
              textController.clear();
            },
            icon: const Icon(Icons.add),
            label: const Text("Add"),
          )
        ],
      ),
    );
  }
}
