import 'package:flutter/material.dart';
import 'package:todolist_bloc/bloc/todo_bloc.dart';
import 'package:todolist_bloc/db/todo_database.dart';
import 'package:todolist_bloc/todo/widget/todo_component.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await TodoDatabase.db.initDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<TodoBloc>.value(
      value:
          TodoBloc()
        ,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Bloc Todo List"),
          ),
          body: const MyTodoListPage(
            title: "My Todo List",
          ),
        ),
      ),
    );
  }
}
