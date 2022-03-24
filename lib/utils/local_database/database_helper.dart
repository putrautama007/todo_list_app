import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_app/data/model/todo_data.dart';

class DatabaseHelper {
  const DatabaseHelper();

  static initHive(){
     Hive.initFlutter();
     _registerAdapter();
   }

  static _registerAdapter(){
     Hive.registerAdapter(TodoDataAdapter());
   }
}
