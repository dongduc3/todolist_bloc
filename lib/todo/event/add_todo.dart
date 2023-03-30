import 'package:todolist_bloc/base/base_event.dart';

class AddTodo extends BaseEvent{
  late String content;

  AddTodo(this.content);
}