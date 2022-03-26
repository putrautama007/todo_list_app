import 'package:todo_list_app/data/model/todo_data.dart';
import 'package:todo_list_app/local_database/database.dart';
import 'package:todo_list_app/objectbox.g.dart';

class TodoLocalDatasource {
  final Database database;

  const TodoLocalDatasource({
    required this.database,
  });

  Future<int> insertTodoList(TodoData todoData) async {
    Store store = await database.getInstance();
    int resultId = store.box<TodoData>().put(todoData);
    store.close();
    return resultId;
  }

  Future<int> updateTodoList(TodoData todoData) async {
    Store store = await database.getInstance();
    int resultId = store.box<TodoData>().put(todoData);
    store.close();
    return resultId;
  }

  Future<bool> deleteTodoList(int id) async {
    Store store = await database.getInstance();
    bool result = store.box<TodoData>().remove(id);
    store.close();
    return result;
  }

  Future<List<TodoData>> getAllTodoList() async {
    Store store = await database.getInstance();
    List<TodoData> result = store.box<TodoData>().getAll();
    store.close();
    return result;
  }
}
