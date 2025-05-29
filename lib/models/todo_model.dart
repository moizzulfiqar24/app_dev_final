// Model for Todo item
class Todo {
  final String id;
  final String title;
  final String description;

  Todo({
    required this.id,
    required this.title,
    required this.description,
  });

  factory Todo.fromMap(Map<String, dynamic> data, String documentId) {
    return Todo(
      id: documentId,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }
}
