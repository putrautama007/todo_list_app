import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/bloc/todo_bloc.dart';
import 'package:todo_list_app/bloc/todo_event.dart';
import 'package:todo_list_app/bloc/todo_state.dart';
import 'package:todo_list_app/widget/card/card_todo.dart';
import 'package:todo_list_app/widget/snackbar/custom_snackbar.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  Future<Future> _displayDialog(
      BuildContext context, bool isUpdate, Object? data) async {
    if (data == null) {
      _titleController.text = "";
      _descController.text = "";
    } else {
      _titleController.text = "data.title";
      _descController.text = "data.description";
    }
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a task to your list'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(hintText: 'Enter task title'),
              ),
              TextField(
                controller: _descController,
                decoration: const InputDecoration(hintText: 'Enter task desc'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: isUpdate ? const Text("Update") : const Text("Add"),
              onPressed: () {
                Navigator.pop(context);
                if (isUpdate) {
                  context.read<TodoBloc>().add(
                        const UpdateTodo(
                            ),
                      );
                } else {
                  context.read<TodoBloc>().add(
                        const InsertTodo(
                        ),
                      );
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(GetAllTodo());
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _displayDialog(context, false, null),
      ),
      body: BlocListener<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state is Success) {
            CustomSnackBar.showSuccess(state.message, context);
            context.read<TodoBloc>().add(GetAllTodo());
          } else if (state is Error) {
            CustomSnackBar.showError(state.message, context);
          }
        },
        child: Center(
          child: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is HasData) {
                return Container();
                // return ListView.builder(
                //   itemCount: state.data.length,
                //   itemBuilder: (context, index) => CardTodo(
                //     index: index,
                //     data: state.data[index],
                //     editPressed: () =>
                //         _displayDialog(context, true, state.data[index]),
                //   ),
                // );
              } else if (state is NoData) {
                return Text(state.message);
              } else if (state is Error) {
                return Text(state.message);
              } else {
                return const Text("No State");
              }
            },
          ),
        ),
      ),
    );
  }
}
