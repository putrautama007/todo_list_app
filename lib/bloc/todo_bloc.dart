import 'package:bloc/bloc.dart';

import 'package:todo_list_app/bloc/todo_event.dart';
import 'package:todo_list_app/bloc/todo_state.dart';
import 'package:todo_list_app/local_database/database.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final AppDatabase appDatabase;

  TodoBloc({required this.appDatabase}) : super(Initial()) {
    on<InsertTodo>(
      (event, emit) async {
        try {
          await appDatabase.todoDao.insertTodo(event.data);
          emit(const Success(message: "Insert Success"));
        } catch (e) {
          emit(Error(message: e.toString()));
        }
      },
    );

    on<GetAllTodo>(
      (_, emit) async {
        try {
          final List<TodoData> todo = await appDatabase.todoDao.getAllTodo();
          if (todo.isEmpty) {
            emit(const NoData(message: "Todo Empty"));
          } else {
            emit(HasData(data: todo));
          }
        } catch (e) {
          emit(Error(message: e.toString()));
        }
      },
    );

    on<UpdateTodo>(
      (event, emit) async {
        try {
          await appDatabase.todoDao.updateTodo(event.data);
          emit(const Success(message: "Update Success"));
        } catch (e) {
          emit(Error(message: e.toString()));
        }
      },
    );

    on<DeleteTodo>(
      (event, emit) async {
        try {
          await appDatabase.todoDao.deleteTodo(event.data);
          emit(const Success(message: "Delete Success"));
        } catch (e) {
          emit(Error(message: e.toString()));
        }
      },
    );
  }
}
