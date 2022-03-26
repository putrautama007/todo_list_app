import 'package:equatable/equatable.dart';
import 'package:todo_list_app/data/model/todo_data.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class Initial extends TodoState {}

class Error extends TodoState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}

class Success extends TodoState {
  final String message;

  const Success({required this.message});

  @override
  List<Object> get props => [message];
}

class NoData extends TodoState {
  final String message;

  const NoData({required this.message});

  @override
  List<Object> get props => [message];
}

class HasData extends TodoState {
  final List<TodoData> todoList;

  const HasData({
    required this.todoList,
  });

  @override
  List<Object> get props => [todoList];
}
