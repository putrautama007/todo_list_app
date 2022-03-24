import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/bloc/todo_bloc.dart';
import 'package:todo_list_app/data/datasource/local/todo_local_datasource.dart';
import 'package:todo_list_app/ui/todo_screen.dart';
import 'package:todo_list_app/utils/local_database/database_helper.dart';

void main() {
  DatabaseHelper.initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(
        todoLocalDatasource: const TodoLocalDatasource(),
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
