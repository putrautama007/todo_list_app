import 'package:moor_flutter/moor_flutter.dart';
import 'package:todo_list_app/local_database/database.dart';
import 'package:todo_list_app/local_database/todo_table.dart';

part 'todo_dao.g.dart';

@UseDao(tables: [Todo])
class TodoDao extends DatabaseAccessor<AppDatabase> with _$TodoDaoMixin {
  TodoDao(AppDatabase db) : super(db);

  Future insertTodo(TodoData data) =>
      into(todo).insert(data, mode: InsertMode.insertOrReplace);

  Future<List<TodoData>> getAllTodo() => select(todo).get();

  Future updateTodo(TodoData data) => update(todo).replace(data);

  Future deleteTodo(TodoData data) => delete(todo).delete(data);
}
