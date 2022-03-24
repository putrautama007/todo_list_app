import 'package:bloc/bloc.dart';

import 'package:todo_list_app/bloc/todo_event.dart';
import 'package:todo_list_app/bloc/todo_state.dart';
import 'package:todo_list_app/data/datasource/local/local_datasource.dart';
import 'package:todo_list_app/data/model/todo_model.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final LocalDataSource localDataSource;

  TodoBloc({required this.localDataSource}) : super(Initial()) {
    on<InsertTodo>(
      (event, emit) async {
        try {
          await localDataSource.insertTodoList(event.data);
          emit(const Success(message: "Insert Success"));
        } catch (e) {
          emit(Error(message: e.toString()));
        }
      },
    );

    on<GetAllTodo>(
      (_, emit) async {
        try {
          final List<TodoData> todoList = await localDataSource.getTodoList();
          if (todoList.isNotEmpty) {
            emit(HasData(data: todoList));
          } else {
            emit(const NoData(message: "Empty Todo List"));
          }
        } catch (e) {
          emit(Error(message: e.toString()));
        }
      },
    );

    on<UpdateTodo>(
      (event, emit) async {
        try {
          await localDataSource.updateTodoList(event.data);
          emit(const Success(message: "Update Success"));
        } catch (e) {
          emit(Error(message: e.toString()));
        }
      },
    );

    on<DeleteTodo>(
      (event, emit) async {
        try {
          await localDataSource.removeTodoList(event.data);
          emit(const Success(message: "Delete Success"));
        } catch (e) {
          emit(Error(message: e.toString()));
        }
      },
    );
  }
}
