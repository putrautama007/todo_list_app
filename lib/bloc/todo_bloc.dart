import 'package:bloc/bloc.dart';

import 'package:todo_list_app/bloc/todo_event.dart';
import 'package:todo_list_app/bloc/todo_state.dart';
import 'package:todo_list_app/data/datasource/todo_local_datasource.dart';
import 'package:todo_list_app/data/model/todo_data.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoLocalDatasource todoLocalDatasource;

  TodoBloc({
    required this.todoLocalDatasource,
  }) : super(Initial()) {
    on<InsertTodo>(
      (event, emit) async {
        try {
          await todoLocalDatasource.insertTodoList(event.todoData);
          emit(const Success(message: "Insert Success"));
        } catch (e) {
          emit(Error(message: e.toString()));
        }
      },
    );

    on<GetAllTodo>(
      (_, emit) async {
        try {
          final List<TodoData> todoList =
              await todoLocalDatasource.getAllTodoList();

          if (todoList.isNotEmpty) {
            emit(HasData(todoList: todoList));
          } else {
            emit(const NoData(message: 'Empty todo list'));
          }
        } catch (e) {
          emit(Error(message: e.toString()));
        }
      },
    );

    on<UpdateTodo>(
      (event, emit) async {
        try {
          await todoLocalDatasource.updateTodoList(event.todoData);
          emit(const Success(message: "Update Success"));
        } catch (e) {
          emit(Error(message: e.toString()));
        }
      },
    );

    on<DeleteTodo>(
      (event, emit) async {
        try {
          await todoLocalDatasource.deleteTodoList(event.id);
          emit(const Success(message: "Delete Success"));
        } catch (e) {
          emit(Error(message: e.toString()));
        }
      },
    );
  }
}
