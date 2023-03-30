import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:todolist_bloc/db/todo_table.dart';
import 'package:todolist_bloc/model/todo_model.dart';

class TodoDatabase {
  /*static const DB_NAME = 'todo.db';
  static const DB_VERSION = 1;*/
  TodoDatabase._();

  TodoDatabase();

  static final TodoDatabase db = TodoDatabase._();

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  //TodoDatabase();


  /*static const initScript = [TodoTable.CREATE_QUERY_TABLE];
  static const migrationScript = [TodoTable.CREATE_QUERY_TABLE];*/

  initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "Todo.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int ver) async {
      await db.execute("CREATE TABLE Todo ("
          "id INTEGER PRIMARY KEY,"
          "content TEXT"
          ")");
    });
    /*_database = await openDatabase(

      join(await getDatabasesPath(), DB_NAME),
      onCreate: (db, ver) {
        initScript.forEach((script) async {
          return await database.execute(script);
        });
      },
      onUpgrade: (db, oldVer, newVer) {
        migrationScript.forEach((script) async {
          return await database.execute(script);
        });
      },
      version: DB_VERSION,
    );*/
  }

  Future<List<TodoModel>> getAllTodo() async {
    final db = await database;
    var res = await db?.query("Todo");
    List<TodoModel> listTodo =
        res!.isNotEmpty ? res.map((e) => TodoModel.fromMap(e)).toList() : [];
    return listTodo;
  }

  Future<void> deleteTodo(TodoModel todoModel) async {
    final db = await database;

    await db?.delete(
      "Todo",
      where: "id = ?",
      whereArgs: [todoModel.id],
    );
  }

  Future<int> insertTodo(TodoModel item) async{ //returns number of items inserted as an integer

    final db = await database; //open database

    return db!.insert("Todo", item.toMap(), //toMap() function from MemoModel
      conflictAlgorithm: ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }
}
