import 'package:hive/hive.dart';
import 'package:todo_list_app/utils/local_database/hive_constants.dart';
part 'todo_data.g.dart';

@HiveType(typeId: HiveConstants.todoListType)
class TodoData {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  TodoData({
    required this.title,
    required this.description,
  });
}
