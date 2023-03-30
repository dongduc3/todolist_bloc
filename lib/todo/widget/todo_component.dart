import 'package:flutter/material.dart';
import 'package:todolist_bloc/todo/widget/todo_header.dart';
import 'package:todolist_bloc/todo/widget/todo_list.dart';

class MyTodoListPage extends StatefulWidget {
  const MyTodoListPage({super.key, required this.title});

  final String title;

  @override
  State<MyTodoListPage> createState() => _MyTodoListPageState();
}

class _MyTodoListPageState extends State<MyTodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TodoHeader(),
        TodoListItem(),
      ],
    );
  }
}
