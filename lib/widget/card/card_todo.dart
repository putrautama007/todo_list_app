import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/bloc/todo_bloc.dart';
import 'package:todo_list_app/bloc/todo_event.dart';

class CardTodo extends StatelessWidget {
  final int index;
  final Function() editPressed;

  const CardTodo({
    Key? key,
    required this.index,
    required this.editPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${index + 1}'),
          radius: 20,
        ),
        title: const Text("title"),
        subtitle: const Text("description"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: editPressed,
              color: Colors.green,
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () {
                context.read<TodoBloc>().add(const DeleteTodo());
              },
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
