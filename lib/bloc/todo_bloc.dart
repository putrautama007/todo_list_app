import 'package:bloc/bloc.dart';

import 'package:todo_list_app/bloc/todo_event.dart';
import 'package:todo_list_app/bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(Initial()) {
    on<InsertTodo>(
      (event, emit) async {
        try {
          emit(const Success(message: "Insert Success"));
        } catch (e) {
          emit(Error(message: e.toString()));
        }
      },
    );

    on<GetAllTodo>(
      (_, emit) async {
        try {} catch (e) {
          emit(Error(message: e.toString()));
        }
      },
    );

    on<UpdateTodo>(
      (event, emit) async {
        try {
          emit(const Success(message: "Update Success"));
        } catch (e) {
          emit(Error(message: e.toString()));
        }
      },
    );

    on<DeleteTodo>(
      (event, emit) async {
        try {
          emit(const Success(message: "Delete Success"));
        } catch (e) {
          emit(Error(message: e.toString()));
        }
      },
    );
  }
}
