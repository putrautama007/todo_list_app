import 'package:objectbox/objectbox.dart';

@Entity()
class TodoData {
  int id;
  String title;
  String description;

  TodoData({
    this.id = 0,
    required this.title,
    required this.description,
  });
}
