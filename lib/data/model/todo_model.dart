class TodoData {
  final int? id;
  final String? title;
  final String? description;

  TodoData({
    this.id,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
      };

  factory TodoData.fromMap(Map<String, dynamic> map) => TodoData(
        id: map['id'],
        title: map['title'],
        description: map['description'],
      );
}
