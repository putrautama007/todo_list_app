import 'package:equatable/equatable.dart';
import 'package:todo_list_app/data/model/todo_model.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class InsertTodo extends TodoEvent {
  final TodoData data;

  const InsertTodo({required this.data});

  @override
  List<Object> get props => [data];
}

class GetAllTodo extends TodoEvent {}

class UpdateTodo extends TodoEvent {
  final TodoData data;

  const UpdateTodo({required this.data});

  @override
  List<Object> get props => [data];
}

class DeleteTodo extends TodoEvent {
  final TodoData data;

  const DeleteTodo({required this.data});

  @override
  List<Object> get props => [data];
}
