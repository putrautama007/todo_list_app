import 'package:moor_flutter/moor_flutter.dart';
import 'package:todo_list_app/local_database/todo_dao.dart';
import 'todo_table.dart';

part 'database.g.dart';

@UseMoor(tables: [Todo], daos: [TodoDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
      path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}
