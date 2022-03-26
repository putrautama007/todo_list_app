import 'package:todo_list_app/objectbox.g.dart';

class Database{
  Database();

  Future<Store> getInstance() async{
    Store store = await openStore();
    return store;
  }
}