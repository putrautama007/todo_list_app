import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/bloc/todo_bloc.dart';
import 'package:todo_list_app/data/datasource/todo_local_datasource.dart';
import 'package:todo_list_app/local_database/database.dart';
import 'package:todo_list_app/ui/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(
        todoLocalDatasource: const TodoLocalDatasource(
          database: Database(),
        ),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TodoScreen(),
      ),
    );
  }
}
