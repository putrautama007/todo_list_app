import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class InsertTodo extends TodoEvent {
  const InsertTodo();

  @override
  List<Object> get props => [];
}

class GetAllTodo extends TodoEvent {}

class UpdateTodo extends TodoEvent {
  const UpdateTodo();

  @override
  List<Object> get props => [];
}

class DeleteTodo extends TodoEvent {
  const DeleteTodo();

  @override
  List<Object> get props => [];
}
