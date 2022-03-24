import 'package:equatable/equatable.dart';
import 'package:todo_list_app/data/model/todo_data.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class InsertTodo extends TodoEvent {
  final TodoData todoData;

  const InsertTodo({required this.todoData});

  @override
  List<Object> get props => [todoData];
}

class GetAllTodo extends TodoEvent {}

class UpdateTodo extends TodoEvent {
  final TodoData todoData;
  final int indexData;

  const UpdateTodo({
    required this.todoData,
    required this.indexData,
  });

  @override
  List<Object> get props => [todoData, indexData];
}

class DeleteTodo extends TodoEvent {
  final int indexData;

  const DeleteTodo({
    required this.indexData,
  });

  @override
  List<Object> get props => [indexData];
}
