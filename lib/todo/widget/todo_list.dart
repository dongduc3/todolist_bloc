import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_bloc/bloc/todo_bloc.dart';
import 'package:todolist_bloc/model/todo_model.dart';

import '../event/delete_todo.dart';

class TodoListItem extends StatefulWidget {
  const TodoListItem({Key? key}) : super(key: key);

  @override
  State<TodoListItem> createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    var bloc = Provider.of<TodoBloc>(context);
    bloc.initTodo();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<TodoBloc>(
        builder: (context, bloc, child) => StreamBuilder<List<TodoModel>>(
          stream: bloc.streamTodoList,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text("${snapshot.data![index].content}"),
                      trailing: GestureDetector(
                        onTap: () {
                          bloc.event.add(DeleteTodo(snapshot.data![index]));
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                      ),
                    );
                  },
                );
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: Text("Empty"),
                );
              case ConnectionState.done:
                // TODO: Handle this case.
                break;
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
