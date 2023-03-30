import 'package:todolist_bloc/base/base_event.dart';
import 'package:todolist_bloc/model/todo_model.dart';

class DeleteTodo extends BaseEvent{
  TodoModel todoModel;

  DeleteTodo(this.todoModel);
}