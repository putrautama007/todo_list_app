import 'package:sqflite/sqflite.dart';
import 'package:todo_list_app/data/model/todo_model.dart';
import 'package:todo_list_app/utils/local_database/database_helper.dart';
import 'package:todo_list_app/utils/strings/app_strings.dart';

class LocalDataSource {
  final DatabaseHelper databaseHelper;

  LocalDataSource({
    required this.databaseHelper,
  });

  Future<int> insertTodoList(TodoData todoModel) async {
    final Database? database = await databaseHelper.database;
    return await database!
        .insert(AppStrings.todoListDatabase, todoModel.toJson());
  }

  Future<int> updateTodoList(TodoData todoModel) async {
    final Database? database = await databaseHelper.database;
    return await database!.update(
      AppStrings.todoListDatabase,
      todoModel.toJson(),
      where: "id = ?",
      whereArgs: [todoModel.id],
    );
  }

  Future<int> removeTodoList(TodoData todoModel) async {
    final Database? database = await databaseHelper.database;
    return await database!.delete(
      AppStrings.todoListDatabase,
      where: 'id = ?',
      whereArgs: [todoModel.id],
    );
  }

  Future<List<TodoData>> getTodoList() async {
    final Database? database = await databaseHelper.database;
    final List<Map<String, dynamic>> results =
        await database!.query(AppStrings.todoListDatabase);

    return results.map((data) => TodoData.fromMap(data)).toList();
  }

  Future<TodoData> getTodoListById(int id) async {
    final Database? database = await databaseHelper.database;
    final List<Map<String, dynamic>> results = await database!.query(
      AppStrings.todoListDatabase,
      where: 'id = ?',
      whereArgs: [id],
    );

    return TodoData.fromMap(results.first);
  }
}
