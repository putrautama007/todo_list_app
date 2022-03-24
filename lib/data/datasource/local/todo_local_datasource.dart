import 'package:hive/hive.dart';
import 'package:todo_list_app/data/model/todo_data.dart';
import 'package:todo_list_app/utils/local_database/hive_constants.dart';

class TodoLocalDatasource {
  const TodoLocalDatasource();

  Future<Box<TodoData>> _openTodoBox() async =>
      await Hive.openBox<TodoData>(HiveConstants.todoListBox);

  Future<void> insertTodo(TodoData todoData) async {
    final Box<TodoData> box = await _openTodoBox();
    box.add(todoData);
    box.close();
  }

  Future<void> updateTodo(int position, TodoData todoData) async {
    final Box<TodoData> box = await _openTodoBox();
    box.putAt(position, todoData);
    box.close();
  }

  Future<void> removeTodo(int position) async {
    final Box<TodoData> box = await _openTodoBox();
    box.deleteAt(position);
    box.close();
  }

  Future<List<TodoData>> getTodoList() async {
    final Box<TodoData> box = await _openTodoBox();
    final List<TodoData> todoList = box.values.toList();
    box.close();
    return todoList;
  }
}
