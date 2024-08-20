import 'dart:convert';

class TodoModel {
  final int id;
  final String title;
  final bool isCompleted;

  TodoModel({
    required this.id,
    required this.title,
    required this.isCompleted,
  });
  TodoModel copyWith({
    int? id,
    String? title,
    bool? isCompleted,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  factory TodoModel.fromJson(Map<String, dynamic> jsonData) {
    return TodoModel(
      id: jsonData['id'],
      title: jsonData['title'],
      isCompleted: jsonData['is_completed'],
    );
  }

  static Map<String, dynamic> toMap(TodoModel todoModel) => {
        'id': todoModel.id,
        'title': todoModel.title,
        'is_completed': todoModel.isCompleted,
      };

  static String encode(List<TodoModel> todos) => json.encode(
        todos
            .map<Map<String, dynamic>>((todo) => TodoModel.toMap(todo))
            .toList(),
      );

  static List<TodoModel> decode(String todos) =>
      (json.decode(todos) as List<dynamic>)
          .map<TodoModel>((item) => TodoModel.fromJson(item))
          .toList();
}
