import 'dart:async';
import 'dart:math';

import 'package:todolist_bloc/base/base_bloc.dart';
import 'package:todolist_bloc/db/todo_database.dart';
import 'package:todolist_bloc/db/todo_table.dart';
import 'package:todolist_bloc/model/todo_model.dart';

import '../base/base_event.dart';
import '../todo/event/add_todo.dart';
import '../todo/event/delete_todo.dart';

class TodoBloc extends BaseBloc {
  final StreamController<List<TodoModel>> _todoListController =
      StreamController<List<TodoModel>>();

  Stream<List<TodoModel>> get streamTodoList => _todoListController.stream;

  var idTodo = Random();
  List<TodoModel> listTodo = <TodoModel>[];

  final TodoDatabase _todoTable = TodoDatabase();

   initTodo() async {
    listTodo = await _todoTable.getAllTodo();
    /*if(listTodo == null){
      return;
    }*/
    _todoListController.sink.add(listTodo);
  }

  void _addTodo(TodoModel todoModel) async {
    await _todoTable.insertTodo(todoModel);

    listTodo.add(todoModel);
    _todoListController.sink.add(listTodo);
  }

  void _deleteTodo(TodoModel todoModel) async {
    await _todoTable.deleteTodo(todoModel);

    listTodo.remove(todoModel);
    _todoListController.sink.add(listTodo);
  }

  @override
  void baseEvent(BaseEvent event) {
    if (event is AddTodo) {
      TodoModel todoModel = TodoModel.fromData(idTodo.nextInt(100), event.content);
      _addTodo(todoModel);
    } else if (event is DeleteTodo) {
      _deleteTodo(event.todoModel);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _todoListController.close();
  }
}
