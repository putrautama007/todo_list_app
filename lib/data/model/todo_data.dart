import 'package:objectbox/objectbox.dart';

@Entity()
class TodoData {
  final int id;
  final String title;
  final String description;

  TodoData({
    this.id = 0,
    required this.title,
    required this.description,
  });
}
