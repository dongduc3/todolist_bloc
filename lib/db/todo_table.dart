/*
import 'package:todolist_bloc/db/todo_database.dart';
import 'package:todolist_bloc/model/todo_model.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TodoTable {
  static const TABLE_NAME = 'todo';
  static const CREATE_QUERY_TABLE = '''
      CREATE TABLE $TABLE_NAME (
      id INTEGER PRIMARY KEY,
      content TEXT
      )
  ''';
  static const DROP_TABLE_QUERY = '''
    DROP TABLE IF EXISTS $TABLE_NAME
  ''';

  Future<int> insertTodo(TodoModel todoModel) {
    final Database database = TodoDatabase.instance.database;
    return database.insert(
      TABLE_NAME,
      todoModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteTodo(TodoModel todoModel) async {
    final Database database = TodoDatabase.instance.database;

    await database.delete(
      TABLE_NAME,
      where: 'id = ?',
      whereArgs: [todoModel.id],
    );
  }

  Future<List<TodoModel>> selectAllTodo() async {
    final Database database = await da;
    var res = await database.query("todo");
     print(database.rawQuery("SELECT * FROM todo" ).toString());
    final List<TodoModel> maps = await res.isNotEmpty ? res.map((c) => TodoModel.fromMap(c)).toList() : [];

    print(maps);

    return maps;

  }
}
*/
